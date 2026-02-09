# Real-World Material Science Examples

Time to see powerful macros in action! These examples demonstrate real workflows from materials testing labs.

## Example 1: Calculate Stress & Strain

### The Problem

You've imported UTM data with Load (N) and Extension (mm). You need to:

- Calculate **Stress** (MPa) = Load / Cross-Sectional Area
- Calculate **Strain** = Extension / Gauge Length
- Do this for 500+ data points

Doing this manually would take ages and be error-prone. Let's automate it!

### The Data Layout

**Before macro runs:**

```
Row 3: SpecimenID:  Width (mm):  Thickness (mm):  Gauge Length (mm):
Row 4: Demo_001     20           0.15             100
Row 6: Time(s)      Load(N)      Extension        Displacement
Row 7: 0.500        0.01         -0.0110          -0.0100
Row 8: 1.000        0.10         -0.0430          -0.0400
...
```

**After macro runs:**

```
Row 6: Time(s)   Load(N)   Extension   Displacement   Stress(MPa)   Strain
Row 7: 0.500     0.01      -0.0110     -0.0100        0.0033        -0.0001
Row 8: 1.000     0.10      -0.0430     -0.0400        0.0333        -0.0004
...
```

### The Macro

```vba
Sub CalculateStressStrain()
' Calculates stress and strain from raw UTM data
' Reads specimen dimensions from row 4 (B4, C4, D4)
' Data starts at row 7

    Dim lastRow As Long
    Dim width As Double, thickness As Double, gaugeLength As Double
    Dim csa As Double
    Dim i As Long
    
    ' Get specimen dimensions
    width = Range("B4").Value           ' Width in mm
    thickness = Range("C4").Value       ' Thickness in mm
    gaugeLength = Range("D4").Value     ' Gauge length in mm
    csa = width * thickness             ' Cross-sectional area (mm²)
    
    ' Find last row of data
    lastRow = Cells(Rows.Count, "B").End(xlUp).Row
    
    ' Add headers (row 6 - same row as Time, Load, etc.)
    Range("E6").Value = "Stress (MPa)"
    Range("F6").Value = "Strain"
    
    ' Calculate for each data row (starting row 7)
    For i = 7 To lastRow
        ' Stress (MPa) = Load (N) / CSA (mm²)
        Range("E" & i).Formula = "=B" & i & "/" & csa
        
        ' Strain = Extension (mm) / Gauge Length (mm)
        Range("F" & i).Formula = "=C" & i & "/" & gaugeLength
    Next i
    
    ' Format columns with 4 decimal places
    Range("E7:F" & lastRow).NumberFormat = "0.0000"
    
    MsgBox "Stress and strain calculated!", vbInformation
    
End Sub
```

### Key Features Explained

!!! tip "Reading Dimensions"
    ```vba
    width = Range("B4").Value
    thickness = Range("C4").Value
    gaugeLength = Range("D4").Value
    ```
    
    The macro reads specimen dimensions from row 4. **Change these cell references** if your layout is different!

!!! tip "Dynamic Row Count"
    ```vba
    lastRow = Cells(Rows.Count, "B").End(xlUp).Row
    ```
    
    This finds the last row with data automatically. Works for 10 rows or 10,000 rows!

!!! tip "Using Formulas, Not Values"
    ```vba
    Range("E" & i).Formula = "=B" & i & "/" & csa
    ```
    
    Inserts **formulas** (not calculated values). Benefits:
    
    - Transparent (you can see the calculation)
    - Updates automatically if source data changes
    - Excel handles the maths

### Try It Yourself

!!! example "Run This Macro"
    1. Download [Macro_Examples_Structure_Fixed.xlsx](Macro_Examples_Structure_Fixed.xlsx)
    2. Import [Workshop_Macros.bas](Workshop_Macros.bas) (VBA Editor → File → Import)
    3. Run `CalculateStressStrain`
    4. See columns E & F filled instantly!

## Example 2: Create Stress-Strain Chart

### The Problem

After calculating stress and strain, you need a **standardised chart** with:

- Professional styling (no Excel defaults!)
- Proper axis labels with units
- Consistent appearance across all experiments
- Positioned nicely beside the data

### The Macro

