# Exercise 2: Batch Extract XRD Data

Time to practice batch processing! This exercise combines loops, sheet navigation, and data extraction.

## The Challenge

You have XRD analysis results spread across 3 sheets: `XRD_Sample1`, `XRD_Sample2`, `XRD_Sample3`.

Each sheet has a **Peak Intensity** value in cell **B5** (highlighted in yellow).

**Your task:** Extract all peak intensities and compile them into a summary table with an average.

!!! example "Exercise 2: Compile XRD Results"
    ### Requirements
    
    Create a macro called `CompileXRDResults` that:
    
    **1. Creates (or clears) a "XRD_Summary" sheet**
    
    **2. Adds headers:**
    
    - A1: "XRD Peak Intensity Summary" (bold, size 14, blue colour)
    - A3: "Sample" (bold, grey background)
    - B3: "Peak Intensity" (bold, grey background)
    
    **3. Extracts data from each XRD_Sample sheet:**
    
    - Row 4: Sample 1 data (from XRD_Sample1 sheet, cell B5)
    - Row 5: Sample 2 data (from XRD_Sample2 sheet, cell B5)
    - Row 6: Sample 3 data (from XRD_Sample3 sheet, cell B5)
    
    **4. Calculates average in row 8:**
    
    - A8: "Average" (bold)
    - B8: Formula averaging B4:B6
    
    **5. Formats the table:**
    
    - 2 decimal places for intensities (B4:B8)
    - Borders around table (A3:B8)
    - Auto-fit columns

## Step-by-Step Guide

### Step 1: Download the Practice File

1. Download [Tensile_Test_Sample.xlsx](Tensile_Test_Sample.xlsx)
2. Open it and verify you have sheets: `XRD_Sample1`, `XRD_Sample2`, `XRD_Sample3`
3. Each should have a yellow-highlighted cell B5 with a peak intensity value

### Step 2: Plan Your Approach

Before coding, think about the structure:

1. Need to **create or clear** a summary sheet
2. Need to **loop** through sample sheets (1 to 3)
3. Need to **read** from each sheet's B5 cell
4. Need to **write** to summary sheet rows 4, 5, 6
5. Need to **format** the results

### Step 3: Start Recording (Optional)

You can record parts of this macro to get started:

1. Manually create a new sheet called "XRD_Summary"
2. Add the headers
3. Format them
4. Stop recording

Then **edit** the code to add the loop and extraction logic!

### Step 4: Write the Macro

Use this starter code and fill in the TODOs:

```vba
Sub CompileXRDResults()
' Compiles XRD peak intensities from 3 sample sheets

    Dim i As Integer
    Dim sampleSheet As String
    Dim intensity As Double
    Dim summarySheet As Worksheet
    
    ' Create or get summary sheet
    On Error Resume Next
    Set summarySheet = Worksheets("XRD_Summary")
    If summarySheet Is Nothing Then
        Set summarySheet = Worksheets.Add
        summarySheet.Name = "XRD_Summary"
    Else
        summarySheet.Cells.Clear  ' Clear existing data
    End If
    On Error GoTo 0
    
    ' Add title (A1)
    With summarySheet.Range("A1")
        .Value = "XRD Peak Intensity Summary"
        .Font.Bold = True
        .Font.Size = 14
        .Font.Color = RGB(0, 112, 192)  ' Blue
    End With
    
    ' Add headers (A3:B3)
    summarySheet.Range("A3").Value = "Sample"
    summarySheet.Range("B3").Value = "Peak Intensity"
    ' TODO: Make headers bold with grey background
    
    ' Loop through 3 samples
    For i = 1 To 3
        sampleSheet = "XRD_Sample" & i
        
        ' Extract intensity from B5 of each sample sheet
        intensity = Worksheets(sampleSheet).Range("B5").Value
        
        ' Write to summary (row 4, 5, or 6)
        ' TODO: Write sample name to column A
        ' TODO: Write intensity value to column B
    Next i
    
    ' Calculate average (row 8)
    ' TODO: Add "Average" label in A8
    ' TODO: Add formula in B8 to average B4:B6
    
    ' Format table
    ' TODO: Format B4:B8 as numbers with 2 decimal places
    ' TODO: Add borders to A3:B8
    ' TODO: Auto-fit columns A and B
    
    MsgBox "XRD data compiled!", vbInformation
    summarySheet.Activate  ' Switch to summary sheet
    
End Sub
```

