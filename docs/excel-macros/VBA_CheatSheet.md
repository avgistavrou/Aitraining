# Excel VBA Quick Reference - Material Scientists
**Workshop: Macros & Buttons | Author: Avgi Stavrou**

---

## Essential VBA Syntax

### Cells & Ranges
```vba
Range("A1").Value = 100                    ' Set cell value
Cells(1, 1).Value = 100                    ' Row 1, Column 1 (same as A1)
Range("A1:B10").Clear                      ' Clear range
Range("A1").Font.Bold = True               ' Format text
Range("A1").Interior.Color = RGB(255,0,0)  ' Red background
```

### Loops
```vba
' Loop through rows
For i = 1 To 10
    Cells(i, 1).Value = i
Next i

' Loop through each cell
Dim cell As Range
For Each cell In Range("A1:A10")
    cell.Value = cell.Value * 2
Next cell
```

### Conditionals
```vba
If Range("A1").Value > 100 Then
    MsgBox "High value!"
ElseIf Range("A1").Value > 50 Then
    MsgBox "Medium value"
Else
    MsgBox "Low value"
End If
```

### Find Last Row
```vba
' Most reliable method
lastRow = Cells(Rows.Count, "A").End(xlUp).Row

' Last row in column B
lastRow = Cells(Rows.Count, "B").End(xlUp).Row
```

### Worksheets
```vba
Worksheets("Summary").Activate             ' Switch to sheet
Set ws = Worksheets.Add                    ' Create new sheet
ws.Name = "Results"                        ' Rename sheet
Worksheets("OldSheet").Delete              ' Delete sheet
```

---

## Material Science Snippets

### Calculate Stress & Strain
```vba
' Stress (MPa) = Force (N) / Area (mm²)
Range("D2").Formula = "=B2/C2"

' Strain = ΔL / L₀
Range("E2").Formula = "=C2/100"  ' Assuming L₀=100mm
```

### Format Numbers
```vba
Range("B2:E10").NumberFormat = "0.00"      ' 2 decimal places
Range("B2:E10").NumberFormat = "0.0000"    ' 4 decimal places
Range("B2:E10").NumberFormat = "0.00E+00"  ' Scientific notation
```

### Add Borders
```vba
' Single cell border
Range("A1").Borders.LineStyle = xlContinuous

' Range with thick border
With Range("A1:E10").Borders
    .LineStyle = xlContinuous
    .Weight = xlMedium
End With
```

### Delete Blank Rows
```vba
Dim i As Long
lastRow = Cells(Rows.Count, "A").End(xlUp).Row

' Loop from bottom to top
For i = lastRow To 2 Step -1
    If Application.WorksheetFunction.CountA(Rows(i)) = 0 Then
        Rows(i).Delete
    End If
Next i
```

---

## Common Material Science Tasks

### 1. Batch Extract Values
```vba
Sub ExtractYoungsModulus()
    Dim i As Integer
    For i = 1 To 7
        Sheets("Summary").Range("B" & i).Value = _
            Sheets("Specimen_" & i).Range("E5").Value
    Next i
End Sub
```

### 2. Create Chart
```vba
Sub CreateStressStrainChart()
    Dim cht As ChartObject
    Set cht = ActiveSheet.ChartObjects.Add(Left:=300, Top:=50, _
                                           Width:=400, Height:=300)
    With cht.Chart
        .ChartType = xlXYScatterLines
        .SeriesCollection.NewSeries
        .SeriesCollection(1).XValues = Range("E2:E100")  ' Strain
        .SeriesCollection(1).Values = Range("D2:D100")   ' Stress
        .HasTitle = True
        .ChartTitle.Text = "Stress-Strain Curve"
    End With
End Sub
```

### 3. Highlight Outliers (>2σ)
```vba
Sub HighlightOutliers()
    Dim dataRange As Range
    Dim cell As Range, meanVal As Double, stdDev As Double
    
    Set dataRange = Range("B2:B10")
    meanVal = Application.WorksheetFunction.Average(dataRange)
    stdDev = Application.WorksheetFunction.StDev_S(dataRange)
    
    For Each cell In dataRange
        If Abs(cell.Value - meanVal) > 2 * stdDev Then
            cell.Interior.Color = RGB(255, 0, 0)  ' Red
        End If
    Next cell
End Sub
```

### 4. Clean Machine Output
```vba
Sub CleanUTMData()
    Dim lastRow As Long, i As Long
    lastRow = Cells(Rows.Count, "A").End(xlUp).Row
    
    ' Remove blank rows from bottom up
    For i = lastRow To 2 Step -1
        If Application.WorksheetFunction.CountA(Rows(i)) = 0 Then
            Rows(i).Delete
        End If
    Next i
    
    ' Trim whitespace
    Dim cell As Range
    For Each cell In Range("A1:D" & lastRow)
        If VarType(cell.Value) = vbString Then
            cell.Value = Trim(cell.Value)
        End If
    Next cell
End Sub
```