```vba
Sub CreateStressStrainChart()
' Creates a standardised stress-strain curve
' Data: Strain in column F, Stress in column E (starting row 7)

    Dim lastRow As Long
    Dim chartObj As ChartObject
    Dim specimenName As String
    
    ' Get data range
    lastRow = Cells(Rows.Count, "E").End(xlUp).Row
    specimenName = Range("A4").Value  ' SpecimenID from A4
    
    ' Delete old chart if exists
    On Error Resume Next
    ActiveSheet.ChartObjects("StressStrainChart").Delete
    On Error GoTo 0
    
    ' Create chart positioned at H3
    Set chartObj = ActiveSheet.ChartObjects.Add( _
        Left:=Range("H3").Left, _
        Top:=Range("H3").Top, _
        Width:=450, _
        Height:=300)
    
    chartObj.Name = "StressStrainChart"
    
    With chartObj.Chart
        ' Set chart type (XY Scatter with lines)
        .ChartType = xlXYScatterLines
        
        ' Add data series
        .SeriesCollection.NewSeries
        With .SeriesCollection(1)
            .Name = specimenName
            .XValues = Range("F7:F" & lastRow)  ' Strain (X-axis)
            .Values = Range("E7:E" & lastRow)   ' Stress (Y-axis)
            .MarkerStyle = xlMarkerStyleNone    ' Line only, no points
            .Format.Line.ForeColor.RGB = RGB(0, 112, 192)  ' Blue line
            .Format.Line.Weight = 2             ' Thicker line
        End With
        
        ' Format axes
        .Axes(xlCategory).HasTitle = True
        .Axes(xlCategory).AxisTitle.Text = "Strain"
        .Axes(xlValue).HasTitle = True
        .Axes(xlValue).AxisTitle.Text = "Stress (MPa)"
        
        ' Chart title
        .HasTitle = True
        .ChartTitle.Text = "Stress-Strain Curve: " & specimenName
        .ChartTitle.Font.Size = 14
        .ChartTitle.Font.Bold = True
        
        ' Gridlines (vertical off, horizontal on)
        .Axes(xlCategory).HasMajorGridlines = False
        .Axes(xlValue).HasMajorGridlines = True
        
    End With
    
    MsgBox "Chart created!", vbInformation
    
End Sub
```

### Key Features Explained

!!! tip "Positioning Charts"
    ```vba
    Left:=Range("H3").Left, _
    Top:=Range("H3").Top, _
    ```
    
    Positions the chart at cell H3. Change the cell reference to position elsewhere!

!!! tip "Overwriting Old Charts"
    ```vba
    On Error Resume Next
    ActiveSheet.ChartObjects("StressStrainChart").Delete
    On Error GoTo 0
    ```
    
    Deletes any existing chart named "StressStrainChart". This prevents clutter when running the macro multiple times.
    
    `On Error Resume Next` means "if the chart doesn't exist, don't show an error - just continue".

!!! tip "XY Scatter vs Line Chart"
    ```vba
    .ChartType = xlXYScatterLines
    ```
    
    **XY Scatter** plots actual X and Y values (correct for stress-strain!)
    
    **Line Chart** would treat X as text labels (wrong!)

### Professional Chart Styling

The macro applies:

- **No data point markers** - Clean lines only
- **Blue colour** - Professional look (RGB 0, 112, 192)
- **Thicker lines** - Easier to see (Weight = 2)
- **Descriptive title** - Includes specimen name
- **Axis labels with units** - "Stress (MPa)" not just "Stress"
- **Minimal gridlines** - Horizontal only, reduces visual clutter

## Example 3: Batch Process Multiple Specimens

### The Problem

You have 7 sheets named `Specimen_1`, `Specimen_2`, ..., `Specimen_7`. Each has a **Young's Modulus** value in cell B6.

**Manual process:**

1. Go to Specimen_1 sheet
2. Click B6, copy value
3. Go to summary sheet, paste
4. Repeat for Specimens 2-7...
5. Calculate average

**With macro:** Extract all values and calculate average in seconds!

### The Macro

```vba
Sub BatchExtractModulus()
' Extracts Young's Modulus from multiple specimen sheets
' Assumes: 7 sheets named Specimen_1 to Specimen_7
'          Modulus value in cell B6

    Dim i As Integer
    Dim summaryRow As Integer
    Dim modulusValue As Double
    Dim ws As Worksheet
    Dim summarySheet As Worksheet
    
    ' Create or clear summary sheet
    On Error Resume Next
    Set summarySheet = Worksheets("Summary")
    If summarySheet Is Nothing Then
        Set summarySheet = Worksheets.Add
        summarySheet.Name = "Summary"
    End If
    On Error GoTo 0
    
    summarySheet.Cells.Clear
    
    ' Add headers
    summarySheet.Range("A1").Value = "Specimen"
    summarySheet.Range("B1").Value = "Young's Modulus (GPa)"
    summarySheet.Range("A1:B1").Font.Bold = True
    
    ' Loop through specimen sheets
    summaryRow = 2
    For i = 1 To 7
        On Error Resume Next
        Set ws = Worksheets("Specimen_" & i)
        On Error GoTo 0
        
        If Not ws Is Nothing Then
            ' Get modulus value from B6
            modulusValue = ws.Range("B6").Value
            
            ' Write to summary sheet
            summarySheet.Cells(summaryRow, 1).Value = "Specimen_" & i
            summarySheet.Cells(summaryRow, 2).Value = modulusValue
            
            summaryRow = summaryRow + 1
            Set ws = Nothing
        End If
    Next i
    
    ' Calculate average
    summarySheet.Cells(summaryRow + 1, 1).Value = "Average:"
    summarySheet.Cells(summaryRow + 1, 2).Formula = "=AVERAGE(B2:B" & summaryRow - 1 & ")"
    summarySheet.Cells(summaryRow + 1, 1).Font.Bold = True
    
    ' Format summary sheet
    summarySheet.Columns("A:B").AutoFit
    
    MsgBox "Batch processing complete! Extracted " & i - 1 & " specimens.", vbInformation
    summarySheet.Activate
    
End Sub
```

