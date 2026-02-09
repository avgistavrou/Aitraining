# Understanding & Editing VBA Code

## Opening the Code

You've recorded a macro - but what did Excel actually create? Let's look under the hood!

**To view your macro code:**

1. Press **Alt+F11** (opens Visual Basic Editor)
2. In the left panel, find your workbook → **Modules** → **Module1**
3. Double-click **Module1**

You'll see the code Excel generated from your recording!

## What the Recorded Code Looks Like

Here's what Excel created when you recorded `FormatTensileTable`:

```vba
Sub FormatTensileTable()
' Formats imported UTM data table
' Keyboard Shortcut: Ctrl+Shift+F

    Range("A6").Select
    ActiveCell.Value = "Time (s)"
    Range("B6").Select
    ActiveCell.Value = "Load (N)"
    Range("C6").Select
    ActiveCell.Value = "Extension (mm)"
    Range("D6").Select
    ActiveCell.Value = "Displacement (mm)"
    Range("A6:D6").Select
    Selection.Font.Bold = True
    Selection.HorizontalAlignment = xlCenter
    Selection.Interior.Color = RGB(173, 216, 230)
    Range("A7:D100").Select
    Selection.NumberFormat = "0.00"
    Range("A6:D100").Select
    Selection.Borders.LineStyle = xlContinuous
    Columns("A:D").AutoFit
End Sub
```

**Let's decode this!**

## VBA Basics

### Structure

Every macro follows this pattern:

```vba
Sub MacroName()
    ' Comments explain what the code does
    Statement1
    Statement2
    ...
End Sub
```

- `Sub` = Subroutine (a named block of code)
- `MacroName` = What you called it
- Lines between `Sub` and `End Sub` = The actions
- Lines starting with `'` = Comments (Excel ignores these)

### Key VBA Building Blocks

| VBA Term | What It Means | Example |
|----------|---------------|---------|
| **Range** | A cell or group of cells | `Range("A1")` = cell A1 |
| **Value** | The content of a cell | `Range("A1").Value = "Hello"` |
| **Property** | A setting or attribute | `.Font.Bold`, `.Interior.Color` |
| **Method** | An action to perform | `.Select`, `.Delete`, `.Copy` |

### Reading the Code

Let's break down one line:

```vba
Range("B6").Value = "Load (N)"
```

- `Range("B6")` = Cell B6
- `.Value` = The content property
- `=` = Set to
- `"Load (N)"` = This text

**Translation:** "Put the text 'Load (N)' into cell B6"

Another example:

```vba
Selection.Font.Bold = True
```

- `Selection` = Whatever is currently selected
- `.Font.Bold` = The bold property of the font
- `= True` = Turn it on

**Translation:** "Make the selected cells bold"

## The Problem with Recorded Code

Excel's recorder is functional but not elegant. Look at this:

```vba
Range("A6").Select
ActiveCell.Value = "Time (s)"
```

**Why this is inefficient:**

1. Selects cell A6 (visual action)
2. Types into the active cell (A6)

**Better approach:**

```vba
Range("A6").Value = "Time (s)"
```

Just put the value directly! No need to select first.

### Why Remove .Select?

**Recorded code:**
```vba
Range("A1").Select
ActiveCell.Value = "Hello"
Range("B1").Select
ActiveCell.Value = "World"
```

**Improved code:**
```vba
Range("A1").Value = "Hello"
Range("B1").Value = "World"
```

**Benefits:**

- ✅ Runs faster (no screen flicker)
- ✅ Easier to read
- ✅ More reliable (doesn't depend on what's selected)
- ✅ Professional coding standard

## Editing Your Macro

Let's improve the recorded code step-by-step!

### Problem 1: Fixed Row Count

**Current code:**
```vba
Range("A7:D100").Select
Selection.NumberFormat = "0.00"
```

This only formats 100 rows. What if you have 200? Or only 20?

**Solution - Make it dynamic:**

```vba
Dim lastRow As Long
lastRow = Cells(Rows.Count, "B").End(xlUp).Row
Range("A7:D" & lastRow).NumberFormat = "0.00"
```

