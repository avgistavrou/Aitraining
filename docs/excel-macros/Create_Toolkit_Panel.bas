Attribute VB_Name = "Create_Toolkit_Panel"
' ============================================================================
' PROFESSIONAL BUTTON TOOLKIT CREATOR
' ============================================================================
' Creates a grouped, professional-looking button panel instead of random buttons
' Demo macro for Excel VBA Workshop
' ============================================================================

Sub CreateTensileToolkitPanel()
' Creates a professional button panel with frame, title, and organized buttons
' Positioned to avoid specimen data (rows 3-4)
' All elements grouped together for easy repositioning

    Dim ws As Worksheet
    Dim btnFormat As Button, btnCalc As Button, btnChart As Button
    Dim frameShape As Shape
    Dim titleShape As Shape
    Dim panelLeft As Double, panelTop As Double
    Dim shapeNames() As String
    
    Set ws = ActiveSheet
    
    ' Delete existing panel if present
    On Error Resume Next
    ws.Shapes("TensileToolkitPanel").Delete
    On Error GoTo 0
    
    ' Position panel (column J, row 8 - below specimen info and headers)
    panelLeft = ws.Range("J8").Left
    panelTop = ws.Range("J8").Top
    
    ' ========================================
    ' 1. CREATE BACKGROUND FRAME
    ' ========================================
    Set frameShape = ws.Shapes.AddShape(msoShapeRoundedRectangle, _
        panelLeft, panelTop, 200, 180)
    
    With frameShape
        .Name = "ToolkitFrame"
        .Fill.ForeColor.RGB = RGB(240, 248, 255)  ' Light blue background (AliceBlue)
        .Fill.Transparency = 0.1
        .Line.ForeColor.RGB = RGB(0, 112, 192)    ' Professional blue border
        .Line.Weight = 2.5
        .Line.DashStyle = msoLineSolid
        .Shadow.Type = msoShadow21                ' Subtle perspective shadow
        .Shadow.Blur = 5
        .Shadow.OffsetX = 2
        .Shadow.OffsetY = 2
    End With
    
    ' ========================================
    ' 2. ADD TITLE LABEL
    ' ========================================
    Set titleShape = ws.Shapes.AddTextbox(msoTextOrientationHorizontal, _
        panelLeft + 10, panelTop + 10, 180, 30)
    
    With titleShape
        .Name = "ToolkitTitle"
        .TextFrame2.TextRange.Text = "Tensile Analysis Toolkit"
        .TextFrame2.TextRange.Font.Size = 12
        .TextFrame2.TextRange.Font.Bold = True
        .TextFrame2.TextRange.Font.Fill.ForeColor.RGB = RGB(0, 70, 130)  ' Dark blue
        .TextFrame2.TextRange.ParagraphFormat.Alignment = msoAlignCenter
        .TextFrame2.VerticalAnchor = msoAnchorMiddle
        .Fill.Visible = msoFalse
        .Line.Visible = msoFalse
    End With
    
    ' ========================================
    ' 3. CREATE BUTTONS (STACKED VERTICALLY)
    ' ========================================
    
    ' Button 1: Format Table
    Set btnFormat = ws.Buttons.Add(panelLeft + 15, panelTop + 50, 170, 32)
    With btnFormat
        .OnAction = "FormatTensileTable"
        .Text = "1. Format Table"
        .Name = "BtnFormat"
    End With
    
    ' Button 2: Calculate Stress/Strain
    Set btnCalc = ws.Buttons.Add(panelLeft + 15, panelTop + 90, 170, 32)
    With btnCalc
        .OnAction = "CalculateStressStrain"
        .Text = "2. Calculate Stress/Strain"
        .Name = "BtnCalculate"
    End With
    
    ' Button 3: Create Chart
    Set btnChart = ws.Buttons.Add(panelLeft + 15, panelTop + 130, 170, 32)
    With btnChart
        .OnAction = "CreateStressStrainChart"
        .Text = "3. Create Chart"
        .Name = "BtnChart"
    End With
    
    ' ========================================
    ' 4. STYLE BUTTONS CONSISTENTLY
    ' ========================================
    With btnFormat.Font
        .Name = "Segoe UI"
        .Size = 10
        .Bold = False
        .ColorIndex = xlAutomatic
    End With
    
    With btnCalc.Font
        .Name = "Segoe UI"
        .Size = 10
        .Bold = False
        .ColorIndex = xlAutomatic
    End With
    
    With btnChart.Font
        .Name = "Segoe UI"
        .Size = 10
        .Bold = False
        .ColorIndex = xlAutomatic
    End With
    
    ' ========================================
    ' 5. GROUP EVERYTHING TOGETHER
    ' ========================================
    ReDim shapeNames(0 To 4)
    shapeNames(0) = "ToolkitFrame"
    shapeNames(1) = "ToolkitTitle"
    shapeNames(2) = btnFormat.Name
    shapeNames(3) = btnCalc.Name
    shapeNames(4) = btnChart.Name
    
    On Error Resume Next
    ws.Shapes.Range(shapeNames).Group.Name = "TensileToolkitPanel"
    On Error GoTo 0
    
    ' ========================================
    ' SUCCESS MESSAGE
    ' ========================================
    MsgBox "Toolkit panel created successfully!" & vbCrLf & vbCrLf & _
           "Features:" & vbCrLf & _
           "  - Professional grouped layout" & vbCrLf & _
           "  - Positioned at column J, row 8" & vbCrLf & _
           "  - Numbered workflow (1 -> 2 -> 3)" & vbCrLf & _
           "  - Can be dragged as one unit" & vbCrLf & vbCrLf & _
           "Tip: Right-click the panel and select" & vbCrLf & _
           "'Group -> Ungroup' to edit individual elements", _
           vbInformation, "Toolkit Panel Created"
    
