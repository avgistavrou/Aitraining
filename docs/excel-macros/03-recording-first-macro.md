# Recording Your First Macro

## The Scenario

Your UTM (Universal Testing Machine) exports test results as `.txt` files that look like this:

```
[Head]
Converter = SampleTxtConverter
Version = 1
[Item]
SampleID = Experiment1
TestDate = 2025-06-03
Width = 20
Thickness = 0.117
...
[Curve]
[Specimen0]
Time	Load	Extension	Displacement
0.000	0.00	0.0000	0.0000
0.500	0.01	-0.0110	-0.0100
...
```

**The Challenge:**

- 20+ lines of metadata at the top
- Tab-delimited data (not formatted)
- No units in headers
- Generic number formatting

You need to clean and format this data **for every experiment**.

## The Workflow

We'll break this into two parts:

1. **Import** (manual, done once) - Get data from .txt into Excel
2. **Format** (macro, reusable) - Apply professional formatting

This is realistic: complex imports are hard to automate, but formatting is perfect for macros!

## Step 1: Import the Data

!!! note "Try It Yourself"
    Download [Experiment1.txt](Experiment1.txt) and follow along!

### Option A: Simple Import (Recommended)

This gets data into Excel quickly, then we'll clean it up:

1. **Data** → **Get Data** → **From File** → **From Text/CSV**
2. Select `Experiment1.txt`
3. Excel shows preview → Click **Load**
4. New sheet created with all data (metadata + data table)