**What this does:**

- `Dim lastRow As Long` - Create a variable to store the row number
- `Cells(Rows.Count, "B").End(xlUp).Row` - Find the last row with data in column B
- `Range("A7:D" & lastRow)` - Use that row number in the range

!!! tip "Understanding LastRow Logic"
    `End(xlUp)` works like pressing `Ctrl+Up Arrow` - it jumps to the last non-empty cell. Starting from the very bottom (Rows.Count), this finds your last data row!

### Problem 2: Too Many .Select Statements

**Current code:**
```vba
Range("A6:D6").Select
Selection.Font.Bold = True
Selection.HorizontalAlignment = xlCenter
Selection.Interior.Color = RGB(173, 216, 230)
```

**Improved code:**
```vba
With Range("A6:D6")
    .Font.Bold = True
    .HorizontalAlignment = xlCenter
    .Interior.Color = RGB(173, 216, 230)
End With
```

**Benefits of `With...End With`:**

- Cleaner code (write `Range("A6:D6")` once, not four times)
- Faster execution
- Easier to change (modify one line if you want different range)

### Your Improved Macro

Here's the same macro after editing:

```vba
Sub FormatTensileTable_Improved()
' Improved version: dynamic range, no .Select, better performance

    Dim lastRow As Long
    
    ' Add units to headers (row 6)
    Range("A6").Value = "Time (s)"
    Range("B6").Value = "Load (N)"
    Range("C6").Value = "Extension (mm)"
    Range("D6").Value = "Displacement (mm)"
    
    ' Format header row
    With Range("A6:D6")
        .Font.Bold = True
        .Font.Size = 11
        .HorizontalAlignment = xlCenter
        .Interior.Color = RGB(0, 112, 192)  ' Blue
        .Font.Color = RGB(255, 255, 255)    ' White text
    End With
    
    ' Find last row dynamically
    lastRow = Cells(Rows.Count, "B").End(xlUp).Row
    
    ' Format data area (starts row 7)
    If lastRow >= 7 Then
        Range("A7:D" & lastRow).NumberFormat = "0.000"
        Range("A7:D" & lastRow).HorizontalAlignment = xlCenter
    End If
    
    ' Add borders to entire table
    Range("A6:D" & lastRow).Borders.LineStyle = xlContinuous
    
    ' Auto-fit columns
    Columns("A:D").AutoFit
    
    MsgBox "Table formatted! Rows: " & lastRow, vbInformation
    
End Sub
```

**What changed:**

✓ Dynamic row count (works for any data size)  
✓ Removed all `.Select` statements  
✓ Used `With` blocks for efficiency  
✓ Added white text on blue headers (more professional)  
✓ Added safety check (`If lastRow >= 7`)  
✓ Added user feedback (message box)

## Try It Yourself

!!! example "Edit Your Macro"
    **Task:** Modify your `FormatTensileTable` macro to:
    
    1. Press **Alt+F11** to open VBA Editor
    2. Find your macro code
    3. Change the header background colour from light blue to **green**: `RGB(0, 176, 80)`
    4. Change data decimal places from **2** to **4**: `"0.0000"`
    5. Press **Ctrl+S** to save
    6. Close VBA Editor (click the X)
    7. Test your edited macro!
    
    **Success:** Headers should now be green and data shows 4 decimal places.

## Common VBA Elements

Here are the building blocks you'll use most often:

### Working with Cells

```vba
' Different ways to reference cells
Range("A1").Value = 100              ' Direct reference
Cells(1, 1).Value = 100              ' Row, column numbers
Range("A1:C10").Value = 0            ' Range of cells

' Read a value
Dim temperature As Double
temperature = Range("B5").Value      ' Get value from B5
```

### Formatting

```vba
' Font formatting
Range("A1").Font.Bold = True
Range("A1").Font.Size = 14
Range("A1").Font.Color = RGB(255, 0, 0)  ' Red

' Cell formatting
Range("A1").Interior.Color = RGB(255, 255, 0)  ' Yellow background
Range("A1").NumberFormat = "0.000"   ' 3 decimal places
Range("A1").HorizontalAlignment = xlCenter  ' Center text
```

