# Setting Up the AMA Google Form

**For Instructor Only**

Follow these steps to create the anonymous question form and connect it to your spreadsheet.

---

## Step 1: Create Google Form

1. Go to [Google Forms](https://docs.google.com/forms)
2. Click **"+ Blank"** to create new form
3. Title: **"AmaDema AI Training - AMA Questions"**
4. Description: **"Submit anonymous questions about the training programme"**

---

## Step 2: Add Question Field

1. Click **"+"** to add question
2. Question type: **"Paragraph"**
3. Question text: **"What's your question?"**
4. Click three dots → **"Description"**
5. Add: **"Ask anything about prompt engineering, frameworks, AI tools, or workshop content"**
6. Toggle **"Required"** ON

---

## Step 3: Configure Settings

1. Click **Settings** (gear icon)
2. **General tab:**
   - ☑️ **Collect email addresses:** OFF (anonymous!)
   - ☑️ **Limit to 1 response:** OFF (allow multiple questions)
   - ☑️ **Edit after submit:** OFF
   - ☑️ **See summary charts and text responses:** OFF (keeps responses private)

3. **Presentation tab:**
   - ☑️ **Show progress bar:** OFF
   - ☑️ **Shuffle question order:** OFF
   - **Confirmation message:** "Thank you! Your question has been submitted. Check the FAQ page in 2-3 days for the answer."

4. Click **"Save"**

---

## Step 4: Get Embed Code

1. Click **"Send"** (top right)
2. Click **"<>" (embed icon)**
3. Set width: **640**
4. Set height: **800**
5. Copy the iframe code

Example:
```html
<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSet-jLQ8uNmN6xom7ZLgLsjNrXdBaG6tKRTyQYy1fFBFfLZpg/viewform?embedded=true" width="640" height="880" frameborder="0" marginheight="0" marginwidth="0">Loading…</iframe>
```

---

## Step 5: Update Website

1. Open `docs/ama.md`
2. Find this line:
```html
<iframe src="https://docs.google.com/forms/d/e/YOUR_FORM_ID/viewform?embedded=true"
```
3. Replace with YOUR iframe code from Step 4
4. Save file

---

## Step 6: Set Up Response Collection

### Option A: Google Sheets (Recommended)

1. In your form, click **"Responses"** tab
2. Click **green Sheets icon** (Create Spreadsheet)
3. Choose **"Create a new spreadsheet"**
4. Name it: **"AmaDema AMA Responses 2026"**
5. Click **"Create"**

**Now you have:**
- Form at: `https://docs.google.com/forms/d/YOUR_FORM_ID`
- Responses at: `https://docs.google.com/spreadsheets/d/YOUR_SHEET_ID`

### Option B: Email Notifications

1. In form, click three dots → **"Get email notifications for new responses"**
2. You'll get email every time someone submits

---

## Step 7: Test It

1. Commit and push your changes:
```powershell
git add docs/ama.md
git commit -m "Add AMA form with Google Form integration"
git push origin main
```

2. Wait 2-3 minutes for deployment
3. Visit: `https://avgistavrou.github.io/Aitraining/ama/`
4. Submit test question
5. Check your Google Sheet - question should appear!

---

## Managing Responses

### View All Questions

Open your Google Sheet:
- Column A: Timestamp
- Column B: Question text

### Answer Questions

1. Review new questions in Sheet
2. Choose questions to answer publicly
3. Edit `docs/faq.md`
4. Add question + answer under appropriate section
5. Commit and push

### Mark Answered Questions

In your Sheet:
- Add Column C: "Status"
- Mark: "Answered", "Pending", "Not suitable"
- Add Column D: "Notes" for any comments

---

## Alternative: Use Formspree (No Google Account)

If you prefer not to use Google:

1. Go to [Formspree.io](https://formspree.io/)
2. Sign up (free for 50 submissions/month)
3. Create new form
4. Get form endpoint: `https://formspree.io/f/YOUR_ID`
5. Update `docs/ama.md` with HTML form:

```html
<form action="https://formspree.io/f/YOUR_ID" method="POST">
  <label for="question">What's your question?</label>
  <textarea id="question" name="question" rows="6" required></textarea>
  <button type="submit">Submit Question</button>
</form>
```

Responses will email directly to you.

---

## Privacy Reminders

✅ **Form is anonymous** - no email/name collected  
✅ **Only you see responses** - participants can't see each other's questions  
✅ **When answering on FAQ** - rephrase to maintain anonymity  
✅ **Google Sheet permissions** - Keep private (don't share link)

---

## Troubleshooting

**Form not showing on website?**
- Check iframe src matches your form URL
- Verify form is set to "Anyone with link can respond" (not restricted)

**Responses not appearing in Sheet?**
- Check Responses tab → ensure sheet is linked
- Submit test response to verify connection

**Form looks weird on mobile?**
- Google Forms are responsive by default
- Check width="100%" in iframe tag

---

**Done!** Your AMA system is ready for questions. Update FAQ regularly to keep participants engaged!
