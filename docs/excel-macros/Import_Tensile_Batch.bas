Attribute VB_Name = "Import_Tensile_Batch"
' ============================================================================
' BATCH IMPORT MACRO FOR TENSILE TEST DATA
' ============================================================================
' Imports 7 txt files from UTM machine into template spreadsheet
' Fills specimen specifications table and raw data table
' ============================================================================

Sub ImportTensileTestBatch()
' Main macro to import 7 tensile test files into template
' Assumes: Exp343.2_1.txt through Exp343.2_7.txt in same folder
' Fills both metadata table and curve data table

    Dim folderPath As String
    Dim fileName As String
    Dim fileNum As Integer
    Dim ws As Worksheet
    Dim startTime As Double
    
    startTime = Timer
    
    ' Get the active worksheet (template)
    Set ws = ActiveSheet
    
    ' Prompt user for folder containing txt files
    With Application.FileDialog(msoFileDialogFolderPicker)
        .Title = "Select Folder Containing Tensile Test Files"
        .AllowMultiSelect = False
        If .Show = -1 Then
            folderPath = .SelectedItems(1)
        Else
            MsgBox "No folder selected. Import cancelled.", vbExclamation
            Exit Sub
        End If
    End With
    
    ' Ensure folder path ends with backslash
    If Right(folderPath, 1) <> "\" Then folderPath = folderPath & "\"
    
    ' Turn off screen updating for speed
    Application.ScreenUpdating = False
    Application.Calculation = xlCalculationManual
    
    ' Import each of the 7 files
    For fileNum = 1 To 7
        fileName = folderPath & "Exp343.2_" & fileNum & ".txt"
        
        ' Check if file exists
        If Dir(fileName) <> "" Then
            Call ImportSingleFile(fileName, fileNum, ws)
        Else
            MsgBox "Warning: File not found: " & fileName, vbExclamation
        End If
    Next fileNum
    
    ' Restore Excel settings
    Application.Calculation = xlCalculationAutomatic
    Application.ScreenUpdating = True
    
    ' Success message
    MsgBox "Import complete!" & vbCrLf & _
           "7 tensile test files imported" & vbCrLf & _
           "Time: " & Format(Timer - startTime, "0.0") & " seconds", _
           vbInformation, "Batch Import Complete"
    
End Sub