### Borders

```vba
' Add borders to a range
Range("A1:D10").Borders.LineStyle = xlContinuous

' Thicker border around table
Range("A1:D10").BorderAround _
    LineStyle:=xlContinuous, _
    Weight:=xlMedium, _
    Color:=RGB(0, 0, 0)
```

## The Visual Basic Editor (VBE)

### Key Components

**Project Explorer (Left Panel):**

- Shows all open workbooks and their modules
- Your macros are stored in **Modules**

**Code Window (Centre):**

- Where you view and edit VBA code
- Each module can contain multiple macros

**Immediate Window (Bottom):**

- Press **Ctrl+G** to show it
- Test code snippets
- Print values for debugging

### Useful VBE Shortcuts

| Shortcut | Action |
|----------|--------|
| **F5** | Run current macro |
| **F8** | Step through code line-by-line |
| **F9** | Set breakpoint (pause here when running) |
| **Ctrl+G** | Show Immediate Window |
| **Ctrl+F** | Find text in code |
| **Ctrl+H** | Find and replace |

## Testing Your Edits

!!! danger "Always Save First!"
    Before running edited code:
    
    1. **Save your workbook** (`Ctrl+S`)
    2. Make sure you have a backup
    3. Test on dummy data, not your real experiment results!
    
    Remember: `Ctrl+Z` doesn't reliably undo macro changes!

**Testing process:**

1. Make your edits in VBA Editor
2. Press **Ctrl+S** to save
3. Close VBA Editor
4. Run the macro (keyboard shortcut or menu)
5. Check the results
6. If wrong, close without saving and try again!

## Common Editing Mistakes

### Mistake 1: Forgetting Quotes

```vba
' ❌ Wrong - Excel thinks Time is a variable
Range("A1").Value = Time

' ✅ Correct - Text needs quotes
Range("A1").Value = "Time"
```

### Mistake 2: Wrong Object

```vba
' ❌ Wrong - Cells doesn't have .Font property
Cells.Font.Bold = True

' ✅ Correct - Range has .Font property
Range("A1:D1").Font.Bold = True
```

### Mistake 3: Missing End Statement

```vba
' ❌ Wrong - With must have End With
With Range("A1")
    .Font.Bold = True

Sub NextMacro()  ' Error!
```

```vba
' ✅ Correct - Properly closed
With Range("A1")
    .Font.Bold = True
End With
```

## Quick Reference: VBA Syntax

```vba
' Variable declaration
Dim variableName As DataType
Dim count As Integer
Dim width As Double
Dim name As String

' Assignment
count = 10
width = 20.5
name = "Specimen A"

' Conditionals
If count > 5 Then
    MsgBox "More than 5"
End If

' Loops
For i = 1 To 10
    Cells(i, 1).Value = i
Next i

' Message boxes
MsgBox "Hello!"
MsgBox "Value: " & count
```

## What You've Learned

✓ How to open the VBA Editor (Alt+F11)  
✓ How to read basic VBA code structure  
✓ Why `.Select` is unnecessary (and how to remove it)  
✓ How to make ranges dynamic (`lastRow`)  
✓ How to edit and test your improvements safely

## Try It Yourself

!!! example "Editing Challenge"
    Modify your macro to add a **thick outer border** around the table:
    
    **Add this code** after the borders line:
    
    ```vba
    Range("A6:D" & lastRow).BorderAround _
        LineStyle:=xlContinuous, _
        Weight:=xlMedium, _
        Color:=RGB(0, 0, 0)
    ```
    
    **Test it:**Run the macro - you should see a bold black border around the whole table!

## Next: Hands-On Exercise

Time to apply what you've learned! You'll record and edit a macro to format specimen data professionally.

[Continue to Exercise 1 →](05-exercise-1.md){ .md-button .md-button--primary }

---

[← Back to Recording](03-recording-first-macro.md) | [Home](index.md)
