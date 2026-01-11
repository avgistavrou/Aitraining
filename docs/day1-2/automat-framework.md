# The AUTOMAT Framework

The **AUTOMAT Framework** is a robust methodology for functional task execution with AI. It provides a structured approach to crafting high-fidelity scientific prompts.

---

## Framework Components

**AUTOMAT** is an acronym for:

| Component | What It Means | Why It Matters |
|-----------|---------------|----------------|
| **A** | **Audience** | Who will read/use this output? |
| **U** | **User Persona** | Who is the AI acting as? |
| **T** | **Task** | What specific action is required? |
| **O** | **Output** | What format/structure for results? |
| **M** | **Method** | How should the task be approached? |
| **A** | **Assumptions** | What constraints or boundaries apply? |
| **T** | **Tone** | What voice/style is appropriate? |

---

## Component Breakdown

### A – Audience

**Define who will consume this output.**

This shapes:
- Technical depth
- Terminology level
- Required disclaimers
- Level of detail

**Examples:**

| Audience | Implication |
|----------|-------------|
| IP Legal Team | Formal, cite sources, flag novelty |
| R&D Colleagues | Technical depth, assume domain knowledge |
| Management | High-level, business impact focus |
| External Partners | Balanced detail, avoid proprietary info |

---

### U – User Persona

**Define the AI's role/expertise.**

This influences:
- Knowledge domain
- Perspective
- Depth of analysis

**Examples:**

```
Act as a Senior Polymer Chemist with expertise in electrospinning
Act as a Materials Science Patent Analyst
Act as a Laboratory Safety Officer reviewing protocols
Act as a Data Scientist specialising in mechanical testing analysis
```

**Why it matters:** Without a persona, the AI defaults to "helpful generalist"—too broad for scientific work.

---

### T – Task

**Specify the precise action required.**

**Be explicit:**

❌ "Summarise this paper"  
✅ "Extract synthesis parameters from Section 3.2 of this paper"

❌ "Analyse this data"  
✅ "Calculate tensile strength and Young's modulus from these 7 stress-strain curves, excluding outliers >2 standard deviations"

---

### O – Output

**Define the exact format and structure.**

**Common scientific formats:**

- Markdown table
- CSV data
- JSON structure
- Bullet points with citations
- Structured report (sections defined)
- Python code (commented)

**Example specification:**

```
Output format: Markdown table with columns:
- Polymer Type
- Synthesis Temperature (°C)
- Precursor Materials
- Yield (%)
- Source (DOI)

Include 10-15 entries, sorted by yield (descending).
```

---

### M – Method

**Specify the approach or methodology.**

**Examples:**

- "Use systematic literature review principles"
- "Apply ISO 527 tensile testing standards"
- "Follow IUPAC nomenclature"
- "Compare results against baseline (pure PLA)"
- "Calculate statistics using standard error of the mean"

---

### A – Assumptions (Constraints)

**Critical for scientific accuracy.**

Define:
- **What to include** (whitelisting)
- **What to exclude** (blacklisting)
- **How to handle uncertainty**

**Examples:**

```
Constraints:
- Focus exclusively on non-oxide ceramics
- Exclude papers before 2020
- If data is missing, mark as "Not reported"—do not estimate
- Flag any mentions of electrospinning
- Only include peer-reviewed sources (no preprints)
```

**Why it matters:** Without constraints, the AI may:
- Include irrelevant material
- Speculate on missing data (hallucination risk)
- Mix incompatible datasets

---

### T – Tone

**Set the voice and style.**

**Common tones for scientific work:**

- **Technical/Objective:** For peer review, reports
- **Formal:** For legal, regulatory documents
- **Conversational:** For internal brainstorming
- **Cautious:** For safety-critical procedures

**Example:**

```
Tone: Technical and objective, suitable for submission to 
Materials Science & Engineering: A. Avoid speculation or 
promotional language.
```

---

## Complete AUTOMAT Example

### Scenario: Literature Review for Patent Application

**Prompt:**

```
[U] Act as a Materials Science Patent Analyst with expertise in 
polymer composites and prior art searches.

[A] Audience: AmaDema IP Legal Team preparing a patent application 
for a novel PLA/graphene nanocomposite synthesis method.

[T] Task: Review the following 12 papers and extract information 
relevant to prior art assessment for our patent application focusing 
on electrospinning-based PLA/graphene synthesis.

[O] Output: Markdown table with columns:
   - Paper DOI
   - Year
   - Synthesis Method
   - Graphene Content (wt%)
   - Key Innovation
   - Overlap with Our Method (High/Medium/Low/None)
   - Notes for Legal Team

[M] Method: 
   - Apply patent prior art search principles
   - Focus on claims that would challenge patentability
   - Highlight any methods using electrospinning + in-situ reduction

[A] Assumptions/Constraints:
   - Only include peer-reviewed journal articles
   - Exclude review papers and patents
   - If graphene content not specified, mark "Not reported"
   - Flag any papers from competing companies (Nanotech Solutions, 
     PolyMat GmbH)
   - Do not speculate on methods not explicitly described

[T] Tone: Formal, objective, suitable for legal review. Err on 
side of caution when assessing overlap.
```