Sub ImportSingleFile(filePath As String, specimenNum As Integer, ws As Worksheet)
' Imports a single txt file and fills corresponding row in template
' Parameters:
'   filePath: Full path to txt file
'   specimenNum: Specimen number (1-7)
'   ws: Worksheet to fill

    Dim fileContent As String
    Dim lines() As String
    Dim i As Long
    Dim metadataRow As Long
    Dim dataStartRow As Long
    
    ' Define row positions for specimen metadata table (adjust based on your template)
    ' Assuming specimens 1-7 are in rows 5-11 (change if different)
    metadataRow = 4 + specimenNum  ' Row 5 for specimen 1, row 6 for specimen 2, etc.
    
    ' Read entire file
    fileContent = ReadTextFile(filePath)
    lines = Split(fileContent, vbCrLf)
    
    ' Parse metadata from [Item] section
    Dim width As Double, thickness As Double, csa As Double, gaugeLength As Double
    
    For i = 0 To UBound(lines)
        If InStr(lines(i), "Width = ") > 0 Then
            width = Val(Split(lines(i), " = ")(1))
        ElseIf InStr(lines(i), "Thickness = ") > 0 Then
            thickness = Val(Split(lines(i), " = ")(1))
        ElseIf InStr(lines(i), "So = ") > 0 Then
            csa = Val(Split(lines(i), " = ")(1))
        ElseIf InStr(lines(i), "Lo = ") > 0 Then
            gaugeLength = Val(Split(lines(i), " = ")(1))
        End If
    Next i
    
    ' Fill metadata table (adjust column letters based on your template)
    ' From image: columns are approximately B-I
    ' Sample No., Aerial Density, Density Bulk, Density Specimen, Porosity, T_avg, W_avg, CSA_avg, Gauge Length
    
    ws.Cells(metadataRow, 1).Value = specimenNum & ".000"  ' Sample No. (column A)
    ws.Cells(metadataRow, 7).Value = width                  ' W_avg [mm] (column G)
    ws.Cells(metadataRow, 8).Value = csa                    ' CSA_avg [mm²] (column H)
    ws.Cells(metadataRow, 9).Value = gaugeLength            ' Gauge Length (column I)
    ws.Cells(metadataRow, 6).Value = thickness              ' T_avg [mm] (column F)
    
    ' Find where curve data starts (after [Specimen0] and header line)
    dataStartRow = 0
    For i = 0 To UBound(lines)
        If InStr(lines(i), "Time") > 0 And InStr(lines(i), "Load") > 0 Then
            dataStartRow = i + 1  ' Data starts on next line
            Exit For
        End If
    Next i
    
    ' Import curve data (Load, Extension, Displacement)
    ' Assumes data table starts at a specific row (adjust as needed)
    ' From image, looks like data starts around row 15-20
    Dim dataTableStartRow As Long
    dataTableStartRow = 15  ' ADJUST THIS based on where your green table starts
    
    Dim dataRowOffset As Long
    Dim dataLine() As String
    Dim load As Double, extension As Double, displacement As Double
    
    dataRowOffset = 0
    
    For i = dataStartRow To UBound(lines)
        If Trim(lines(i)) = "" Then Exit For  ' Stop at empty line
        
        ' Split line by tab
        dataLine = Split(lines(i), vbTab)
        
        If UBound(dataLine) >= 3 Then
            load = Val(dataLine(1))              ' Load column
            extension = Val(dataLine(2))         ' Extension column
            displacement = Val(dataLine(3))      ' Displacement column
            
            ' Write to template (adjust columns as needed)
            ' From image: Load (column A?), Extension (column B?), Extension Correction (column C?)
            ws.Cells(dataTableStartRow + dataRowOffset, 1).Value = load
            ws.Cells(dataTableStartRow + dataRowOffset, 2).Value = extension
            ws.Cells(dataTableStartRow + dataRowOffset, 3).Value = displacement  ' Extension Correction
            
            dataRowOffset = dataRowOffset + 1
        End If
    Next i
    
End Sub


Function ReadTextFile(filePath As String) As String
' Reads entire text file and returns content as string
' Handles UTF-8 and ANSI encoding

    Dim fileNum As Integer
    Dim fileContent As String
    Dim textLine As String
    
    fileNum = FreeFile
    fileContent = ""
    
    On Error GoTo ErrorHandler
    
    Open filePath For Input As #fileNum
    
    Do Until EOF(fileNum)
        Line Input #fileNum, textLine
        fileContent = fileContent & textLine & vbCrLf
    Loop
    
    Close #fileNum
    
    ReadTextFile = fileContent
    Exit Function
    
ErrorHandler:
    Close #fileNum
    MsgBox "Error reading file: " & filePath & vbCrLf & Err.Description, vbCritical
    ReadTextFile = ""
    
End Function


' ============================================================================
' ALTERNATIVE: Import with File Picker (Single File)
' ============================================================================

Sub ImportSingleTensileTest()
' Import a single tensile test file
' Useful for testing or individual imports

    Dim filePath As String
    Dim specimenNum As Integer
    Dim ws As Worksheet
    
    Set ws = ActiveSheet
    
    ' Prompt user to select file
    filePath = Application.GetOpenFilename( _
        FileFilter:="Text Files (*.txt), *.txt", _
        Title:="Select Tensile Test File")
    
    If filePath = "False" Then
        MsgBox "No file selected.", vbExclamation
        Exit Sub
    End If
    
    ' Prompt for specimen number (1-7)
    specimenNum = Application.InputBox( _
        Prompt:="Enter specimen number (1-7):", _
        Title:="Specimen Number", _
        Type:=1)
    
    If specimenNum < 1 Or specimenNum > 7 Then
        MsgBox "Invalid specimen number. Must be 1-7.", vbCritical
        Exit Sub
    End If
    
    ' Import
    Application.ScreenUpdating = False
    Call ImportSingleFile(filePath, specimenNum, ws)
    Application.ScreenUpdating = True
    
    MsgBox "Import complete for Specimen " & specimenNum, vbInformation
    
End Sub