---

## Error Handling

### Basic Error Handling
```vba
Sub SafeMacro()
On Error GoTo ErrorHandler

    ' Your code here
    Range("A1").Value = 100
    
    Exit Sub
    
ErrorHandler:
    MsgBox "Error: " & Err.Description, vbCritical
End Sub
```

### Skip Errors (Use Carefully)
```vba
On Error Resume Next
Set ws = Worksheets("MightNotExist")
If ws Is Nothing Then
    MsgBox "Sheet not found!"
End If
On Error GoTo 0  ' Turn error handling back on
```

---

## Useful Functions

### User Input
```vba
' Simple input box
specimenName = InputBox("Enter specimen ID:", "Input")

' Number input with validation
numSpecimens = Application.InputBox("How many specimens?", Type:=1)
```

### Message Boxes
```vba
MsgBox "Processing complete!", vbInformation         ' Info icon
MsgBox "Error occurred!", vbCritical                 ' Error icon
MsgBox "Delete data?", vbQuestion + vbYesNo          ' Question with Yes/No

' Check response
If MsgBox("Continue?", vbYesNo) = vbYes Then
    ' User clicked Yes
End If
```

### Check if Sheet Exists
```vba
Function SheetExists(sheetName As String) As Boolean
    Dim ws As Worksheet
    On Error Resume Next
    Set ws = Worksheets(sheetName)
    SheetExists = Not ws Is Nothing
    On Error GoTo 0
End Function
```

---

## Performance Tips

### Speed Up Macros
```vba
Sub FastMacro()
    ' Turn off screen updating
    Application.ScreenUpdating = False
    Application.Calculation = xlCalculationManual
    
    ' Your code here
    
    ' Turn back on
    Application.Calculation = xlCalculationAutomatic
    Application.ScreenUpdating = True
End Sub
```

### Avoid .Select
```vba
' BAD (slow)
Range("A1").Select
ActiveCell.Value = 100

' GOOD (fast)
Range("A1").Value = 100
```

---

## Debugging Shortcuts

| Key | Action |
|-----|--------|
| **F5** | Run macro |
| **F8** | Step through code line by line |
| **F9** | Toggle breakpoint |
| **Ctrl+G** | Open Immediate Window |
| **Ctrl+R** | Show Project Explorer |

### Debug.Print (Better than MsgBox)
```vba
For i = 1 To 10
    Debug.Print "Row " & i & ": " & Cells(i, 1).Value
Next i
' View output in Immediate Window (Ctrl+G)
```

---

## Common Mistakes to Avoid

| Mistake | Problem | Solution |
|---------|---------|----------|
| `Range("A1:A" & lastRow)` without finding lastRow | Hardcoded range | Always calculate lastRow |
| No error handling | Crashes on unexpected data | Use `On Error` |
| Too many `.Select` | Slow, screen flickers | Direct assignment |
| Hardcoded values | Not reusable | Use variables |
| No comments | Can't understand later | Comment your logic |

---

## Material Science Unit Conversions

```vba
' MPa to GPa
Function MPaToGPa(MPa As Double) As Double
    MPaToGPa = MPa / 1000
End Function

' mm to μm
Function mmToMicrometers(mm As Double) As Double
    mmToMicrometers = mm * 1000
End Function

' N to kN
Function NToKN(n As Double) As Double
    NToKN = n / 1000
End Function
```

---

## Recording Macro Tips

1. **Before recording:**
   - Plan the steps
   - Test on dummy data
   - Have target sheet ready

2. **During recording:**
   - Work methodically
   - Avoid mistakes (they get recorded!)
   - Use keyboard when possible (more reliable than mouse)

3. **After recording:**
   - Edit to remove `.Select`
   - Add error handling
   - Make ranges dynamic
   - Add comments

---

## Keyboard Shortcuts

### Excel
- **Alt+F11** - Open VBA Editor
- **Alt+F8** - Macros dialogue
- **Ctrl+Shift+[Letter]** - Run assigned macro

### VBA Editor
- **F5** - Run current macro
- **F8** - Step through code
- **Ctrl+Space** - Auto-complete
- **Ctrl+Y** - Delete line

---

## Resources

- Microsoft VBA Reference: https://learn.microsoft.com/en-us/office/vba/api/overview/excel
- Stack Overflow: Search "[excel-vba] your question"


---



*Last updated: February 2026*