### Key Features Explained

!!! tip "Looping Through Sheets"
    ```vba
    For i = 1 To 7
        Set ws = Worksheets("Specimen_" & i)
        modulusValue = ws.Range("B6").Value
    Next i
    ```
    
    The `&` operator joins text: `"Specimen_" & 1` becomes `"Specimen_1"`
    
    This loop automatically processes all 7 sheets!

!!! tip "Error Handling"
    ```vba
    On Error Resume Next
    Set ws = Worksheets("Specimen_" & i)
    On Error GoTo 0
    
    If Not ws Is Nothing Then
        ' Process this sheet
    End If
    ```
    
    If a sheet doesn't exist (e.g., you only have 5 specimens), the macro **doesn't crash** - it just skips that sheet.

!!! tip "Creating Summary Sheet"
    ```vba
    Set summarySheet = Worksheets("Summary")
    If summarySheet Is Nothing Then
        Set summarySheet = Worksheets.Add
        summarySheet.Name = "Summary"
    End If
    ```
    
    Checks if "Summary" sheet exists. If not, creates it. Smart!

### Result

**Summary Sheet:**

| Specimen | Young's Modulus (GPa) |
|----------|-----------------------|
| Specimen_1 | 210.5 |
| Specimen_2 | 209.8 |
| Specimen_3 | 211.2 |
| ... | ... |
| **Average:** | **210.3** |

## Example 4: Export Charts to PowerPoint

### The Problem

You need to create a PowerPoint presentation with stress-strain charts from Excel. Manual process is tedious!

### The Macro (Simplified)

```vba
Sub ExportChartToPowerPoint()
' Copies active chart to new PowerPoint slide

    Dim pptApp As Object
    Dim pptPres As Object
    Dim pptSlide As Object
    
    ' Check if a chart is selected
    If ActiveChart Is Nothing Then
        MsgBox "Please select a chart first!", vbExclamation
        Exit Sub
    End If
    
    ' Create PowerPoint application
    On Error Resume Next
    Set pptApp = GetObject(, "PowerPoint.Application")
    If pptApp Is Nothing Then
        Set pptApp = CreateObject("PowerPoint.Application")
    End If
    On Error GoTo 0
    
    pptApp.Visible = True
    
    ' Create new presentation
    Set pptPres = pptApp.Presentations.Add
    Set pptSlide = pptPres.Slides.Add(1, 12)  ' 12 = ppLayoutBlank
    
    ' Copy chart
    ActiveChart.ChartArea.Copy
    
    ' Paste into PowerPoint
    pptSlide.Shapes.Paste
    
    ' Position and resize
    With pptSlide.Shapes(1)
        .Left = 50
        .Top = 100
        .Width = 600
        .Height = 400
    End With
    
    MsgBox "Chart exported to PowerPoint!", vbInformation
    
End Sub
```

**Full version available in:** [Workshop_Macros.bas](Workshop_Macros.bas)

## What You've Learned

✓ How to read values from specific cells (specimen dimensions)  
✓ How to use loops to process multiple rows (`For i = 7 To lastRow`)  
✓ How to insert formulas programmatically  
✓ How to create and format professional charts  
✓ How to batch process multiple sheets  
✓ How to work with other Office applications (PowerPoint)  
✓ Error handling with `On Error Resume Next`

## Try It Yourself

!!! example "Import and Test"
    1. Download [Workshop_Macros.bas](Workshop_Macros.bas)
    2. Open [Macro_Examples_Structure_Fixed.xlsx](Macro_Examples_Structure_Fixed.xlsx)
    3. Press **Alt+F11** (VBA Editor)
    4. **File** → **Import File** → Select `Workshop_Macros.bas`
    5. Close VBA Editor
    6. Run each macro and see the results!

## Next: Exercise 2

Now it's your turn to build a batch processing macro for XRD data!

[Continue to Exercise 2 →](08-exercise-2.md){ .md-button .md-button--primary }

---

[← Back to Creating Buttons](06-creating-buttons.md) | [Home](index.md)
