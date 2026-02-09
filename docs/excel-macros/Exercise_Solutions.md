# Excel Macros Workshop - Exercise Solutions
**Complete Answers & Code Examples**

---

## Exercise 1 Solution: Format Specimen Data

### Complete VBA Code

```vba
Sub FormatSpecimenData()
' Formats specimen data table with headers and professional styling
' Author: [Your Name]
' Date: [Today's Date]

    Dim lastRow As Long
    
    ' Add headers in row 1
    Range("A1").Value = "Specimen No"
    Range("B1").Value = "Width (mm)"
    Range("C1").Value = "Thickness (mm)"
    Range("D1").Value = "CSA (mm²)"
    Range("E1").Value = "Young's Modulus (GPa)"
    
    ' Format header row - bold, centered, light blue background
    With Range("A1:E1")
        .Font.Bold = True
        .HorizontalAlignment = xlCenter
        .Interior.Color = RGB(173, 216, 230)  ' Light blue
    End With
    
    ' Format data columns to 3 decimal places
    Range("B:E").NumberFormat = "0.000"
    
    ' Find last row dynamically (works for any number of rows)
    lastRow = Cells(Rows.Count, "A").End(xlUp).Row
    
    ' Add borders around entire table
    Range("A1:E" & lastRow).Borders.LineStyle = xlContinuous
    
    ' Auto-fit columns for readability
    Columns("A:E").AutoFit
    
    ' Success message
    MsgBox "Specimen data formatted successfully!" & vbCrLf & _
           "Rows processed: " & lastRow, _
           vbInformation, "Format Complete"
    
End Sub
```

### Improved Version (No .Select statements)

```vba
Sub FormatSpecimenData_Improved()
' Optimized version with better performance and readability
' No unnecessary .Select statements
' Dynamic range handling

    Dim lastRow As Long
    Dim ws As Worksheet
    
    ' Work with active sheet
    Set ws = ActiveSheet
    
    ' Section 1: Headers
    ' Add column headers with units
    ws.Range("A1").Value = "Specimen No"
    ws.Range("B1").Value = "Width (mm)"
    ws.Range("C1").Value = "Thickness (mm)"
    ws.Range("D1").Value = "CSA (mm²)"
    ws.Range("E1").Value = "Young's Modulus (GPa)"
    
    ' Section 2: Header Formatting
    ' Apply professional styling to header row
    With ws.Range("A1:E1")
        .Font.Bold = True
        .Font.Size = 11
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .Interior.Color = RGB(173, 216, 230)  ' Light blue
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlMedium
    End With
    
    ' Section 3: Data Formatting
    ' Format numeric columns to 3 decimal places for precision
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    ws.Range("B2:E" & lastRow).NumberFormat = "0.000"
    
    ' Section 4: Table Borders
    ' Add borders around entire data table
    With ws.Range("A1:E" & lastRow)
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
        .Borders.Color = RGB(0, 0, 0)  ' Black borders
    End With
    
    ' Section 5: Column Width
    ' Auto-fit columns and add padding
    ws.Columns("A:E").AutoFit
    ws.Columns("A:E").ColumnWidth = ws.Columns("A:E").ColumnWidth + 2
    
    ' Completion message with statistics
    MsgBox "Formatting complete!" & vbCrLf & _
           "Total rows: " & lastRow & vbCrLf & _
           "Data rows: " & (lastRow - 1), _
           vbInformation, "Success"
    
End Sub
```

### Key Learning Points

**What Each Section Does:**
1. **Headers** - Adds descriptive column names with units
2. **Header Formatting** - Makes headers stand out (bold, colored, centered)
3. **Data Formatting** - Ensures consistent precision (3 decimals)
4. **Borders** - Professional table appearance
5. **Column Width** - Improves readability

**Important VBA Concepts:**
- `Dim lastRow As Long` - Declares variable for dynamic range
- `Cells(Rows.Count, "A").End(xlUp).Row` - Finds last row with data
- `With...End With` - Efficient way to set multiple properties
- `RGB(173, 216, 230)` - Custom color specification
- `Range("A1:E" & lastRow)` - Dynamic range concatenation

