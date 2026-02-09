Attribute VB_Name = "Workshop_Macros"
' ============================================================================
' EXCEL VBA WORKSHOP - TENSILE TESTING MACROS
' ============================================================================
' Collection of macros for material science tensile testing workflow
' Designed for educational workshop on Excel automation
' ============================================================================

' ============================================================================
' MACRO 1: Format Tensile Table
' ============================================================================
Sub FormatTensileTable()
' Formats a tensile test data table with proper headers, borders, and styling
' Assumes: Specimen info in rows 3-4
'          Table headers in row 6
'          Data starts at row 7
'          Columns A-D: Time, Load, Extension, Displacement

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim headerRange As Range
    Dim dataRange As Range
    
    Set ws = ActiveSheet
    
    ' Find last row of data (column B has Load data)
    lastRow = ws.Cells(ws.Rows.Count, "B").End(xlUp).Row
    
    ' Ensure we have data (should be at least row 7)
    If lastRow < 7 Then
        MsgBox "No data found to format!", vbExclamation
        Exit Sub
    End If
    
    ' ========================================
    ' 1. ADD UNITS TO HEADERS (Row 6)
    ' ========================================
    ws.Range("A6").Value = "Time (s)"
    ws.Range("B6").Value = "Load (N)"
    ws.Range("C6").Value = "Extension (mm)"
    ws.Range("D6").Value = "Displacement (mm)"
    
    ' ========================================
    ' 2. FORMAT HEADERS
    ' ========================================
    Set headerRange = ws.Range("A6:D6")
    With headerRange
        .Font.Bold = True
        .Font.Size = 11
        .Font.Color = RGB(255, 255, 255)  ' White text
        .Interior.Color = RGB(0, 112, 192)  ' Blue background
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
    End With
    
    ' ========================================
    ' 3. FORMAT DATA AREA (starts at row 7)
    ' ========================================
    Set dataRange = ws.Range("A7:D" & lastRow)
    
    ' Number formatting
    ws.Range("A7:A" & lastRow).NumberFormat = "0.000"     ' Time: 3 decimals
    ws.Range("B7:B" & lastRow).NumberFormat = "0.00"      ' Load: 2 decimals
    ws.Range("C7:D" & lastRow).NumberFormat = "0.0000"    ' Extension/Displacement: 4 decimals
    
    ' Alignment
    dataRange.HorizontalAlignment = xlCenter
    
    ' ========================================
    ' 4. ADD BORDERS
    ' ========================================
    Set dataRange = ws.Range("A6:D" & lastRow)
    With dataRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .Color = RGB(180, 180, 180)  ' Light grey
    End With
    
    ' Thicker border around entire table (from headers to last data row)
    ws.Range("A6:D" & lastRow).BorderAround _
        LineStyle:=xlContinuous, _
        Weight:=xlMedium, _
        Color:=RGB(0, 0, 0)
    
    ' ========================================
    ' 5. AUTO-FIT COLUMNS
    ' ========================================
    ws.Columns("A:D").AutoFit
    ws.Columns("A:D").ColumnWidth = ws.Columns("A:D").ColumnWidth + 2  ' Add padding
    
    ' Success message
    MsgBox "Table formatted successfully!" & vbCrLf & _
           "Rows formatted: " & (lastRow - 3), _
           vbInformation, "Formatting Complete"
    
End Sub