End Sub


' ============================================================================
' DELETE TOOLKIT PANEL
' ============================================================================

Sub DeleteToolkitPanel()
' Removes the toolkit panel from the worksheet
' Useful for resetting or repositioning

    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    On Error Resume Next
    ws.Shapes("TensileToolkitPanel").Delete
    
    If Err.Number = 0 Then
        MsgBox "Toolkit panel deleted.", vbInformation
    Else
        MsgBox "No toolkit panel found to delete.", vbExclamation
    End If
    On Error GoTo 0
    
End Sub


' ============================================================================
' REPOSITION TOOLKIT PANEL
' ============================================================================

Sub RepositionToolkitPanel()
' Allows user to specify new position for toolkit panel
' Uses InputBox to get column letter

    Dim ws As Worksheet
    Dim newColumn As String
    Dim newLeft As Double, newTop As Double
    
    Set ws = ActiveSheet
    
    ' Check if panel exists
    On Error Resume Next
    If ws.Shapes("TensileToolkitPanel") Is Nothing Then
        MsgBox "Toolkit panel not found. Create it first using CreateTensileToolkitPanel.", vbExclamation
        Exit Sub
    End If
    On Error GoTo 0
    
    ' Get new column from user
    newColumn = InputBox( _
        Prompt:="Enter column letter for panel position (e.g., J, M, P):", _
        Title:="Reposition Toolkit Panel", _
        Default:="J")
    
    If newColumn = "" Then Exit Sub
    
    ' Validate input
    newColumn = UCase(Trim(newColumn))
    If Len(newColumn) > 2 Or Not IsLetter(newColumn) Then
        MsgBox "Invalid column letter.", vbCritical
        Exit Sub
    End If
    
    ' Get new position (row 8 to avoid specimen data)
    newLeft = ws.Range(newColumn & "8").Left
    newTop = ws.Range(newColumn & "8").Top
    
    ' Move panel
    With ws.Shapes("TensileToolkitPanel")
        .Left = newLeft
        .Top = newTop
    End With
    
    MsgBox "Toolkit panel moved to column " & newColumn, vbInformation
    
End Sub


' ============================================================================
' HELPER FUNCTION
' ============================================================================

