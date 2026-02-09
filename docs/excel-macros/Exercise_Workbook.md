# Excel Macros Workshop - Exercise Workbook
**Material Science Automation Training**

---

## Exercise 1: Format Specimen Data (10 minutes)

### Your Task
Create a macro that formats raw specimen data professionally.

**Target Sheet:** `Exercise1_Raw` in `Tensile_Test_Sample.xlsx`

**Requirements:**
1. Add headers:
   - A1: "Specimen No"
   - B1: "Width (mm)"
   - C1: "Thickness (mm)"
   - D1: "CSA (mm²)"
   - E1: "Young's Modulus (GPa)"

2. Format header row:
   - Bold text
   - Centre alignment
   - Light blue background (RGB: 173, 216, 230)

3. Format data:
   - 3 decimal places for columns B:E
   - Borders around entire table
   - Auto-fit columns

### Steps
1. Open `Tensile_Test_Sample.xlsx`
2. Go to `Exercise1_Raw` sheet
3. Developer → Record Macro
   - Name: `FormatSpecimenData`
   - Shortcut: `Ctrl+Shift+F`
4. Perform the formatting actions
5. Stop recording
6. Test your macro: Undo everything (Ctrl+Z repeatedly), then press Ctrl+Shift+F

### Bonus Challenge
Edit the macro code to:
- Remove unnecessary `.Select` statements
- Add a comment explaining each section
- Make the borders dynamic (work for any number of rows)

**Hint for dynamic range:**
```vba
Dim lastRow As Long
lastRow = Cells(Rows.Count, "A").End(xlUp).Row
Range("A1:E" & lastRow).Borders.LineStyle = xlContinuous
```

### Your Notes:
```
What I learned:




Challenges faced:




```

---

## Exercise 2: Batch Extract XRD Data (10 minutes)

### Your Task
Extract XRD peak intensities from 3 sample sheets and compile into summary.

**Target Sheets:** `XRD_Sample1`, `XRD_Sample2`, `XRD_Sample3`  
**Target Cell:** `B5` in each sheet (highlighted in yellow)

**Requirements:**
Create a macro called `CompileXRDResults` that:

1. Creates (or clears) a sheet called "XRD_Summary"

2. Adds headers:
   - A1: "XRD Peak Intensity Summary" (bold, size 14, blue)
   - A3: "Sample" (bold, grey background)
   - B3: "Peak Intensity" (bold, grey background)

3. Extracts peak intensity from each XRD_Sample sheet:
   - Row 4: Sample 1 data
   - Row 5: Sample 2 data
   - Row 6: Sample 3 data

4. Calculates average in row 8

5. Formats:
   - 2 decimal places for intensities
   - Borders around table
   - Auto-fit columns

### Starter Code Structure
```vba
Sub CompileXRDResults()
    Dim i As Integer
    Dim sampleSheet As String
    Dim intensity As Double
    Dim summarySheet As Worksheet
    
    ' Create or get summary sheet
    ' TODO: Your code here
    
    ' Add headers
    ' TODO: Your code here
    
    ' Loop through 3 samples
    For i = 1 To 3
        sampleSheet = "XRD_Sample" & i
        
        ' Extract intensity from B5
        intensity = Worksheets(sampleSheet).Range("B5").Value
        
        ' Write to summary
        ' TODO: Your code here
    Next i
    
    ' Calculate average
    ' TODO: Your code here
    
    ' Format table
    ' TODO: Your code here
    
    MsgBox "XRD data compiled!", vbInformation
End Sub
```

### Your Notes:
```
Key VBA concepts used:




What worked well:




What I'd do differently:




```

---

## Take-Home Challenge 1: DSC Data Processor

### Scenario
Your Differential Scanning Calorimetry (DSC) machine exports data with:
- 20 header rows (machine info, calibration data)
- Column 1: Temperature (°C)
- Column 2: Heat Flow (W/g)
- No formatting

### Your Task
Create a macro that:
1. Deletes first 20 rows
2. Renames remaining columns with proper headers
3. Formats numbers to 2 decimal places
4. Creates a line chart (Temperature vs Heat Flow)
5. Adds chart title: "DSC Analysis - [Sample Name]"

### Planning Space
```
Steps needed:
1. 
2. 
3. 
4. 
5. 

VBA functions I'll need:
- 
- 
- 

Potential challenges:
- 
- 
```

---

## Take-Home Challenge 2: Multi-Experiment Updater

### Scenario
You have a master spreadsheet `Master_Results.xlsx` with columns:
- A: Experiment Code (e.g., Exp343.2)
- B: Young's Modulus (GPa)
- C: Max Stress (MPa)
- D: Last Updated (date)

