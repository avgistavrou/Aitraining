# Introduction & Setup

## What Are Macros?

Macros are **recorded sequences of actions** in Excel that can be replayed automatically. Think of them as "automation recipes" for repetitive tasks.

Instead of manually performing the same 20 clicks every time you process a data file, you can:

1. Record those 20 clicks once
2. Save them as a macro
3. Run that macro with a single button click or keyboard shortcut

**Result:** What took 5 minutes now takes 5 seconds.

## Real Examples from Material Science

Here's what macros can automate for you:

### Tensile Testing
- Import `.txt` files from UTM machines
- Format data tables (headers, borders, decimals)
- Calculate stress and strain from load/extension
- Generate standardised stress-strain curves
- **Time saved:** 10 minutes → 10 seconds per specimen

### XRD Analysis
- Extract peak intensities from multiple sample sheets
- Compile results into summary tables
- Calculate averages and statistics
- **Time saved:** 15 minutes → 30 seconds per batch

### Data Cleaning
- Remove metadata headers from machine exports
- Standardise column names
- Apply consistent number formatting
- **Time saved:** 5 minutes → 5 seconds per file

### Report Generation
- Export charts to PowerPoint
- Generate PDF reports with standardised naming
- Update master spreadsheets automatically
- **Time saved:** 30 minutes → 2 minutes per week

!!! success "Real Impact"
    Over 50 experiments per year, automating just **10 minutes of work per experiment** saves you **8+ hours annually**. That's a full working day you get back!

## Enable the Developer Tab

Before we can record macros, you need to enable Excel's **Developer tab**. This gives you access to all macro features.

### Windows Excel

1. Click **File** → **Options**
2. Select **Customise Ribbon** from the left sidebar
3. In the right panel, tick the checkbox next to **Developer**
4. Click **OK**

![Developer Tab Location](https://docs.microsoft.com/en-us/office/vba/excel/concepts/events-worksheetfunctions-shapes/images/developer-tab.png)

### Mac Excel

1. Click **Excel** menu → **Preferences**
2. Select **Ribbon & Toolbar**
3. In the "Customise the Ribbon" section, tick **Developer**
4. Click **Save**

!!! check "Verify Setup"
    You should now see a new **Developer** tab in your Excel ribbon, between "View" and "Help".

## What's in the Developer Tab?

Let's quickly tour the key features you'll use:

| Button | What It Does | When You'll Use It |
|--------|--------------|-------------------|
| **Record Macro** | Starts recording your actions | Every time you want to create a new macro |
| **Stop Recording** | Stops the recorder | After you've performed all actions |
| **Macros** | Shows list of all macros | To run, edit, or delete macros |
| **Visual Basic** | Opens the VBA editor | To view and edit macro code |
| **Insert** (Button) | Adds a clickable button | To create one-click macro launchers |

## Understanding Macro Storage

When you record a macro, where does it live? You have three options:

### 1. This Workbook (Recommended)
- Macro saved inside **your current Excel file**
- **Pros:** Always travels with your file, easy to share
- **Cons:** File must be saved as `.xlsm` (macro-enabled) instead of `.xlsx`
- **Use for:** Macros specific to one experiment or project

### 2. New Workbook
- Macro saved in a **new blank workbook**
- **Pros:** Can be developed and tested separately
- **Cons:** Need to manually copy to production files
- **Use for:** Testing and development

### 3. Personal Macro Workbook
- Macro saved in **hidden Excel file** that loads automatically
- **Pros:** Available in every Excel file you open
- **Cons:** Harder to share with colleagues
- **Use for:** Macros you use constantly across all files

!!! tip "Best Practice"
    For this tutorial, always choose **"This Workbook"** when recording macros. This keeps everything together and makes sharing easier.

## Macro Security

Excel has macro security settings to protect you from malicious code. Here's what you need to know:

### Recommended Settings

1. Go to **Developer** → **Macro Security**
2. Select **"Disable all macros with notification"** (default)
3. This allows you to enable macros when you trust the file

### When Opening Macro Files

You'll see a yellow security warning bar:

```
SECURITY WARNING: Macros have been disabled. [Enable Content]
```

- Click **Enable Content** if you created the file or trust the source
- **Never enable** macros in random files from the internet

!!! warning "Safety First"
    Only enable macros in files you created yourself or received from trusted colleagues. Macros are powerful and can potentially harm your computer if malicious.

## File Formats: .xlsx vs .xlsm

**Key difference:**

- **`.xlsx`** = Standard Excel file, **cannot** contain macros
- **`.xlsm`** = Macro-enabled Excel file, **can** contain macros

When you save a workbook with macros:

1. Use **File** → **Save As**
2. Choose **"Excel Macro-Enabled Workbook (*.xlsm)"**
3. Otherwise your macros will be deleted!

!!! note "Remember"
    If you try to save macros in a `.xlsx` file, Excel will warn you and offer to remove the macros or change the format. Always choose `.xlsm` to keep your macros.

## What You Can't Do with Macros

It's important to understand macro limitations:

**❌ Cannot:**

- Read your mind (you must record explicit actions)
- Work across different computers without the file
- Run automatically when you open Excel (requires manual enable)
- Access the internet or external databases (without advanced VBA)

**✅ Can:**

- Automate any manual Excel task
- Work with other Office apps (Word, PowerPoint)
- Perform complex calculations and data processing
- Create custom interfaces with buttons and forms

## Quick Check

!!! question "Test Your Understanding"
    Before moving on, make sure you can answer:
    
    1. ✓ Can you see the **Developer** tab in your Excel ribbon?
    2. ✓ Do you know the difference between `.xlsx` and `.xlsm` files?
    3. ✓ Do you understand what "Enable Content" means?
    
    If yes to all three, you're ready to record your first macro!

## Next Steps

Now that your Excel is set up and you understand the basics, let's see **why macros are so powerful** for material scientists with some real-world examples.

[Continue to Why Macros? →](02-why-macros.md){ .md-button .md-button--primary }

---

!!! tip "Pro Tip"
    Bookmark this page! You might want to reference the Developer tab features as you learn.
