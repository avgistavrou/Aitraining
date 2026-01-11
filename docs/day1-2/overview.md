# Day 1-2 Overview: Precision Engineering & Operational Safety

## Session Goals

Transform from **"casual chatters"** to **"AI Engineers"** who can systematically extract value from Large Language Models.

By the end of these sessions, you will:

- ✅ Master the **AUTOMAT Framework** for functional task execution
- ✅ Apply the **CO-STAR Framework** for context-rich communication
- ✅ Understand **hallucination mechanisms** and implement verification protocols
- ✅ Apply the **Red List** protocol for IP protection

---

## The Chef Analogy

Access to state-of-the-art Large Language Models like GPT-5 or Llama 3 is analogous to having a **Michelin-star sous-chef** in your laboratory kitchen.

### The Sous-Chef's Capabilities

This sous-chef possesses:

- **Encyclopaedic knowledge** of every ingredient (data)
- **Mastery** of every cooking technique (processing capability)
- **No agency**—they await your command

### The Problem with Vague Instructions

If a Head Chef (your Material Scientist) vaguely instructs the sous-chef to **"cook something tasty"** (a generic prompt):

**Result:** Competent but uninspired—a standard meal that anyone could replicate.

### The Power of Precise Instructions

To produce a dish of **molecular gastronomy that wins awards** (novel R&D insight), the Head Chef must provide a **precise, engineered recipe**:

- Specify temperatures
- Define reaction times
- Detail ingredient ratios with absolute clarity

---

## Prompt Engineering Defined

> **Prompt Engineering is the art of writing that recipe.**

It is the technical skill of constraining the model's vast potential into a **narrow, high-fidelity output** suitable for rigorous scientific enquiry.

**Without this training:** Your R&D team is effectively using a supercomputer to perform basic arithmetic.

**With this training:** You become architects of your own AI tools.

---

## Session Structure

### Part 1: Structured Prompt Engineering (45 minutes)

We will dismantle the conversational paradigm and introduce structured frameworks:

1. **AUTOMAT Framework** – For functional scientific tasks
2. **CO-STAR Framework** – For context-heavy communication
3. **Hands-on practice** – Applying frameworks to real materials science scenarios

### Part 2: Responsible AI & Risk Management (45 minutes)

Critical module on operational security:

1. **Understanding hallucinations** – Why models fabricate plausible but false information
2. **The Red List** – Data types that must never be uploaded
3. **Data sanitisation** – Methods to protect IP whilst using AI tools
4. **Verification protocols** – How to audit AI outputs

---

## Why This Matters for AmaDema

### Before Training

**Typical prompt:**
```
Summarise recent research on polymer synthesis
```

**Output:** Generic summary, no specific focus, unsuitable for R&D decisions

**Time to useful output:** 6-10 iterations (15-20 minutes)

---

### After Training

**Engineered prompt:**
```
Act as a Senior Polymer Chemist reviewing literature for IP assessment.

Audience: AmaDema IP Legal Team

Task: Extract synthesis parameters from the following papers: [list]

Output format: Markdown table with columns:
- Paper DOI
- Polymer type
- Precursor materials
- Temperature range (°C)
- Pressure (kPa)
- Yield (%)
- Novel aspects (for patentability assessment)

Constraints:
- Focus exclusively on non-oxide ceramic precursors
- Exclude any papers published before 2020
- Flag any mentions of electrospinning techniques
- Do not speculate on missing data—mark as "Not reported"

Tone: Technical, objective, suitable for legal review
```

**Output:** Structured, relevant, legally actionable

**Time to useful output:** 1-2 iterations (3-5 minutes)

---

## Key Learning Outcomes

### Technical Skills

- [x] **Persona definition** – "Act as a Senior Polymer Chemist"
- [x] **Audience specification** – "Audience is the IP Legal Team"
- [x] **Output formatting** – "Markdown table with columns..."
- [x] **Constraint engineering** – Whitelisting/blacklisting topics
- [x] **Tone calibration** – "Technical, objective, suitable for legal review"

### Risk Management Skills

- [x] **Hallucination detection** – Recognising plausible but fabricated data
- [x] **IP protection** – Applying Red List protocols
- [x] **Data sanitisation** – Removing sensitive parameters before processing
- [x] **Verification workflows** – Cross-checking outputs against primary sources

---

## Materials Science Applications

Throughout these sessions, you'll apply frameworks to real R&D tasks:

### Literature Synthesis
Extract structured data from polymer chemistry papers

### Protocol Formatting
Convert lab notes into standardised synthesis protocols

### Data Analysis Planning
Generate Python scripts for tensile testing analysis

### IP Assessment
Structure prior art searches for patent applications

---

## The Hallucination Problem

!!! danger "Critical Understanding"
    LLMs are **pattern-matching systems**, not knowledge databases.
    
    When asked: *"What is the tensile strength of Ti₆Al₄V at 400°C?"*
    
    The model doesn't "look up" this value—it **predicts plausible text** based on training patterns.
    
    **Result:** It might provide:
    - ✅ A correct value (if present in training data)
    - ⚠️ An interpolated estimate (from related materials)
    - ❌ **A confident-sounding but completely fabricated number**

**For scientific work:** This is unacceptable without verification.

**Our solution:** Learn to engineer prompts that minimise hallucination risk and implement verification protocols.

---

## Exercise Preview: The Hallucination Hunt

In Part 2, you'll participate in **The Hallucination Hunt**, where:

1. Teams receive an AI-generated chemical synthesis report
2. The report contains 5 deliberate, subtle errors
3. Your task: Identify them using verification strategies learned in training
4. **Prize:** The team that finds all errors fastest wins the "Critical Thinker" badge

**Errors might include:**
- Non-existent isotopes
- Fabricated citations
- Impossible reaction conditions
- Misattributed discoveries
- Statistical inconsistencies

---

## Session Pre-Work

Before Day 1, please:

1. ✅ Access the sandbox environment: `http://YOUR_LAPTOP_IP:3000`
2. ✅ Test with a simple prompt: "What are non-oxide ceramics?"
3. ✅ Bring examples of routine R&D tasks you'd like to automate
4. ✅ Review the [Context Matters](../fundamentals/context-matters.md) section

---

## Success Metrics

By the end of Day 1-2, you will demonstrate:

1. **Framework application** – Create prompts using AUTOMAT and CO-STAR
2. **IP protection** – Identify Red List violations in sample prompts
3. **Hallucination detection** – Successfully complete The Hallucination Hunt
4. **Iteration efficiency** – Reduce prompt refinement time by >50%

---

**Ready to begin?** Start with [The AUTOMAT Framework](automat-framework.md) →