### Your Task
Create a macro that:
1. Prompts user for experiment code (InputBox)
2. Finds that experiment's row in master sheet
3. Updates Young's Modulus and Max Stress with values from current workbook
4. Adds today's date in "Last Updated" column
5. Shows confirmation message

### Starter Template
```vba
Sub UpdateMasterResults()
    Dim expCode As String
    Dim masterWB As Workbook
    Dim masterWS As Worksheet
    Dim foundRow As Long
    Dim i As Long
    
    ' Get experiment code from user
    expCode = InputBox("Enter experiment code (e.g., Exp343.2):", "Experiment Code")
    If expCode = "" Then Exit Sub
    
    ' Open master workbook
    Set masterWB = Workbooks.Open("C:\Path\To\Master_Results.xlsx")
    Set masterWS = masterWB.Worksheets("Results")
    
    ' Find the experiment row
    ' TODO: Loop through column A to find expCode
    
    ' Update values
    ' TODO: Write Young's Modulus to column B
    ' TODO: Write Max Stress to column C
    ' TODO: Write today's date to column D
    
    ' Save and close
    masterWB.Save
    masterWB.Close
    
    MsgBox "Master results updated for " & expCode, vbInformation
End Sub
```

### Hints
- Use `Date` function to get today's date
- Use `InStr()` to find text in a cell
- Always close workbooks after editing: `wb.Close SaveChanges:=True`

---

## Take-Home Challenge 3: Automated Report Generator

### Scenario
Weekly report generation takes 30 minutes:
1. Copy stress-strain chart to PowerPoint slide
2. Paste summary statistics table
3. Add specimen photos from folder
4. Save as PDF with standardised naming

### Your Task (Advanced)
Create a macro that automates this workflow using:
- Excel VBA for data
- PowerPoint automation (`CreateObject("PowerPoint.Application")`)
- File system object for photos
- PDF export

### Research Topics
```
VBA topics to learn:
- [ ] Working with PowerPoint from Excel
- [ ] Copying charts to other applications
- [ ] File system operations (Dir, FileSystemObject)
- [ ] PDF export (ExportAsFixedFormat)

Estimated time to implement: _____ hours
```

---

## Reflection & Planning

### What I Learned Today
```
1. 

2. 

3. 
```

### Immediate Applications (This Week)
```
Task 1: ____________________
Estimated time saving: _____ min/day

Task 2: ____________________
Estimated time saving: _____ min/day

Task 3: ____________________
Estimated time saving: _____ min/day

Total time saved per week: _____ hours
```

### Questions for Follow-Up
```
1. 

2. 

3. 
```

### Automation Roadmap (Next 3 Months)

**Month 1: Foundation**
- [ ] Record macros for 3 most repetitive tasks
- [ ] Assign keyboard shortcuts
- [ ] Test thoroughly on dummy data

**Month 2: Refinement**
- [ ] Edit macros to remove `.Select`
- [ ] Add error handling
- [ ] Create button interface for non-programmers

**Month 3: Advanced**
- [ ] Build batch processing for typical experiment workflow
- [ ] Integrate with Python for heavy computation
- [ ] Share macros with team

---

## Additional Resources

### Quick VBA Reference
```vba
' Common operations
Range("A1").Value = 100
Cells(row, col).Value = data
lastRow = Cells(Rows.Count, "A").End(xlUp).Row

' Loops
For i = 1 To 10
    ' code
Next i

' Conditionals
If condition Then
    ' code
End If

' Error handling
On Error Resume Next
On Error GoTo ErrorHandler
```

### Keyboard Shortcuts
- **Alt+F11** - Open VBA Editor
- **Alt+F8** - Macros dialogue
- **F5** (in VBE) - Run macro
- **F8** (in VBE) - Step through code
- **Ctrl+G** (in VBE) - Immediate Window

### Online Help
- Microsoft VBA Docs: https://learn.microsoft.com/en-us/office/vba/api/overview/excel
- Stack Overflow: Tag `[excel-vba]`
- Workshop cheat sheet: `VBA_CheatSheet.md`

---

**Workshop Completion Checklist:**
- [ ] Completed Exercise 1
- [ ] Completed Exercise 2
- [ ] Tested all 6 demo macros
- [ ] Created at least one button
- [ ] Assigned keyboard shortcut to a macro
- [ ] Edited recorded macro to improve it
- [ ] Identified 3 tasks to automate this week

---

*Keep this workbook for reference. Happy automating!*