---

## Materials Science Examples

### Example 1: Tensile Testing Analysis

```
[U] Act as a Materials Testing Engineer with expertise in ISO 527 
tensile testing standards.

[A] Audience: R&D team conducting quality control on nanofiber mats.

[T] Task: Analyse these 7 stress-strain curves and calculate tensile 
strength, Young's modulus, and elongation at break for each sample.

[O] Output: 
   1. Summary table (Sample ID, Tensile Strength, Young's Modulus, 
      Elongation)
   2. Identify outliers (>2 SD from mean)
   3. Calculate average ± standard deviation for passing samples
   4. Python code used for calculations (commented)

[M] Method: Follow ISO 527-1:2019 standards. Use linear regression 
for modulus (strain 0.05-0.25%).

[A] Constraints:
   - Exclude any samples with irregular load curves (noise, slippage)
   - Young's modulus calculated from linear region only
   - Report all values to 2 decimal places
   - Flag any samples with premature failure (<50% expected strain)

[T] Tone: Technical, objective, suitable for QC documentation.
```

---

### Example 2: SEM Image Analysis

```
[U] Act as a Materials Characterisation Specialist with expertise 
in SEM image analysis of electrospun fibers.

[A] Audience: R&D scientists preparing a manuscript for 
Polymer journal.

[T] Task: Analyse this SEM image (attached) and measure fiber 
diameter distribution and calculate porosity.

[O] Output:
   1. Average fiber diameter ± standard deviation (20 measurements)
   2. Diameter distribution histogram (bin size: 50 nm)
   3. Calculated porosity (% area not covered by fibers)
   4. Assessment of fiber uniformity (coefficient of variation)
   5. Brief interpretation (2-3 sentences)

[M] Method:
   - Use scale bar for calibration
   - Measure 20 representative fibers randomly across image
   - Calculate porosity via threshold segmentation
   - Compare to typical electrospun PLA (literature benchmarks)

[A] Constraints:
   - Exclude fibers at image edges (edge effects)
   - Exclude beads or defects from diameter measurements
   - If scale bar unclear, request clarification—do not estimate
   - Compare only to electrospun materials (not melt-spun)

[T] Tone: Scientific, suitable for peer-reviewed publication. 
Emphasise reproducibility of measurements.
```

---

## Common Mistakes to Avoid

### ❌ Mistake 1: Vague Task Definition

**Bad:**
```
Analyse this data
```

**Good:**
```
Calculate mean tensile strength and standard deviation from these 
7 datasets, excluding outliers beyond 2 SD
```

---

### ❌ Mistake 2: Missing Output Format

**Bad:**
```
Summarise these polymer papers
```

**Good:**
```
Create a markdown table with columns: DOI, Polymer Type, Synthesis 
Method, Key Finding. Include 10-15 entries.
```

---

### ❌ Mistake 3: No Constraints on Hallucination

**Bad:**
```
What is the melting point of this polymer?
```

**Good:**
```
If the melting point is reported in the paper, extract it with page 
number citation. If not reported, state "Not reported"—do not 
estimate or use literature values.
```

---

## Exercise: Build Your Own AUTOMAT Prompt

!!! question "Challenge"
    **Scenario:** You need to format 5 lab notebook entries (handwritten 
    synthesis protocols) into a standardised digital template.
    
    **Your task:** Construct a complete AUTOMAT prompt for this task.
    
    **Requirements:**
    - Define appropriate user persona
    - Specify output format (what fields?)
    - Include constraints (what to do with missing info?)
    - Set appropriate tone
    
    **Test your prompt in the sandbox** and refine based on output quality.

---

## When to Use AUTOMAT

**Best for:**
✅ Functional tasks with clear outputs (data extraction, formatting)  
✅ Scientific workflows requiring precision  
✅ Tasks where IP protection is critical  
✅ Situations requiring reproducible results

**Not ideal for:**
❌ Open-ended brainstorming  
❌ Conversational learning (use CO-STAR instead)  
❌ Simple, one-sentence tasks

---

**Next:** [CO-STAR Framework](costar-framework.md) – For context-heavy communication →