**Result:** Raw data imported, but needs cleaning (we'll record a macro for this!)

### Option B: Clean Import with Power Query

If you want to remove metadata during import:

1. **Data** → **Get Data** → **From File** → **From Text/CSV**
2. Click **Transform Data** (opens Power Query Editor)
3. Find row 24: `Time	Load	Extension	Displacement`
4. Right-click row number 24 → **Remove Top Rows** → Enter "23"
5. **Home** → **Use First Row as Headers**
6. **Close & Load**

**Result:** Clean table with just data, no metadata

!!! tip "Which Method?"
    - **Option A** if you're new - simpler, we'll clean with macros
    - **Option B** if you want cleaner import - but harder to automate later

## Step 2: Understanding the Data

After import, you should have:

| Time | Load | Extension | Displacement |
|------|------|-----------|--------------|
| 0.000 | 0.00 | 0.0000 | 0.0000 |
| 0.500 | 0.01 | -0.0110 | -0.0100 |
| 1.000 | 0.10 | -0.0430 | -0.0400 |
| ... | ... | ... | ... |

**Problems:**

- ❌ No units in headers
- ❌ Generic formatting (1-4 decimal places inconsistent)
- ❌ No borders or styling
- ❌ Column widths don't fit content nicely

Let's fix this with a macro!

## Step 3: Record the Formatting Macro

Now comes the magic - we'll record all formatting steps so Excel can repeat them automatically.

### Start Recording

1. **Developer** tab → **Record Macro**

2. Fill in the dialog:
   - **Macro name:** `FormatTensileTable`
   - **Shortcut key:** `Ctrl+Shift+F` (hold Shift, type F)
   - **Store macro in:** This Workbook
   - **Description:** "Formats imported UTM data table with units and borders"

3. Click **OK**

!!! warning "Recording Now!"
    Excel is now recording **every action** you take. The recorder doesn't know what's important, so be deliberate and avoid mistakes!

### Perform the Actions

Now do these steps carefully (Excel is watching!):

**Add Units to Headers:**

1. Click cell **B1** (Load header)
2. Type: `Load (N)` and press Enter
3. Click cell **C1** (Extension header)
4. Type: `Extension (mm)` and press Enter
5. Click cell **D1** (Displacement header)
6. Type: `Displacement (mm)` and press Enter

**Format Header Row:**

7. Select range **A1:D1** (click A1, drag to D1)
8. On **Home** tab:
   - Click **Bold** (B button)
   - Click **Center Align**
   - Click **Fill Color** → Choose light blue

**Format Data:**

9. Select **A2:D20** (or to your last row - e.g., if 100 rows, select A2:D100)
10. Right-click → **Format Cells** → **Number** tab
11. Select **Number**, set **Decimal places: 3**
12. Click **OK**

**Add Borders:**

13. With data still selected (A1:D20 or similar)
14. Click **Home** → **Borders** → **All Borders**

**Auto-fit Columns:**

15. Select columns A:D (click column A header, drag to D)
16. Double-click any column divider between letters (auto-fits all)

### Stop Recording

17. **Developer** → **Stop Recording**

!!! success "Congratulations!"
    You've just created your first macro! It's now saved in your workbook.

## Step 4: Test Your Macro

Let's see if it works!

### Prepare Test Environment

!!! danger "Critical Safety Warning"
    **Macros clear Excel's undo history!** After running a macro, `Ctrl+Z` **will NOT work** reliably.
    
    **Always test on dummy data first!** Save your file before testing.

1. **File** → **Save As** → Choose **Excel Macro-Enabled Workbook (.xlsm)**
2. Save it with a test name like `Test_Macros.xlsm`
3. Press `Ctrl+Z` repeatedly to undo your formatting (back to raw data)

### Run the Macro

**Method 1: Keyboard Shortcut**

- Press `Ctrl+Shift+F` (the shortcut you assigned)
- Watch Excel format the table automatically!

**Method 2: Macro Menu**

- **Developer** → **Macros** (or press `Alt+F8`)
- Select `FormatTensileTable`
- Click **Run**

**Method 3: Quick Access Toolbar**

- Click the small dropdown in top-left corner
- Select **More Commands**
- Choose **Macros** from left list
- Add `FormatTensileTable` to toolbar
- Click the icon to run

!!! success "It Works!"
    Your table should now be professionally formatted - exactly as you did manually, but in 1 second instead of 2 minutes!

## Understanding What Happened

When you recorded the macro, Excel:

1. **Captured every action** - mouse clicks, typing, formatting
2. **Converted to VBA code** - a programming language
3. **Stored in your workbook** - ready to replay anytime

Want to see the code? Press **Alt+F11** (opens VBA Editor). You'll see something like:

```vba
Sub FormatTensileTable()
    Range("B1").Select
    ActiveCell.FormulaR1C1 = "Load (N)"
    Range("C1").Select
    ActiveCell.FormulaR1C1 = "Extension (mm)"
    ...
End Sub
```

Don't worry if it looks confusing - we'll decode this in the next section!

## Common Recording Mistakes

Here's what can go wrong and how to avoid it:

### Mistake 1: Recording Unwanted Actions

**Problem:** You accidentally click the wrong cell, then correct yourself. The macro records BOTH actions!

**Solution:** Stop recording, delete the macro, start fresh. Better to re-record than to have buggy code.

### Mistake 2: Hard-Coded Range

**Problem:** You select `A2:D20`, so the macro always formats exactly 20 rows - even if you have 100 rows of data!

**Solution:** We'll fix this when editing the code (next section). For now, select a large-enough range.

### Mistake 3: Wrong Storage Location

**Problem:** You stored in "Personal Macro Workbook" by mistake.

**Solution:** Record again and choose "This Workbook" explicitly.

## VBA vs Office Scripts

You might see another option in Excel: **Automate → Record Actions**. What's the difference?

| Feature | Developer → Record Macro | Automate → Record Actions |
|---------|--------------------------|---------------------------|
| **Technology** | VBA (Visual Basic) | Office Scripts (TypeScript) |
| **Storage** | In workbook (.xlsm file) | Cloud (OneDrive) |
| **Works on** | Desktop Excel | Web + Desktop + Mobile |
| **Power** | Very powerful, full access | Limited, cloud-safe |
| **This Tutorial** | ✅ **We use this** | ❌ Not covered |

**Why VBA (Developer tab)?**

- Works offline (no internet needed)
- More powerful (can control Word, PowerPoint, file system)
- Industry standard for 25+ years
- Better for complex scientific workflows

**Why NOT Office Scripts?**

- Requires Office 365 subscription
- Needs OneDrive/cloud storage
- Limited capabilities
- Newer, less established

!!! note "Stick to Developer Tab"
    Throughout this tutorial, always use **Developer → Record Macro**, not **Automate → Record Actions**. They create different code that isn't compatible!

## Practice Files

!!! info "No .txt File?"
    If you don't have `Experiment1.txt` or import failed, use the practice file:
    
    1. Download [Macro_Examples_Structure_Fixed.xlsx](Macro_Examples_Structure_Fixed.xlsx)
    2. Open the `Demo_Tensile_Data` sheet
    3. The data is already imported - practice formatting it!

## What You've Learned

✓ How to start the macro recorder  
✓ How to record actions deliberately  
✓ How to stop recording and save the macro  
✓ How to run a macro (keyboard shortcut, menu, toolbar)  
✓ The difference between VBA macros and Office Scripts  
✓ Why `Ctrl+Z` doesn't work after macros (critical safety!)

## Try It Yourself Challenge

!!! example "Quick Practice"
    Record a second macro called `HighlightMaxValue` that:
    
    1. Finds the maximum value in column B (Load)
    2. Highlights that cell in yellow
    3. Makes the text bold
    
    **Steps:**
    
    - Start recording
    - Click cell B2
    - Press `Ctrl+Shift+Down` (selects to last row)
    - Press `Ctrl+F` → Find → Options → Format → choose Yellow fill
    - Press Find Next
    - Make it bold
    - Stop recording
    
    **Hint:** This is tricky! It's easier to write VBA directly (you'll learn how in the next section).

## Next: Understanding the Code

Now that you can record macros, let's open the hood and see what Excel created. You'll learn to read, understand, and improve the VBA code!

[Continue to Understanding VBA Code →](04-understanding-vba.md){ .md-button .md-button--primary }

---

[← Back to Why Macros?](02-why-macros.md) | [Home](index.md)
