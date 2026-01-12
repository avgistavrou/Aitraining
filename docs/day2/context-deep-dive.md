# Context Deep Dive

Building on the fundamentals, let's explore how to construct precise, effective context for scientific AI applications.

---

## The Embedding Space Metaphor

Large Language Models navigate through **vast multidimensional embedding spaces**—representations of knowledge and concepts learned during training.

**Think of it as:**
- A massive library with billions of books
- No catalogue system
- You can only describe what you're looking for

**Vague description:** "Find me something about materials"  
→ Model wanders randomly through materials science section  
→ Returns whatever it encounters first

**Precise description:** "Find peer-reviewed synthesis protocols for PLA/graphene nanocomposites using electrospinning, published 2020-2024, focusing on in-situ reduction methods"  
→ Model navigates directly to relevant region  
→ Returns targeted, relevant information

---

## The Cost of Vague Context

### Example: The Polymer Summary

**Vague prompt:**
```
Summarise polymer nanocomposites research
```

**What the model "hears":**
- Which polymers? (Thousands exist)
- Which nanofillers? (Carbon, ceramic, metal?)
- What aspect? (Synthesis, properties, applications?)
- What timeframe? (Last year? Last decade?)
- What depth? (Tweet-length? Thesis-length?)

**Result:** Generic overview that could apply to any polymer, any nanofiller, any time period. Useless for your specific needs.

---

**Precise prompt:**
```
Summarise recent (2022-2024) peer-reviewed research on PLA/graphene 
nanocomposites synthesised via electrospinning, focusing on:
(1) graphene dispersion strategies
(2) mechanical property improvements vs. neat PLA
(3) commercialisation challenges

Target audience: R&D scientists familiar with polymer processing. 
Output: 3-paragraph technical summary with key quantitative findings 
and 10-15 citations.
```

**What the model "hears":**
- Specific material system (PLA + graphene)
- Method constraint (electrospinning only)
- Time constraint (last 3 years)
- Three focal points clearly defined
- Audience specified (affects terminology)
- Output format specified (structure, length, citation requirement)

**Result:** Targeted, actionable summary directly applicable to your research.

---

## Types of Context (Expanded)

### 1. Explicit Context (You Provide)

**Domain Context:**
- Your field (materials science, nanotechnology)
- Specific subdomain (polymer nanocomposites)
- Technical constraints (processing methods, material types)

**Task Context:**
- Purpose of this work (grant application, patent search, QC analysis)
- Intended use (internal review, publication, investor pitch)
- Success criteria (what would make this output useful?)

**Output Context:**
- Format (table, prose, code, bullet points)
- Length (word count, page limit)
- Structure (sections, headings)

**Audience Context:**
- Who will read this?
- Their background knowledge
- Their priorities/concerns
- Terminology level

---

### 2. Implicit Context (Model Assumes)

**Cultural Assumptions:**
- Western scientific norms
- Anglo-centric terminology
- Academic conventions

**Communication Norms:**
- Formal vs. casual register
- Direct vs. indirect communication
- Citation expectations

**Knowledge Baseline:**
- What's "common knowledge"
- What needs explanation
- Technical depth expectations

---

### 3. Making Implicit Context Explicit

#### Example: The Sustainability Report

**Implicit (Dangerous):**
```
Write about environmental impact of our materials
```

**Model assumes:**
- Western ESG framework
- Carbon-centric metrics
- Regulatory context (EU? US? China?)
- Audience sophistication
- Reporting standards

**Result:** May not match your actual needs or regulatory requirements.

---

**Explicit (Safe):**
```
Write environmental impact section for AmaDema's ISO 14040-compliant 
lifecycle assessment report, focusing on cradle-to-gate carbon 
footprint of our non-oxide ceramic nanofibers vs. benchmark PLA.

Audience: Technical reviewers familiar with LCA methodology but not 
materials science specialists.

Include:
- System boundaries clearly defined
- Functional unit (1 kg of nanofibers)
- Impact categories (GWP, primary energy, water consumption)
- Comparison to PLA baseline
- Uncertainty quantification

Output: 2-page technical section suitable for regulatory submission.

Follow ISO 14040:2006 and ISO 14044:2006 standards. Use ReCiPe 2016 
methodology for impact assessment.
```