**Why No `.Select`?**
- Faster execution (no screen redrawing)
- No screen flicker
- More reliable (doesn't depend on active selection)
- Professional coding standard

---

## Exercise 2 Solution: Batch Extract XRD Data

### Complete VBA Code

```vba
Sub CompileXRDResults()
' Extracts XRD peak intensities from multiple sample sheets
' Creates summary with statistics and professional formatting
' Author: [Your Name]

    Dim i As Integer
    Dim sampleSheet As String
    Dim intensity As Double
    Dim summarySheet As Worksheet
    Dim ws As Worksheet
    Dim validCount As Integer
    
    ' Step 1: Create or clear XRD Summary sheet
    On Error Resume Next
    Set summarySheet = Worksheets("XRD_Summary")
    If summarySheet Is Nothing Then
        ' Sheet doesn't exist, create it
        Set summarySheet = Worksheets.Add
        summarySheet.Name = "XRD_Summary"
    Else
        ' Sheet exists, clear old data
        summarySheet.Cells.Clear
    End If
    On Error GoTo 0
    
    ' Step 2: Add headers
    ' Main title
    With summarySheet.Range("A1")
        .Value = "XRD Peak Intensity Summary"
        .Font.Bold = True
        .Font.Size = 14
        .Font.Color = RGB(0, 0, 255)  ' Blue
    End With
    
    ' Column headers
    summarySheet.Range("A3").Value = "Sample"
    summarySheet.Range("B3").Value = "Peak Intensity"
    
    With summarySheet.Range("A3:B3")
        .Font.Bold = True
        .Interior.Color = RGB(217, 217, 217)  ' Grey
        .HorizontalAlignment = xlCenter
        .Borders.LineStyle = xlContinuous
    End With
    
    validCount = 0
    
    ' Step 3: Loop through 3 XRD samples
    For i = 1 To 3
        sampleSheet = "XRD_Sample" & i
        
        ' Try to access the sheet and extract data
        On Error Resume Next
        Set ws = Worksheets(sampleSheet)
        
        If Not ws Is Nothing Then
            ' Sheet exists, get intensity from B5
            intensity = ws.Range("B5").Value
            
            If Err.Number = 0 And IsNumeric(intensity) Then
                ' Valid data found
                summarySheet.Range("A" & i + 3).Value = "Sample " & i
                summarySheet.Range("B" & i + 3).Value = intensity
                validCount = validCount + 1
            Else
                ' Error reading data
                summarySheet.Range("A" & i + 3).Value = "Sample " & i
                summarySheet.Range("B" & i + 3).Value = "ERROR"
                summarySheet.Range("B" & i + 3).Font.Color = RGB(255, 0, 0)
            End If
        Else
            ' Sheet doesn't exist
            summarySheet.Range("A" & i + 3).Value = "Sample " & i
            summarySheet.Range("B" & i + 3).Value = "NOT FOUND"
            summarySheet.Range("B" & i + 3).Font.Color = RGB(255, 0, 0)
        End If
        
        Set ws = Nothing
        Err.Clear
        On Error GoTo 0
    Next i
    
    ' Step 4: Calculate average
    If validCount > 0 Then
        summarySheet.Range("A8").Value = "Average:"
        summarySheet.Range("A8").Font.Bold = True
        summarySheet.Range("B8").Formula = "=AVERAGE(B4:B6)"
        summarySheet.Range("B8").Font.Bold = True
    End If
    
    ' Step 5: Format table
    ' Number formatting (2 decimal places)
    summarySheet.Range("B4:B8").NumberFormat = "0.00"
    
    ' Add borders to data area
    summarySheet.Range("A3:B6").Borders.LineStyle = xlContinuous
    
    ' Auto-fit columns
    summarySheet.Columns("A:B").AutoFit
    summarySheet.Columns("A:B").ColumnWidth = summarySheet.Columns("A:B").ColumnWidth + 2
    
    ' Activate summary sheet and position at top
    summarySheet.Activate
    summarySheet.Range("A1").Select
    
    ' Success message
    MsgBox "XRD data compiled successfully!" & vbCrLf & _
           "Valid samples: " & validCount & " of 3" & vbCrLf & _
           "Results in XRD_Summary sheet", _
           vbInformation, "Compile Complete"
    
End Sub
```

### Alternative Solution (Simplified)

```vba
Sub CompileXRDResults_Simple()
' Simplified version without error handling (for clean data)

    Dim i As Integer
    Dim summarySheet As Worksheet
    
    ' Create new summary sheet
    Set summarySheet = Worksheets.Add
    summarySheet.Name = "XRD_Summary"
    
    ' Headers
    summarySheet.Range("A1").Value = "XRD Peak Intensity Summary"
    summarySheet.Range("A1").Font.Bold = True
    summarySheet.Range("A1").Font.Size = 14
    
    summarySheet.Range("A3").Value = "Sample"
    summarySheet.Range("B3").Value = "Peak Intensity"
    summarySheet.Range("A3:B3").Font.Bold = True
    
    ' Extract data from 3 samples
    For i = 1 To 3
        summarySheet.Range("A" & i + 3).Value = "Sample " & i
        summarySheet.Range("B" & i + 3).Value = _
            Worksheets("XRD_Sample" & i).Range("B5").Value
    Next i
    
    ' Calculate average
    summarySheet.Range("A8").Value = "Average:"
    summarySheet.Range("B8").Formula = "=AVERAGE(B4:B6)"
    summarySheet.Range("A8:B8").Font.Bold = True
    
    ' Format
    summarySheet.Range("B4:B8").NumberFormat = "0.00"
    summarySheet.Columns("A:B").AutoFit
    
    MsgBox "XRD data compiled!", vbInformation
    
End Sub
```

### Key Learning Points

**VBA Concepts Used:**
1. **Sheet Creation** - `Worksheets.Add`
2. **Checking if Sheet Exists** - `On Error Resume Next` pattern
3. **Loops** - `For i = 1 To 3`
4. **String Concatenation** - `"XRD_Sample" & i`
5. **Formula Insertion** - `.Formula = "=AVERAGE(B4:B6)"`
6. **Error Handling** - Gracefully handles missing sheets
7. **Validation** - `IsNumeric()` check

**Error Handling Strategy:**
```vba
On Error Resume Next  ' Don't crash if sheet doesn't exist
Set ws = Worksheets(sheetName)
If Not ws Is Nothing Then
    ' Sheet exists, process it
Else
    ' Sheet missing, show error message
End If
On Error GoTo 0  ' Turn error handling back on
```

**Why Use Formula Instead of Value?**
```vba
' Good - Uses Excel formula (updates automatically)
.Formula = "=AVERAGE(B4:B6)"

' Also valid - Hard-codes value (doesn't update)
.Value = Application.WorksheetFunction.Average(Range("B4:B6"))
```

---

## Take-Home Challenge 1 Solution: DSC Data Processor

### Complete VBA Code

```vba
Sub ProcessDSCData()
' Processes DSC machine output data
' Removes header rows, formats data, creates chart
' Author: [Your Name]

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim chartObj As ChartObject
    Dim sampleName As String
    
    Set ws = ActiveSheet
    
    ' Step 1: Delete first 20 header rows
    ws.Rows("1:20").Delete
    
    ' Step 2: Add proper headers (now in row 1)
    ws.Range("A1").Value = "Temperature (°C)"
    ws.Range("B1").Value = "Heat Flow (W/g)"
    
    ' Format headers
    With ws.Range("A1:B1")
        .Font.Bold = True
        .Font.Size = 11
        .HorizontalAlignment = xlCenter
        .Interior.Color = RGB(173, 216, 230)
        .Borders.LineStyle = xlContinuous
    End With
    
    ' Step 3: Format data to 2 decimal places
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    ws.Range("A2:B" & lastRow).NumberFormat = "0.00"
    
    ' Add borders
    ws.Range("A1:B" & lastRow).Borders.LineStyle = xlContinuous
    
    ' Auto-fit columns
    ws.Columns("A:B").AutoFit
    
    ' Step 4: Get sample name (from filename or prompt)
    sampleName = InputBox("Enter sample name:", "DSC Analysis", "Sample_001")
    If sampleName = "" Then sampleName = "DSC Sample"
    
    ' Step 5: Create line chart
    ' Delete existing chart if present
    On Error Resume Next
    ws.ChartObjects("DSCChart").Delete
    On Error GoTo 0
    
    ' Create new chart
    Set chartObj = ws.ChartObjects.Add( _
        Left:=ws.Range("D2").Left, _
        Top:=ws.Range("D2").Top, _
        Width:=400, _
        Height:=300)
    
    chartObj.Name = "DSCChart"
    
    With chartObj.Chart
        ' Chart type: Line chart
        .ChartType = xlLine
        
        ' Add data series
        .SeriesCollection.NewSeries
        With .SeriesCollection(1)
            .Name = "Heat Flow"
            .XValues = ws.Range("A2:A" & lastRow)  ' Temperature
            .Values = ws.Range("B2:B" & lastRow)   ' Heat Flow
            .Format.Line.ForeColor.RGB = RGB(255, 0, 0)  ' Red line
            .Format.Line.Weight = 2
        End With
        
        ' Chart title
        .HasTitle = True
        .ChartTitle.Text = "DSC Analysis - " & sampleName
        .ChartTitle.Font.Size = 14
        .ChartTitle.Font.Bold = True
        
        ' Axis titles
        .Axes(xlCategory).HasTitle = True
        .Axes(xlCategory).AxisTitle.Text = "Temperature (°C)"
        
        .Axes(xlValue).HasTitle = True
        .Axes(xlValue).AxisTitle.Text = "Heat Flow (W/g)"
        
        ' Gridlines
        .Axes(xlCategory).HasMajorGridlines = False
        .Axes(xlValue).HasMajorGridlines = True
        
        ' Legend
        .HasLegend = True
        .Legend.Position = xlLegendPositionBottom
    End With
    
    MsgBox "DSC data processed successfully!" & vbCrLf & _
           "Data points: " & (lastRow - 1) & vbCrLf & _
           "Chart created", _
           vbInformation, "Process Complete"
    
End Sub
```

### Key Features

**VBA Functions Used:**
- `Rows("1:20").Delete` - Delete multiple rows at once
- `InputBox()` - Get user input
- `ChartObjects.Add()` - Create chart programmatically
- `.ChartType = xlLine` - Specify chart type
- `.XValues` and `.Values` - Set chart data ranges

---

## Take-Home Challenge 2 Solution: Multi-Experiment Updater

### Complete VBA Code

```vba
Sub UpdateMasterResults()
' Updates master experiment results spreadsheet
' Finds experiment by code and updates values
' Author: [Your Name]

    Dim expCode As String
    Dim masterWB As Workbook
    Dim masterWS As Worksheet
    Dim foundRow As Long
    Dim i As Long
    Dim lastRow As Long
    Dim youngsModulus As Double
    Dim maxStress As Double
    
    ' Step 1: Get experiment code from user
    expCode = InputBox("Enter experiment code (e.g., Exp343.2):", "Experiment Code")
    If expCode = "" Then
        MsgBox "No experiment code entered. Operation cancelled.", vbExclamation
        Exit Sub
    End If
    
    ' Step 2: Get values from current workbook
    ' Assume values are in specific cells (adjust as needed)
    youngsModulus = ActiveSheet.Range("B6").Value  ' Example location
    maxStress = ActiveSheet.Range("B7").Value      ' Example location
    
    ' Validate values
    If youngsModulus <= 0 Or maxStress <= 0 Then
        MsgBox "Invalid values in current workbook!", vbCritical
        Exit Sub
    End If
    
    ' Step 3: Open master workbook
    On Error GoTo ErrorHandler
    Set masterWB = Workbooks.Open("C:\Path\To\Master_Results.xlsx")
    Set masterWS = masterWB.Worksheets("Results")
    
    ' Step 4: Find the experiment row
    foundRow = 0
    lastRow = masterWS.Cells(masterWS.Rows.Count, "A").End(xlUp).Row
    
    For i = 2 To lastRow  ' Start from row 2 (skip header)
        If InStr(1, masterWS.Cells(i, 1).Value, expCode, vbTextCompare) > 0 Then
            foundRow = i
            Exit For
        End If
    Next i
    
    ' Step 5: Update values
    If foundRow > 0 Then
        ' Found the experiment, update values
        masterWS.Cells(foundRow, 2).Value = youngsModulus  ' Column B
        masterWS.Cells(foundRow, 3).Value = maxStress      ' Column C
        masterWS.Cells(foundRow, 4).Value = Date           ' Column D (today's date)
        
        ' Save and close master workbook
        masterWB.Save
        masterWB.Close SaveChanges:=True
        
        MsgBox "Master results updated successfully!" & vbCrLf & _
               "Experiment: " & expCode & vbCrLf & _
               "Young's Modulus: " & Format(youngsModulus, "0.00") & " GPa" & vbCrLf & _
               "Max Stress: " & Format(maxStress, "0.00") & " MPa" & vbCrLf & _
               "Date: " & Format(Date, "dd/mm/yyyy"), _
               vbInformation, "Update Complete"
    Else
        ' Experiment not found
        masterWB.Close SaveChanges:=False
        MsgBox "Experiment code '" & expCode & "' not found in master sheet!", _
               vbExclamation, "Not Found"
    End If
    
    Exit Sub
    
ErrorHandler:
    MsgBox "Error: " & Err.Description & vbCrLf & _
           "Make sure Master_Results.xlsx path is correct.", _
           vbCritical, "Error"
    If Not masterWB Is Nothing Then
        masterWB.Close SaveChanges:=False
    End If
    
End Sub
```

### Enhanced Version with Add New Entry

```vba
Sub UpdateMasterResults_Enhanced()
' Enhanced version that can add new experiments if not found

    Dim expCode As String
    Dim masterWB As Workbook
    Dim masterWS As Worksheet
    Dim foundRow As Long
    Dim i As Long, lastRow As Long
    Dim youngsModulus As Double, maxStress As Double
    Dim response As VbMsgBoxResult
    
    ' Get experiment code
    expCode = InputBox("Enter experiment code:", "Experiment Code")
    If expCode = "" Then Exit Sub
    
    ' Get values
    youngsModulus = ActiveSheet.Range("B6").Value
    maxStress = ActiveSheet.Range("B7").Value
    
    ' Open master workbook
    On Error GoTo ErrorHandler
    Set masterWB = Workbooks.Open("C:\Path\To\Master_Results.xlsx")
    Set masterWS = masterWB.Worksheets("Results")
    
    ' Find experiment
    foundRow = 0
    lastRow = masterWS.Cells(masterWS.Rows.Count, "A").End(xlUp).Row
    
    For i = 2 To lastRow
        If UCase(Trim(masterWS.Cells(i, 1).Value)) = UCase(Trim(expCode)) Then
            foundRow = i
            Exit For
        End If
    Next i
    
    If foundRow > 0 Then
        ' Update existing entry
        masterWS.Cells(foundRow, 2).Value = youngsModulus
        masterWS.Cells(foundRow, 3).Value = maxStress
        masterWS.Cells(foundRow, 4).Value = Date
        
        MsgBox "Updated existing entry for " & expCode, vbInformation
    Else
        ' Entry not found - ask to add new
        response = MsgBox("Experiment '" & expCode & "' not found." & vbCrLf & _
                         "Add as new entry?", vbQuestion + vbYesNo, "Add New?")
        
        If response = vbYes Then
            ' Add new entry at bottom
            lastRow = lastRow + 1
            masterWS.Cells(lastRow, 1).Value = expCode
            masterWS.Cells(lastRow, 2).Value = youngsModulus
            masterWS.Cells(lastRow, 3).Value = maxStress
            masterWS.Cells(lastRow, 4).Value = Date
            
            MsgBox "Added new entry for " & expCode, vbInformation
        Else
            masterWB.Close SaveChanges:=False
            Exit Sub
        End If
    End If
    
    ' Save and close
    masterWB.Save
    masterWB.Close SaveChanges:=True
    
    Exit Sub
    
ErrorHandler:
    MsgBox "Error: " & Err.Description, vbCritical
    If Not masterWB Is Nothing Then masterWB.Close SaveChanges:=False
    
End Sub
```

### Key Learning Points

**Advanced VBA Concepts:**
1. **Working with Multiple Workbooks** - `Workbooks.Open()`
2. **String Search** - `InStr()` function
3. **Date Functions** - `Date` function
4. **Error Handling** - `On Error GoTo ErrorHandler`
5. **String Manipulation** - `UCase()`, `Trim()`
6. **User Confirmation** - `MsgBox` with `vbYesNo`

**Best Practices:**
- Always close workbooks you open
- Use error handling for file operations
- Validate data before updating
- Provide clear user feedback
- Save only if changes were made successfully

---

## Take-Home Challenge 3 Solution: Automated Report Generator

### Complete VBA Code (Excel to PowerPoint to PDF)

```vba
Sub GenerateAutomatedReport()
' Generates automated weekly report
' Exports chart to PowerPoint, adds data table, saves as PDF
' Author: [Your Name]

    Dim pptApp As Object
    Dim pptPres As Object
    Dim pptSlide As Object
    Dim chartObj As ChartObject
    Dim reportDate As String
    Dim pdfPath As String
    Dim expCode As String
    
    ' Get experiment code
    expCode = InputBox("Enter experiment code for report:", "Report Generator", "Exp343.2")
    If expCode = "" Then Exit Sub
    
    reportDate = Format(Date, "yyyy-mm-dd")
    
    ' Step 1: Create PowerPoint application
    On Error Resume Next
    Set pptApp = GetObject(, "PowerPoint.Application")
    If pptApp Is Nothing Then
        Set pptApp = CreateObject("PowerPoint.Application")
    End If
    On Error GoTo 0
    
    pptApp.Visible = True
    
    ' Step 2: Create new presentation
    Set pptPres = pptApp.Presentations.Add
    
    ' Step 3: Add title slide
    Set pptSlide = pptPres.Slides.Add(1, 1)  ' ppLayoutTitle = 1
    pptSlide.Shapes(1).TextFrame.TextRange.Text = "Tensile Test Report"
    pptSlide.Shapes(2).TextFrame.TextRange.Text = expCode & " - " & reportDate
    
    ' Step 4: Add data slide with chart
    Set pptSlide = pptPres.Slides.Add(2, 12)  ' ppLayoutBlank = 12
    
    ' Copy chart from Excel
    Set chartObj = ActiveSheet.ChartObjects("StressStrainChart")
    If Not chartObj Is Nothing Then
        chartObj.Chart.ChartArea.Copy
        
        ' Paste into PowerPoint
        pptSlide.Shapes.Paste.Select
        pptApp.ActiveWindow.Selection.ShapeRange.Left = 50
        pptApp.ActiveWindow.Selection.ShapeRange.Top = 50
        pptApp.ActiveWindow.Selection.ShapeRange.Width = 600
        pptApp.ActiveWindow.Selection.ShapeRange.Height = 400
    Else
        MsgBox "Chart 'StressStrainChart' not found!", vbExclamation
        Exit Sub
    End If
    
    ' Step 5: Add summary table slide
    Set pptSlide = pptPres.Slides.Add(3, 12)  ' Blank layout
    
    ' Add title
    With pptSlide.Shapes.AddTextbox(1, 50, 20, 600, 40)
        .TextFrame.TextRange.Text = "Summary Statistics"
        .TextFrame.TextRange.Font.Size = 24
        .TextFrame.TextRange.Font.Bold = True
    End With
    
    ' Copy summary table from Excel (adjust range as needed)
    ActiveSheet.Range("F2:G10").Copy
    
    ' Paste as table in PowerPoint
    pptSlide.Shapes.PasteSpecial 2  ' ppPasteEnhancedMetafile = 2
    pptApp.ActiveWindow.Selection.ShapeRange.Left = 100
    pptApp.ActiveWindow.Selection.ShapeRange.Top = 100
    
    ' Step 6: Save as PDF
    pdfPath = ThisWorkbook.Path & "\" & expCode & "_Report_" & reportDate & ".pdf"
    pptPres.SaveAs pdfPath, 32  ' ppSaveAsPDF = 32
    
    ' Step 7: Save PowerPoint
    pptPres.SaveAs ThisWorkbook.Path & "\" & expCode & "_Report_" & reportDate & ".pptx"
    
    ' Close PowerPoint
    pptPres.Close
    pptApp.Quit
    
    Set pptSlide = Nothing
    Set pptPres = Nothing
    Set pptApp = Nothing
    
    MsgBox "Report generated successfully!" & vbCrLf & _
           "PowerPoint: " & expCode & "_Report_" & reportDate & ".pptx" & vbCrLf & _
           "PDF: " & expCode & "_Report_" & reportDate & ".pdf", _
           vbInformation, "Report Complete"
    
End Sub
```

### Alternative: Export Only to PDF (No PowerPoint)

```vba
Sub ExportChartToPDF()
' Simpler version - export chart directly to PDF

    Dim chartObj As ChartObject
    Dim pdfPath As String
    Dim expCode As String
    
    expCode = InputBox("Enter experiment code:", "PDF Export", "Exp343.2")
    If expCode = "" Then Exit Sub
    
    ' Get chart
    Set chartObj = ActiveSheet.ChartObjects("StressStrainChart")
    
    If chartObj Is Nothing Then
        MsgBox "Chart not found!", vbCritical
        Exit Sub
    End If
    
    ' Export chart as PDF
    pdfPath = ThisWorkbook.Path & "\" & expCode & "_Chart_" & Format(Date, "yyyymmdd") & ".pdf"
    chartObj.Chart.ExportAsFixedFormat _
        Type:=0, _
        Filename:=pdfPath, _
        Quality:=0, _
        IncludeDocProperties:=True, _
        IgnorePrintAreas:=False
    
    MsgBox "Chart exported to:" & vbCrLf & pdfPath, vbInformation
    
End Sub
```

### Key Learning Points

**PowerPoint Automation:**
- `CreateObject("PowerPoint.Application")` - Launch PowerPoint
- `Presentations.Add` - Create new presentation
- `Slides.Add(index, layout)` - Add slide with layout
- `.Shapes.Paste` - Paste copied content

**PDF Export:**
- `ExportAsFixedFormat` - Built-in PDF export
- Type:=0 means PDF format
- Works for Charts, Worksheets, or Ranges

**File Operations:**
- `ThisWorkbook.Path` - Get current workbook folder
- `Format(Date, "yyyy-mm-dd")` - Date formatting for filename
- Standardized naming convention

---

## Bonus: Common VBA Patterns

### Pattern 1: Safe Sheet Access

```vba
Function GetOrCreateSheet(sheetName As String) As Worksheet
' Returns existing sheet or creates new one

    Dim ws As Worksheet
    
    On Error Resume Next
    Set ws = Worksheets(sheetName)
    On Error GoTo 0
    
    If ws Is Nothing Then
        Set ws = Worksheets.Add
        ws.Name = sheetName
    End If
    
    Set GetOrCreateSheet = ws
    
End Function
```

### Pattern 2: Progress Bar (For Long Operations)

```vba
Sub ShowProgress()
    Dim i As Long
    Dim totalItems As Long
    
    totalItems = 100
    
    For i = 1 To totalItems
        ' Your processing code here
        
        ' Update status bar
        Application.StatusBar = "Processing: " & i & " of " & totalItems & _
                                " (" & Format(i / totalItems, "0%") & ")"
        
        DoEvents  ' Allow Excel to update
    Next i
    
    Application.StatusBar = False  ' Reset status bar
    
End Sub
```

### Pattern 3: Backup Before Macro

```vba
Sub MacroWithBackup()
' Creates backup before making changes

    Dim backupPath As String
    
    ' Save current state
    ActiveWorkbook.Save
    
    ' Create backup copy
    backupPath = ThisWorkbook.Path & "\Backup_" & _
                 Format(Now, "yyyymmdd_hhmmss") & ".xlsx"
    ActiveWorkbook.SaveCopyAs backupPath
    
    ' Now run your macro
    ' ... your code here ...
    
    MsgBox "Changes complete. Backup saved to:" & vbCrLf & backupPath
    
End Sub
```

---

## Testing Checklist

Before submitting any exercise:

- [ ] **Code runs without errors**
- [ ] **Produces expected output**
- [ ] **Handles missing sheets gracefully**
- [ ] **Includes comments explaining logic**
- [ ] **Uses dynamic ranges (not hardcoded)**
- [ ] **Provides user feedback (MsgBox)**
- [ ] **Formatted professionally**
- [ ] **Tested on dummy data first!**

---

## Next Steps

1. **Practice** - Try modifying these solutions
2. **Experiment** - Change colors, formats, calculations
3. **Combine** - Mix techniques from different solutions
4. **Share** - Show colleagues your automated workflows
5. **Document** - Keep notes on what works best for your lab

---

**Remember:** The best macro is one that saves you time and that you understand well enough to maintain!

---

*Solutions prepared for Excel Macros Workshop*  
*Last updated: February 2026*