Private Function IsLetter(text As String) As Boolean
' Checks if text contains only letters (A-Z)

    Dim i As Integer
    IsLetter = True
    
    For i = 1 To Len(text)
        If Not (Mid(text, i, 1) Like "[A-Za-z]") Then
            IsLetter = False
            Exit Function
        End If
    Next i
    
End Function


' ============================================================================
' ALTERNATIVE: CREATE COMPACT PANEL
' ============================================================================

Sub CreateCompactToolkitPanel()
' Creates a smaller, more compact version of the toolkit panel
' Useful when screen space is limited

    Dim ws As Worksheet
    Dim btnFormat As Button, btnCalc As Button, btnChart As Button
    Dim frameShape As Shape
    Dim titleShape As Shape
    Dim panelLeft As Double, panelTop As Double
    Dim shapeNames() As String
    
    Set ws = ActiveSheet
    
    ' Delete existing panel
    On Error Resume Next
    ws.Shapes("TensileToolkitPanel").Delete
    On Error GoTo 0
    
    ' Position (compact size, row 8 to avoid specimen data)
    panelLeft = ws.Range("K8").Left
    panelTop = ws.Range("K8").Top
    
    ' Background frame (smaller)
    Set frameShape = ws.Shapes.AddShape(msoShapeRoundedRectangle, _
        panelLeft, panelTop, 160, 140)
    
    With frameShape
        .Name = "ToolkitFrame"
        .Fill.ForeColor.RGB = RGB(245, 245, 245)  ' Light grey
        .Line.ForeColor.RGB = RGB(0, 112, 192)
        .Line.Weight = 2
        .Shadow.Type = msoShadow21
    End With
    
    ' Title (smaller font)
    Set titleShape = ws.Shapes.AddTextbox(msoTextOrientationHorizontal, _
        panelLeft + 5, panelTop + 5, 150, 20)
    
    With titleShape
        .Name = "ToolkitTitle"
        .TextFrame2.TextRange.Text = "Tensile Toolkit"
        .TextFrame2.TextRange.Font.Size = 10
        .TextFrame2.TextRange.Font.Bold = True
        .TextFrame2.TextRange.Font.Fill.ForeColor.RGB = RGB(0, 70, 130)
        .TextFrame2.TextRange.ParagraphFormat.Alignment = msoAlignCenter
        .Fill.Visible = msoFalse
        .Line.Visible = msoFalse
    End With
    
    ' Compact buttons
    Set btnFormat = ws.Buttons.Add(panelLeft + 10, panelTop + 35, 140, 26)
    btnFormat.OnAction = "FormatTensileTable"
    btnFormat.Text = "1. Format"
    btnFormat.Name = "BtnFormat"
    
    Set btnCalc = ws.Buttons.Add(panelLeft + 10, panelTop + 68, 140, 26)
    btnCalc.OnAction = "CalculateStressStrain"
    btnCalc.Text = "2. Calculate"
    btnCalc.Name = "BtnCalculate"
    
    Set btnChart = ws.Buttons.Add(panelLeft + 10, panelTop + 101, 140, 26)
    btnChart.OnAction = "CreateStressStrainChart"
    btnChart.Text = "3. Chart"
    btnChart.Name = "BtnChart"
    
    ' Style buttons
    btnFormat.Font.Name = "Segoe UI"
    btnFormat.Font.Size = 9
    
    btnCalc.Font.Name = "Segoe UI"
    btnCalc.Font.Size = 9
    
    btnChart.Font.Name = "Segoe UI"
    btnChart.Font.Size = 9
    
    ' Group
    ReDim shapeNames(0 To 4)
    shapeNames(0) = "ToolkitFrame"
    shapeNames(1) = "ToolkitTitle"
    shapeNames(2) = btnFormat.Name
    shapeNames(3) = btnCalc.Name
    shapeNames(4) = btnChart.Name
    
    On Error Resume Next
    ws.Shapes.Range(shapeNames).Group.Name = "TensileToolkitPanel"
    On Error GoTo 0
    
    MsgBox "Compact toolkit panel created!", vbInformation
    
End Sub