' ============================================================================
' MACRO 2: Calculate Stress and Strain
' ============================================================================
Sub CalculateStressStrain()
' Calculates stress and strain from raw UTM data
' Uses specimen dimensions from ROW 4 (cells B4, C4, D4)
' Stress (MPa) = Load (N) / CSA (mm²)
' Strain = Extension (mm) / Gauge Length (mm)
' Adds new columns E and F for Stress and Strain

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim width As Double, thickness As Double, gaugeLength As Double
    Dim csa As Double
    Dim i As Long
    
    Set ws = ActiveSheet
    
    ' Get specimen dimensions from ROW 4
    width = ws.Range("B4").Value          ' mm (Width in B4)
    thickness = ws.Range("C4").Value      ' mm (Thickness in C4)
    gaugeLength = ws.Range("D4").Value    ' mm (Gauge Length in D4)
    
    ' Calculate cross-sectional area
    csa = width * thickness               ' mm²
    
    ' Validate dimensions
    If csa <= 0 Or gaugeLength <= 0 Then
        MsgBox "Error: Invalid specimen dimensions in row 4!" & vbCrLf & _
               "Width (B4): " & width & " mm" & vbCrLf & _
               "Thickness (C4): " & thickness & " mm" & vbCrLf & _
               "Gauge Length (D4): " & gaugeLength & " mm", _
               vbCritical, "Invalid Data"
        Exit Sub
    End If
    
    ' Find last row of data (column B has Load data)
    lastRow = ws.Cells(ws.Rows.Count, "B").End(xlUp).Row
    
    ' Add headers in columns E and F in row 6 (after Displacement in D6)
    ws.Range("E6").Value = "Stress (MPa)"
    ws.Range("F6").Value = "Strain"
    
    ' Format headers to match existing style
    With ws.Range("E6:F6")
        .Font.Bold = True
        .Font.Size = 11
        .Font.Color = RGB(255, 255, 255)
        .Interior.Color = RGB(0, 112, 192)
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
    End With
    
    ' Calculate for each data row (starting row 7)
    For i = 7 To lastRow
        ' Stress (MPa) = Load (N) / CSA (mm²)
        ws.Range("E" & i).Formula = "=B" & i & "/" & csa
        
        ' Strain = Extension (mm) / Gauge Length (mm)
        ws.Range("F" & i).Formula = "=C" & i & "/" & gaugeLength
    Next i
    
    ' Format the calculated columns (4 decimal places for precision)
    ws.Range("E7:F" & lastRow).NumberFormat = "0.0000"
    ws.Range("E7:F" & lastRow).HorizontalAlignment = xlCenter
    
    ' Add borders to new columns
    With ws.Range("E6:F" & lastRow).Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .Color = RGB(180, 180, 180)
    End With
    
    ' Extend outer border (from headers row 6 to last data row)
    ws.Range("A6:F" & lastRow).BorderAround _
        LineStyle:=xlContinuous, _
        Weight:=xlMedium, _
        Color:=RGB(0, 0, 0)
    
    ' Auto-fit new columns
    ws.Columns("E:F").AutoFit
    ws.Columns("E:F").ColumnWidth = ws.Columns("E:F").ColumnWidth + 2
    
    MsgBox "Stress and strain calculated successfully!" & vbCrLf & _
           "CSA: " & Format(csa, "0.000") & " mm²" & vbCrLf & _
           "Gauge Length: " & gaugeLength & " mm" & vbCrLf & _
           "Data rows calculated: " & (lastRow - 6), _
           vbInformation, "Calculation Complete"
    
End Sub


' ============================================================================
' MACRO 3: Create Stress-Strain Chart
' ============================================================================
Sub CreateStressStrainChart()
' Creates a standardised stress-strain curve
' Assumes: Strain in column F, Stress in column E (calculated by Macro 2)
'          Data starts at row 7

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim chartObj As ChartObject
    Dim specimenName As String
    
    Set ws = ActiveSheet
    
    ' Get data range (find last row in Stress column E)
    lastRow = ws.Cells(ws.Rows.Count, "E").End(xlUp).Row
    
    ' Check if we have calculated stress/strain data (should be at least row 7)
    If lastRow < 7 Then
        MsgBox "No stress/strain data found!" & vbCrLf & _
               "Please run CalculateStressStrain first.", _
               vbExclamation, "Insufficient Data"
        Exit Sub
    End If
    
    ' Get specimen name from A4 (SpecimenID in row 4)
    specimenName = ws.Range("A4").Value
    If specimenName = "" Then specimenName = "Demo Specimen"
    
    ' Delete existing chart if present
    On Error Resume Next
    ws.ChartObjects("StressStrainChart").Delete
    On Error GoTo 0
    
    ' Create chart positioned to the right of data
    Set chartObj = ws.ChartObjects.Add( _
        Left:=ws.Range("H5").Left, _
        Top:=ws.Range("H5").Top, _
        Width:=450, _
        Height:=300)
    
    chartObj.Name = "StressStrainChart"
    
    With chartObj.Chart
        ' Set chart type to scatter with lines
        .ChartType = xlXYScatterLines
        
        ' Add data series (starting from row 7)
        .SeriesCollection.NewSeries
        With .SeriesCollection(1)
            .Name = specimenName
            .XValues = ws.Range("F7:F" & lastRow)  ' Strain (column F, starts row 7)
            .Values = ws.Range("E7:E" & lastRow)   ' Stress (column E, starts row 7)
            .MarkerStyle = xlMarkerStyleNone
            .Format.Line.ForeColor.RGB = RGB(0, 112, 192)  ' Blue
            .Format.Line.Weight = 2.5
        End With
        
        ' Format axes
        .Axes(xlCategory).HasTitle = True
        .Axes(xlCategory).AxisTitle.Text = "Strain"
        .Axes(xlCategory).AxisTitle.Font.Size = 11
        .Axes(xlCategory).AxisTitle.Font.Bold = True
        
        .Axes(xlValue).HasTitle = True
        .Axes(xlValue).AxisTitle.Text = "Stress (MPa)"
        .Axes(xlValue).AxisTitle.Font.Size = 11
        .Axes(xlValue).AxisTitle.Font.Bold = True
        
        ' Format chart title
        .HasTitle = True
        .ChartTitle.Text = "Stress-Strain Curve: " & specimenName
        .ChartTitle.Font.Size = 14
        .ChartTitle.Font.Bold = True
        .ChartTitle.Font.Color = RGB(0, 70, 130)
        
        ' Gridlines
        .Axes(xlCategory).HasMajorGridlines = False
        .Axes(xlValue).HasMajorGridlines = True
        .Axes(xlValue).MajorGridlines.Format.Line.ForeColor.RGB = RGB(200, 200, 200)
        
        ' Format plot area
        .PlotArea.Format.Fill.ForeColor.RGB = RGB(255, 255, 255)  ' White
        .ChartArea.Format.Fill.ForeColor.RGB = RGB(245, 245, 245)  ' Light grey
        
        ' Remove legend (only one series)
        .HasLegend = False
        
    End With
    
    MsgBox "Stress-strain chart created successfully!", _
           vbInformation, "Chart Complete"
    