**Result:** Precisely what you need, conforming to required standards.

---

## Context Building Strategies

### Strategy 1: The Five W's + H

**Who:** Who is this for? Who are you?  
**What:** What specific task needs doing?  
**When:** What timeframe/deadline/era?  
**Where:** What domain/location/context?  
**Why:** What's the purpose/goal?  
**How:** How should it be done (method, format)?

#### Applied to Materials Science Task

```
Who: I'm an R&D scientist writing for peer reviewers
What: Literature review on PLA/graphene dispersion methods
When: Recent work (last 5 years)
Where: Academic publishing context (Polymer journal)
Why: Establish research gap for our manuscript
How: Critical synthesis, not exhaustive listing; 30-40 citations
```

---

### Strategy 2: Progressive Refinement

Start broad, refine based on output quality.

#### Round 1: Basic Request

```
Summarise this synthesis paper
```

**Output:** Generic summary of paper structure  
**Problem:** Not focused on what matters to you

---

#### Round 2: Add Focal Point

```
Focus on the electrospinning parameters and their effect on fiber 
diameter. I'm optimising my own process.
```

**Output:** Parameter-focused summary  
**Problem:** Missing statistical significance, missing parameter interactions

---

#### Round 3: Specify Depth

```
For each parameter (voltage, distance, concentration, flow rate), 
provide:
- Tested range
- Effect on diameter (quantitative)
- Statistical significance (p-values if reported)
- Interactions with other parameters

Present as table for easy comparison to my conditions.
```

**Output:** Precise, actionable data extraction  
**Success:** Ready to apply to your work

---

### Strategy 3: Role + Task + Constraints

**Role:** Define the AI's expertise  
**Task:** Specify the action  
**Constraints:** Set boundaries and requirements

#### Example: Patent Prior Art Search

```
Role: Act as a patent analyst with expertise in polymer nanocomposites.

Task: Review these 15 papers and identify any that could challenge 
patentability of our in-situ graphene reduction method during 
electrospinning.

Constraints:
- Focus only on methods using reduction during fiber formation (not post-processing)
- Identify specific claims that overlap with ours
- Flag any papers from competitors (PolyMat GmbH, Nanotech Solutions)
- If uncertainty exists, err on side of caution (flag for legal review)
- Exclude review papers and patents (only primary research articles)

Output: Risk assessment table with columns:
- Paper DOI
- Key Method
- Overlap Risk (High/Medium/Low)
- Specific Concern
- Recommendation
```

---

## Context Limits and Workarounds

### Understanding Context Windows

| Model | Context Window | Equivalent |
|-------|---------------|------------|
| GPT-4 | ~32K tokens | ~60 pages |
| Claude 3 | ~200K tokens | ~500 pages |
| Llama 3.2 (3B) | ~128K tokens | ~300 pages |

**Rule of thumb:** 1 token ≈ 4 characters ≈ 0.75 words

---

### When You Hit the Limit

#### Strategy 1: Chunking

Break large documents into sections, process separately.

```
Process Section 1: Synthesis Methods
[...content...]

Process Section 2: Characterisation
[...content...]

Process Section 3: Results
[...content...]

Final: Synthesise findings from Sections 1-3
```

---

#### Strategy 2: Summarise-Then-Analyse

Generate summaries first, then work with summaries.

```
Step 1: Summarise each of these 20 papers (one paragraph each)
Step 2: [Using summaries] Identify common themes
Step 3: [Using themes] Create comparative analysis
```

---

#### Strategy 3: Targeted Extraction

Don't feed entire documents—extract only relevant sections.

```
From these 10 papers, extract ONLY:
- Synthesis parameters (temperature, pressure, duration)
- Graphene loading (wt%)
- Tensile strength results

Ignore introduction, discussion, supplementary info.
```

---

## Advanced Context Techniques

### Technique 1: Negative Context

**Specify what you DON'T want.**

