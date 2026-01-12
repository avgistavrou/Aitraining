# Introduction to Prompt Engineering

**Welcome to Day 1!**

Before we dive into frameworks, let's establish why you're here and what prompt engineering actually means for materials scientists.

---

## What is Prompt Engineering?

**Simple definition:** The practice of designing inputs (prompts) to get specific, high-quality outputs from AI models.

**For materials scientists:** The skill of transforming vague requests into precise instructions that yield scientifically rigorous results.

---

## The Problem We're Solving

### Scenario: Literature Review

**You need:** Synthesis parameters from 20 papers on PLA/graphene composites

**Approach 1: Casual AI Use**
```
User: "Summarise these papers on PLA"
AI: [Generic summary of topics, no specific data]
User: "I need synthesis parameters"
AI: [Mentions some parameters, inconsistent format]
User: "Can you put that in a table?"
AI: [Creates table, missing key columns]
User: "Add temperature and pressure columns"
AI: [Adds columns, but mixes units]
User: "Use consistent units"
... [5 more iterations]
```

**Time:** 20 minutes  
**Quality:** Mediocre  
**Reproducible:** No

---

**Approach 2: Prompt Engineering**
```
Act as Materials Science Data Analyst.

Task: Extract synthesis parameters from attached 20 papers on 
PLA/graphene nanocomposites.

Output: Markdown table with columns:

- Paper (Author Year)
- Synthesis Method
- Temperature (°C)
- Pressure (kPa)
- Graphene Loading (wt%)
- Yield (%)

Constraints:

- If parameter not reported, mark "NR"
- Only include electrospinning methods
- Convert all temperatures to Celsius

Tone: Technical, data-focused
```

**Time:** 3 minutes  
**Quality:** High-fidelity  
**Reproducible:** Yes (template for future use)

---

## Why This Matters for R&D

### Efficiency Gains

**Before prompt engineering:**

- Literature review: 8 hours → 2 hours (75% reduction)
- Protocol formatting: 30 min/protocol → 5 min (83% reduction)
- Experimental design brainstorming: 2 hours → 30 min (75% reduction)

**After prompt engineering:**

- Same quality or better
- Reproducible workflows
- Template libraries for recurring tasks

---

### Quality Improvements

**Structured prompts lead to:**

- ✅ Consistent output format
- ✅ Fewer hallucinations (explicit constraints)
- ✅ Verifiable results (cite sources, show calculations)
- ✅ Suitable for professional use

---

### IP Protection

**Prompt engineering includes security:**

- Know what data to never share (Red List)
- Sanitise sensitive information before processing
- Use local models for confidential work
- Verify all outputs before use

---

## The Learning Journey

### Week 1: Mechanical Application
You'll use frameworks by reference, checking the cheat sheet for each component.

**Normal:** Prompts feel structured but mechanical.

---

### Month 1: Natural Integration
Frameworks become intuitive. You'll think in terms of audience, constraints, and output format automatically.

**Achievement:** First-shot success rate >70%

---

### Month 3: Template Building
You'll have created 10-20 templates for your common tasks. New colleagues will ask for your prompts.

**Achievement:** Time savings 5-10 hours/week

---

### Month 6: Teaching Others
You'll identify new applications, teach frameworks to colleagues, and innovate processes.

**Achievement:** Team-wide efficiency gains

---

## Today's Focus: AUTOMAT Framework

The AUTOMAT framework gives you a **systematic method** for crafting scientific prompts.

**Seven components** that ensure complete specification:

1. Audience
2. User Persona
3. Task
4. Output
5. Method
6. Assumptions
7. Tone

**Think of it as:** The scientific method for AI prompting.

---

## What Makes a Good Prompt?

### Poor Prompt Characteristics

❌ Vague task: "Help me with this data"  
❌ No output specification: AI guesses format  
❌ Missing constraints: AI fills gaps with guesses  
❌ Generic context: AI provides generic answers  
❌ No verification guidance: Hallucinations go undetected

---

### Good Prompt Characteristics

✅ **Specific task:** "Extract tensile strength values from these 7 datasets"  
✅ **Defined output:** "Table with columns: Sample ID, Strength (MPa), Modulus (GPa)"  
✅ **Explicit constraints:** "If data missing, mark 'NR'—do not estimate"  
✅ **Relevant context:** "For QC documentation, ISO 527 standards"  
✅ **Verification built-in:** "Flag any values >2 SD from mean"

---

## Common Misconceptions

### Misconception 1: "AI is smart enough to figure it out"

**Reality:** AI is a pattern-matching prediction engine. Ambiguity leads to guessing, which leads to inconsistent or wrong outputs.

**Solution:** Be explicit. Over-specify rather than under-specify.

---

### Misconception 2: "Longer prompts are always better"

**Reality:** Relevant detail is valuable. Irrelevant context is noise.

**Solution:** Include task-relevant information only. Context should help, not distract.

---

### Misconception 3: "One framework for everything"

**Reality:** Different frameworks suit different tasks.

**Solution:** AUTOMAT for functional tasks, CO-STAR for strategic communication (you'll learn CO-STAR tomorrow).

---

### Misconception 4: "Prompt engineering replaces expertise"

**Reality:** Prompt engineering **amplifies** your expertise. You still need domain knowledge to:

- Identify what questions to ask
- Verify outputs for accuracy
- Spot hallucinations
- Apply results appropriately

**Solution:** Use AI to augment, not replace, your scientific judgment.

---

## The Materials Science Advantage

**You already think like a prompt engineer!**

**Scientific method:**

1. Define hypothesis (Task)
2. Design experiment (Method)
3. Specify measurements (Output)
4. Control variables (Constraints)
5. Document rigorously (Format)

**Prompt engineering:**

1. Define task
2. Specify method
3. Define output format
4. Set constraints
5. Structure precisely

**Parallel thinking →** Faster learning curve for scientists!

---

## Your Toolkit After Today

By end of Day 1, you'll have:

📘 **AUTOMAT Framework** - Systematic method for functional tasks  
🧠 **Conversational Learning** - Build expertise, don't just get answers  
🚫 **Red List Protocol** - Protect IP whilst using AI  
💻 **Sandbox Access** - Practice with sensitive data safely  
⚡ **Templates Started** - Foundation for your prompt library

---

## Let's Begin

**Now that you understand WHY prompt engineering matters and WHAT it can do for you...**

**Let's learn HOW to do it.**

---

**Next:** [The AUTOMAT Framework](automat-framework.md) – Your systematic method for scientific prompts →