End Sub


' ============================================================================
' MACRO 4: Clean UTM Data
' ============================================================================
Sub CleanUTMData()
' Cleans raw UTM export data by removing blank rows and duplicate headers
' Useful for messy machine output files

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim i As Long
    Dim deletedRows As Long
    
    Set ws = ActiveSheet
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    deletedRows = 0
    
    Application.ScreenUpdating = False
    
    ' Loop from bottom to top (safer when deleting rows)
    For i = lastRow To 1 Step -1
        ' Delete if row is completely blank
        If Application.WorksheetFunction.CountA(ws.Rows(i)) = 0 Then
            ws.Rows(i).Delete
            deletedRows = deletedRows + 1
        ' Delete if row contains duplicate header
        ElseIf i > 1 And InStr(1, ws.Cells(i, 1).Value, "Time", vbTextCompare) > 0 Then
            If InStr(1, ws.Cells(i, 2).Value, "Load", vbTextCompare) > 0 Then
                ws.Rows(i).Delete
                deletedRows = deletedRows + 1
            End If
        End If
    Next i
    
    Application.ScreenUpdating = True
    
    MsgBox "Cleaning complete!" & vbCrLf & _
           "Rows deleted: " & deletedRows, _
           vbInformation, "Clean UTM Data"
    
End Sub


' ============================================================================
' MACRO 5: Batch Process Multiple Specimens
' ============================================================================
Sub BatchProcessSpecimens()
' Processes multiple specimen sheets in one workbook
' Applies formatting, calculates stress/strain, creates charts

    Dim ws As Worksheet
    Dim processedCount As Integer
    Dim errorCount As Integer
    Dim sheetName As String
    
    processedCount = 0
    errorCount = 0
    
    Application.ScreenUpdating = False
    Application.DisplayAlerts = False
    
    ' Loop through all worksheets
    For Each ws In ThisWorkbook.Worksheets
        sheetName = ws.Name
        
        ' Skip summary or instruction sheets
        If InStr(1, sheetName, "Summary", vbTextCompare) = 0 And _
           InStr(1, sheetName, "Instructions", vbTextCompare) = 0 Then
            
            On Error Resume Next
            ws.Activate
            
            ' Apply macros
            Call FormatTensileTable
            Call CalculateStressStrain
            Call CreateStressStrainChart
            
            If Err.Number = 0 Then
                processedCount = processedCount + 1
            Else
                errorCount = errorCount + 1
                Err.Clear
            End If
            On Error GoTo 0
            
        End If
    Next ws
    
    Application.ScreenUpdating = True
    Application.DisplayAlerts = True
    
    MsgBox "Batch processing complete!" & vbCrLf & _
           "Sheets processed: " & processedCount & vbCrLf & _
           "Errors: " & errorCount, _
           vbInformation, "Batch Process Complete"
    
End Sub