### Hints

??? tip "Hint 1: Creating/Getting a Sheet"
    ```vba
    On Error Resume Next  ' If sheet doesn't exist, don't crash
    Set summarySheet = Worksheets("XRD_Summary")
    If summarySheet Is Nothing Then  ' Sheet doesn't exist
        Set summarySheet = Worksheets.Add
        summarySheet.Name = "XRD_Summary"
    End If
    On Error GoTo 0  ' Turn error handling off
    ```

??? tip "Hint 2: Formatting Headers"
    ```vba
    With summarySheet.Range("A3:B3")
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200)  ' Grey
    End With
    ```

??? tip "Hint 3: Writing Data in Loop"
    ```vba
    ' Row number = 3 + i (so i=1 → row 4, i=2 → row 5, etc.)
    summarySheet.Cells(3 + i, 1).Value = "Sample " & i
    summarySheet.Cells(3 + i, 2).Value = intensity
    ```

??? tip "Hint 4: Adding Average Formula"
    ```vba
    summarySheet.Range("A8").Value = "Average"
    summarySheet.Range("A8").Font.Bold = True
    summarySheet.Range("B8").Formula = "=AVERAGE(B4:B6)"
    ```

??? tip "Hint 5: Formatting Numbers"
    ```vba
    summarySheet.Range("B4:B8").NumberFormat = "0.00"
    ```

??? tip "Hint 6: Adding Borders"
    ```vba
    summarySheet.Range("A3:B8").Borders.LineStyle = xlContinuous
    ```

### Step 5: Test Your Macro

1. Save your file as `.xlsm`
2. Run `CompileXRDResults`
3. Check that a "XRD_Summary" sheet was created with all data!

## Expected Result

Your summary sheet should look like this:

```
Row 1: XRD Peak Intensity Summary  (bold, size 14, blue)

Row 3: Sample          | Peak Intensity    (bold, grey background)
Row 4: Sample 1        | 2456.78
Row 5: Sample 2        | 2398.12
Row 6: Sample 3        | 2501.45

Row 8: Average         | 2452.12           (bold)
```

## Bonus Challenges

!!! example "Make It Better!"
    **Challenge 1: Error Handling**
    
    What if one of the sample sheets is missing? Add error handling:
    
    ```vba
    On Error Resume Next
    intensity = Worksheets(sampleSheet).Range("B5").Value
    If Err.Number <> 0 Then
        MsgBox "Warning: " & sampleSheet & " not found!", vbExclamation
        intensity = 0  ' Use 0 as default
        Err.Clear
    End If
    On Error GoTo 0
    ```
    
    **Challenge 2: Dynamic Sample Count**
    
    Instead of hard-coding 3 samples, make it work for any number:
    
    ```vba
    Dim sampleCount As Integer
    sampleCount = Application.InputBox("How many samples?", Type:=1)
    For i = 1 To sampleCount
        ...
    Next i
    ```
    
    **Challenge 3: Add Standard Deviation**
    
    In row 9, add a "Std Dev" calculation:
    
    ```vba
    summarySheet.Range("A9").Value = "Std Dev"
    summarySheet.Range("B9").Formula = "=STDEV.S(B4:B6)"
    ```

## Solution

!!! success "Need Help?"
    Full solution available in:
    
    - [Exercise_Solutions.md](Exercise_Solutions.md) - Detailed explanation
    - [Exercise_Solutions.bas](Exercise_Solutions.bas) - Working code file
    
    Try to complete it yourself first!

## What You've Learned

✓ How to loop through multiple sheets  
✓ How to create/check for existing sheets  
✓ How to read data from different sheets  
✓ How to compile data into a summary  
✓ How to add formulas (AVERAGE) programmatically  
✓ How to format summary tables

## Next: Best Practices

You've learned the fundamentals! Now let's cover essential tips, debugging techniques, and best practices.

[Continue to Tips & Best Practices →](09-tips-best-practices.md){ .md-button .md-button--primary }

---

[← Back to Real-World Examples](07-real-world-examples.md) | [Home](index.md)
