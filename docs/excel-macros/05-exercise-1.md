# Exercise 1: Format Specimen Data

Time to apply what you've learned! This hands-on exercise will reinforce the recording and editing skills from the previous sections.

## The Challenge

You have a raw data file with specimen measurements that needs professional formatting. Your task is to create a macro that automates this formatting.

!!! example "Exercise 1: Format Specimen Data"
    ### Your Task
    
    Create a macro that formats raw specimen data professionally.
    
    **Target Sheet:** `Exercise1_Raw` in [Tensile_Test_Sample.xlsx](Tensile_Test_Sample.xlsx)
    
    **Requirements:**
    
    1. **Add headers:**
       - A1: "Specimen No"
       - B1: "Width (mm)"
       - C1: "Thickness (mm)"
       - D1: "CSA (mm²)"
       - E1: "Young's Modulus (GPa)"
    
    2. **Format header row:**
       - Bold text
       - Centre alignment
       - Light blue background `RGB(173, 216, 230)`
    
    3. **Format data:**
       - 3 decimal places for columns B:E
       - Borders around entire table
       - Auto-fit columns
    
    **Macro name:** `FormatSpecimenData`  
    **Shortcut:** `Ctrl+Shift+F`

## Step-by-Step Instructions

### 1. Download and Open the File

1. Download [Tensile_Test_Sample.xlsx](Tensile_Test_Sample.xlsx)
2. Open it in Excel
3. Navigate to the `Exercise1_Raw` sheet
4. You should see raw data without formatting

### 2. Record the Macro

**Start Recording:**

1. **Developer** → **Record Macro**
2. Name: `FormatSpecimenData`
3. Shortcut: `Ctrl+Shift+F`
4. Store in: **This Workbook**
5. Click **OK** (recording starts!)

**Perform These Actions:**

!!! tip "Record Carefully"
    Excel is recording every action. Work methodically!

**Headers (add units):**

- Click A1, type: `Specimen No`, press Enter
- Click B1, type: `Width (mm)`, press Enter
- Click C1, type: `Thickness (mm)`, press Enter
- Click D1, type: `CSA (mm²)`, press Enter
- Click E1, type: `Young's Modulus (GPa)`, press Enter

**Format Headers:**

- Select A1:E1 (click A1, drag to E1)
- Click **Bold** button (or Ctrl+B)
- Click **Center** align button
- Click **Fill Color** → Choose light blue

**Format Data:**

- Select B2:E7 (or select B2, press Ctrl+Shift+End to select to last cell)
- Right-click → **Format Cells**
- Category: **Number**
- Decimal places: **3**
- Click **OK**

**Add Borders:**

- Select A1:E7 (entire table)
- **Home** → **Borders** → **All Borders**

**Auto-fit:**

- Select columns A:E (click column A header, drag to E)
- Double-click any column divider (between letters at top)

**Stop Recording:**

3. **Developer** → **Stop Recording**

### 3. Test Your Macro

!!! warning "Save First!"
    **File** → **Save As** → Save as **`.xlsm`** format!

**Test it:**

1. Press `Ctrl+Z` repeatedly to undo formatting (get back to raw data)
2. Press `Ctrl+Shift+F` (your macro shortcut)
3. Watch Excel format everything automatically!

## Bonus Challenge: Edit to Improve

Ready to level up? Let's improve the code!

!!! example "Bonus Challenge"
    **Task:** Edit the macro to make it more robust
    
    ### Steps:
    
    1. Press **Alt+F11** (open VBA Editor)
    2. Find your `FormatSpecimenData` macro
    3. Make these improvements:
    
    **Remove .Select statements:**
    
    Change this:
    ```vba
    Range("A1").Select
    ActiveCell.Value = "Specimen No"
    ```
    
    To this:
    ```vba
    Range("A1").Value = "Specimen No"
    ```
    
    **Make row count dynamic:**
    
    Add at the top (after `Dim` if you have one, or as first line):
    ```vba
    Dim lastRow As Long
    lastRow = Cells(Rows.Count, "A").End(xlUp).Row
    ```
    
    Change fixed ranges like `B2:E7` to dynamic: `B2:E` & lastRow`
    
    **Add user feedback:**
    
    Add at the end (before `End Sub`):
    ```vba
    MsgBox "Specimen data formatted! Rows: " & lastRow, vbInformation
    ```
    
    **Save and test!**

## Solution

!!! success "Need Help?"
    If you're stuck or want to compare your solution:
    
    - Full solution with explanation: [Exercise_Solutions.md](Exercise_Solutions.md)
    - Working code file: [Exercise_Solutions.bas](Exercise_Solutions.bas)
    
    But try it yourself first! Learning happens when you struggle a bit.

## What You've Practiced

✓ Recording a complete macro from scratch  
✓ Working with headers and formatting  
✓ Using colour and alignment properties  
✓ Testing macros safely  
✓ (Bonus) Editing VBA to improve recorded code  
✓ (Bonus) Making ranges dynamic

## Common Issues

??? question "My macro only formats 7 rows, but I have more data!"
    Your recorded range was hard-coded (e.g., `A1:E7`). 
    
    **Fix:** Edit the macro to use dynamic range:
    
    ```vba
    Dim lastRow As Long
    lastRow = Cells(Rows.Count, "A").End(xlUp).Row
    Range("A1:E" & lastRow).Borders.LineStyle = xlContinuous
    ```

??? question "Ctrl+Z doesn't undo my macro!"
    This is normal! Macros clear Excel's undo history.
    
    **Solution:** Always save before running macros. If you need to undo, close without saving and reopen the file.

??? question "I get an error when running the macro"
    Check:
    
    - Are you on the correct sheet (`Exercise1_Raw`)?
    - Did you save as `.xlsm` format?
    - Is there actually data in the sheet?
    
    Press **Debug** when error appears to see which line failed.

## Next: Creating Buttons

Typing keyboard shortcuts is good, but **clickable buttons** are even better! Let's make a professional interface.

[Continue to Creating Buttons →](06-creating-buttons.md){ .md-button .md-button--primary }

---

[← Back to Understanding VBA](04-understanding-vba.md) | [Home](index.md)