' ============================================================================
' MACRO 6: Export Charts to PowerPoint
' ============================================================================
Sub ExportChartsToPowerPoint()
' Exports all stress-strain charts to a new PowerPoint presentation
' Creates one slide per chart

    Dim ws As Worksheet
    Dim cht As ChartObject
    Dim pptApp As Object
    Dim pptPres As Object
    Dim pptSlide As Object
    Dim slideCount As Integer
    
    On Error GoTo ErrorHandler
    
    ' Create PowerPoint application
    On Error Resume Next
    Set pptApp = GetObject(, "PowerPoint.Application")
    If pptApp Is Nothing Then
        Set pptApp = CreateObject("PowerPoint.Application")
    End If
    If pptApp Is Nothing Then
        MsgBox "Could not start PowerPoint. Please ensure PowerPoint is installed.", vbCritical
        Exit Sub
    End If
    On Error GoTo ErrorHandler
    
    pptApp.Visible = True
    
    ' Create new presentation
    Set pptPres = pptApp.Presentations.Add
    slideCount = 0
    
    ' Loop through all worksheets and find charts
    For Each ws In ThisWorkbook.Worksheets
        For Each cht In ws.ChartObjects
            ' Copy chart
            cht.Chart.ChartArea.Copy
            
            ' Create new slide (ppLayoutBlank = 12)
            slideCount = slideCount + 1
            Set pptSlide = pptPres.Slides.Add(slideCount, 12)
            
            ' Paste chart
            On Error Resume Next
            pptSlide.Shapes.Paste
            
            ' Position chart (centered)
            If pptSlide.Shapes.Count > 0 Then
                With pptSlide.Shapes(pptSlide.Shapes.Count)  ' Last added shape
                    .Left = (pptPres.PageSetup.SlideWidth - .Width) / 2
                    .Top = (pptPres.PageSetup.SlideHeight - .Height) / 2
                End With
            End If
            On Error GoTo 0
        Next cht
    Next ws
    
    MsgBox "Charts exported to PowerPoint!" & vbCrLf & _
           "Slides created: " & slideCount, _
           vbInformation, "Export Complete"
    Exit Sub
    
ErrorHandler:
    MsgBox "Error exporting to PowerPoint:" & vbCrLf & vbCrLf & _
           "Error " & Err.Number & ": " & Err.Description & vbCrLf & vbCrLf & _
           "Line: " & Erl, _
           vbCritical, "Export Error"
    
End Sub


' ============================================================================
' MACRO 7: Import and Format TXT File (Advanced)
' ============================================================================
Sub ImportAndFormatUTMFile()
' Imports a .txt file from UTM machine, cleans metadata, and formats
' Combines import + cleaning + formatting in one macro

    Dim filePath As String
    Dim newSheet As Worksheet
    Dim qt As QueryTable
    Dim lastRow As Long
    Dim metadataEndRow As Long
    Dim i As Long
    
    ' Prompt user to select file
    filePath = Application.GetOpenFilename( _
        FileFilter:="Text Files (*.txt), *.txt", _
        Title:="Select UTM Data File")
    
    If filePath = "False" Then
        MsgBox "No file selected.", vbExclamation
        Exit Sub
    End If
    
    Application.ScreenUpdating = False
    
    ' Create new worksheet
    Set newSheet = ThisWorkbook.Worksheets.Add
    newSheet.Name = "Imported_" & Format(Now, "hhmmss")
    
    ' Import text file using QueryTables
    Set qt = newSheet.QueryTables.Add( _
        Connection:="TEXT;" & filePath, _
        Destination:=newSheet.Range("A1"))
    
    With qt
        .TextFileParseType = xlDelimited
        .TextFileTabDelimiter = True
        .TextFileCommaDelimiter = False
        .TextFileSemicolonDelimiter = False
        .TextFileSpaceDelimiter = False
        .Refresh BackgroundQuery:=False
    End With
    
    ' Find where data starts (look for "Time" header)
    lastRow = newSheet.Cells(newSheet.Rows.Count, "A").End(xlUp).Row
    metadataEndRow = 0
    
    For i = 1 To lastRow
        If InStr(1, newSheet.Cells(i, 1).Value, "Time", vbTextCompare) > 0 Then
            metadataEndRow = i - 1
            Exit For
        End If
    Next i
    
    ' Delete metadata rows if found
    If metadataEndRow > 0 Then
        newSheet.Rows("1:" & metadataEndRow).Delete
    End If
    
    ' Delete QueryTable (no longer needed)
    qt.Delete
    
    ' Now format the cleaned data
    newSheet.Activate
    Call FormatTensileTable
    
    Application.ScreenUpdating = True
    
    MsgBox "File imported and formatted successfully!" & vbCrLf & _
           "New sheet: " & newSheet.Name, _
           vbInformation, "Import Complete"
    
End Sub