```
Write synthesis protocol for graphene-reinforced PLA nanofibers.

DO NOT:
- Use toxic reducing agents (no hydrazine)
- Require exotic equipment (keep to standard electrospinning setup)
- Specify exact masses (use ratios—we scale from 10g to 500g batches)
- Include post-processing steps (focus on synthesis only)
```

---

### Technique 2: Comparison Context

**Provide examples of good vs. bad.**

```
I need a technical summary of this paper. 

Too brief (BAD): "The paper studies PLA composites."
Too generic (BAD): "The paper investigates mechanical properties."
Just right (GOOD): "The paper reports 35% tensile strength increase 
for PLA/5%graphene vs. neat PLA, attributed to improved interfacial 
adhesion via GO hydroxyl groups."

Write a "just right" summary for each key finding.
```

---

### Technique 3: Assumption Surfacing

**Ask the model to state its assumptions.**

```
Recommend optimal electrospinning parameters for PLA/graphene.

Before providing recommendations, explicitly state:
1. What you're assuming about the PLA (Mw, grade)
2. What you're assuming about graphene type (GO vs. rGO)
3. What "optimal" means (diameter? uniformity? production rate?)
4. What equipment constraints you're assuming

Then provide recommendations with those assumptions clearly noted.
```

---

## Context Anti-Patterns (Don't Do This)

### ❌ Anti-Pattern 1: The Biography

**Bad:**
```
I'm a senior scientist at AmaDema, which was founded in 2022 by 
Dr. Smith and Dr. Jones, focusing on sustainable materials. We're 
located in Bristol, UK, and have 25 employees. Our mission is to 
revolutionise materials science through...

[500 words later]

...so can you summarise this paper?
```

**Problem:** 95% irrelevant to the task

**Good:**
```
I'm a materials scientist at a nanotechnology company. Summarise 
this paper focusing on synthesis scalability (I'm evaluating 
commercial viability).
```

---

### ❌ Anti-Pattern 2: The Jargon Bomb

**Bad:**
```
Leverage synergistic methodologies to optimise the operational 
parameters of the electrospinning modality vis-à-vis the target 
morphological specifications...
```

**Problem:** Unclear what you actually want

**Good:**
```
Optimise electrospinning parameters (voltage, distance, flow rate) 
to achieve target fiber diameter of 200-300 nm.
```

---

### ❌ Anti-Pattern 3: The Assumption

**Bad:**
```
Analyse this data
[Attaches stress-strain curves with no context]
```

**Problem:** Model has no idea what analysis you want

**Good:**
```
Calculate tensile strength and Young's modulus from these 
stress-strain curves. Use linear region (strain 0.05-0.25%) for 
modulus. Report average ± standard deviation. Flag any curves with 
irregular features (noise, premature failure).
```

---

## Exercise: Context Transformation

### Challenge 1: The Vague Literature Request

**Transform this:**
```
Find papers on nanofibers
```

**Into this (example):**
```
Find peer-reviewed papers (2020-present) on [specific polymer] 
nanofibers produced via electrospinning, focusing on [application]. 
Prioritise papers reporting quantitative mechanical data and 
synthesis protocols. Exclude review articles.
```

**Your version:** _____________

---

### Challenge 2: The Ambiguous Data Task

**Transform this:**
```
Analyse this image
```

**Into this (example):**
```
Analyse this SEM image of electrospun fibers. Measure diameter 
distribution (20 random fibers), calculate average ± SD, assess 
uniformity (coefficient of variation), identify any defects (beads, 
breaks). Use scale bar for calibration. Present results as: 
(1) statistical summary, (2) histogram, (3) brief interpretation.
```

**Your version:** _____________

---

## Practice in Sandbox

**Try this workflow:**

1. **Start vague:** "Summarise polymer synthesis methods"
2. **Test:** See what you get (likely generic)
3. **Add context:** Specify polymer, timeframe, focus
4. **Test:** Improvement?
5. **Refine:** Add output format, constraints
6. **Test:** Now compare quality

**Document:** How much did precision improve relevance?

---

**Next:** [CO-STAR Framework](costar-framework.md) – Strategic communication structure →
