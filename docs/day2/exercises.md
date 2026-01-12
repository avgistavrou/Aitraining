# Day 2 Exercises

Practice context building, CO-STAR framework, and hallucination detection.

---

## Exercise 1: Context Transformation Challenge

### Part A: Vague to Precise

Transform these vague prompts into context-rich, precise requests:

#### Scenario 1

**Vague prompt:**
```
Write about nanotechnology applications
```

**Your task:** Add explicit context including:
- Your role at AmaDema
- Intended audience
- Specific application area
- Length and format
- Required sections

**Your contextualised prompt:** ___________

---

#### Scenario 2

**Vague prompt:**
```
Analyse this data
```

**Your task:** Specify:
- What type of data (SEM image? Stress-strain curves?)
- What analysis is needed
- What output format
- What to do with outliers/missing data

**Your contextualised prompt:** ___________

---

### Part B: A/B Testing

1. Test BOTH prompts (vague and contextualised) in the sandbox
2. Compare outputs side-by-side
3. Document quality differences:
   - Relevance
   - Specificity
   - Usefulness
   - Required follow-up iterations

**Time:** 15 minutes

---

## Exercise 2: CO-STAR for Strategic Communication

### Scenario

AmaDema's R&D Director wants to understand the business case for adopting AI tools in the lab. She's concerned about:

- Accuracy and reliability
- IP security
- Staff training time
- Cost vs. benefit

You need to write a 1-page memo that addresses these concerns whilst building enthusiasm for the programme.

### Your Task

Construct a complete CO-STAR prompt that will:

1. Provide necessary **Context** about the situation
2. Define clear **Objective** (not just "explain AI")
3. Specify appropriate **Style** for scientific audience
4. Set **Tone** that's persuasive but evidence-based
5. Define **Audience** characteristics
6. Specify **Response** format and structure

### Evaluation Criteria

**Good output should:**

- Address all 4 concerns explicitly
- Use evidence and examples
- Acknowledge risks while emphasising benefits
- End with clear call to action
- Be persuasive to scientifically-minded skeptics

### Test Your Prompt

1. Access the sandbox
2. Run your CO-STAR prompt
3. Evaluate the output:
   - Does it address all concerns?
   - Is the tone appropriate?
   - Would it persuade your skeptical colleagues?
4. Refine and re-test

**Time:** 20 minutes

---

## Exercise 3: Advanced Hallucination Hunt

### Scenario

An AI generated this excerpt from a materials characterisation report. It contains multiple errors—some obvious, some subtle.

### The Report Excerpt

> **Mechanical Testing Results**
> 
> Tensile testing was performed according to ASTM D638 Type IV specimens. The PLA/graphene nanocomposite mats (thickness 100 μm) were tested using an Instron 5566 universal testing machine with a 100 N load cell at a crosshead speed of 10 mm/min.
> 
> Pure PLA nanofibers showed a Young's modulus of 2.1 GPa and tensile strength of 35 MPa, consistent with values reported by Chen et al. (2023) in *Advanced Composite Materials* (DOI: 10.1080/acma.2023.05.442). 
> 
> Addition of 5 wt% graphene oxide increased Young's modulus to 5.8 GPa (176% improvement) and tensile strength to 62 MPa (77% improvement). Remarkably, elongation at break also increased from 12% to 28%, indicating simultaneous enhancement of stiffness and ductility—a rare outcome in particulate-reinforced composites.
> 
> At 10 wt% graphene loading, modulus reached 9.2 GPa while tensile strength peaked at 85 MPa. However, elongation at break decreased to 8%, suggesting the onset of brittleness due to graphene aggregation at high loadings.
> 
> Characterisation via quantum-tunnelling X-ray photoelectron spectroscopy (QT-XPS) confirmed reduction of graphene oxide, with C/O ratio increasing from 2.2 (GO) to 16.5 (reduced graphene). This high reduction efficiency explains the superior electrical conductivity of 4.2 × 10⁻³ S/cm observed in the 10% loading sample.
> 
> Dynamic mechanical analysis (DMA) revealed glass transition temperature (Tg) of pure PLA at 62°C. Addition of graphene increased Tg to 68°C (5 wt% loading) and 71°C (10 wt% loading), indicating restricted polymer chain mobility due to strong graphene-PLA interactions.
> 
> These results compare favourably to the benchmark study by Zhang et al. (2022) published in *Polymer Composites* (DOI: 10.1002/pc.2022.11.337), who reported only 40% modulus improvement at 5% graphene loading using ex-situ methods.

### Your Task

1. **Identify all errors** (fabricated citations, physically impossible values, non-existent techniques, inconsistent claims)
2. **Explain WHY each is wrong** (not just "this is false")
3. **Suggest verification methods** for each claim
4. **Propose fixes** where possible

### Hints

- Check DOI formats
- Verify technique names
- Look for physical inconsistencies (stiffness vs. ductility trade-offs)
- Test logical consistency (do all claims align?)
- Apply materials science domain knowledge

### Verification Tools

- [CrossRef DOI Search](https://search.crossref.org/)
- [Google Scholar](https://scholar.google.com/)
- Materials science handbooks
- Your expertise

**Time:** 20 minutes

---

## Exercise 4: Framework Selection Challenge

### Instructions

For each scenario below, decide:

1. **Which framework?** AUTOMAT or CO-STAR?
2. **Why?** Justify your choice
3. **Build the prompt** using your chosen framework

### Scenario A: Data Extraction

```
You have 12 papers on ceramic nanofiber synthesis. You need to 
extract synthesis temperatures, precursor materials, and yield 
data for a competitive analysis table.
```

**Your choice:** ___________  
**Justification:** ___________  
**Your prompt:** ___________

---

### Scenario B: Grant Application Summary

```
You need to write the "Impact Statement" section (250 words) for 
an EPSRC grant application, explaining how your PLA/graphene 
research will contribute to UK net-zero goals. Audience is panel 
reviewers with mixed technical backgrounds.
```

**Your choice:** ___________  
**Justification:** ___________  
**Your prompt:** ___________

---

### Scenario C: Protocol Formatting

```
You have 5 handwritten lab notebook entries (synthesis protocols) 
that need to be converted into standardised digital format with 
sections for Materials, Methods, Safety, and Waste Disposal.
```

**Your choice:** ___________  
**Justification:** ___________  
**Your prompt:** ___________

---

### Scenario D: Literature Review

```
You're writing the Introduction section for a journal manuscript 
on electrospun non-oxide ceramic nanofibers. You need to synthesise 
the state of the field, identify the research gap, and position 
your contribution. Target: Polymer journal, ~800 words, peer reviewers.
```

**Your choice:** ___________  
**Justification:** ___________  
**Your prompt:** ___________

---

### Scenario E: SEM Image Analysis

```
You have 20 SEM images of electrospun fibers at different synthesis 
conditions. You need to measure fiber diameters (20 measurements per 
image), calculate statistics (mean, SD, CV), and identify any defects 
(beads, breaks, non-uniformity).
```

**Your choice:** ___________  
**Justification:** ___________  
**Your prompt:** ___________

---

## Exercise 5: Iterative Context Refinement

### Scenario

You're asking for help optimising electrospinning parameters, but your first attempt gets generic results.

### Round 1: Your Initial Prompt

```
How do I improve my electrospinning results?
```

**Test in sandbox. What problems do you notice?**

---

### Round 2: Add Context

Based on Round 1 output, add:
- Current parameters
- Observed problems
- Target specifications
- Material system

**Test again. Better?**

---

### Round 3: Specify Output

Add:
- Desired format (systematic troubleshooting checklist? Prioritised recommendations?)
- Decision criteria (ease of implementation? Cost? Time?)

**Test again. Production-ready?**

---

### Reflection

Document how each refinement improved output quality. How many rounds did you need?

**Time:** 15 minutes

---

## Exercise 6: Negative Context Practice

### Scenario

You need a synthesis protocol, but previous AI outputs included problematic suggestions (toxic reagents, exotic equipment).

### Your Task

Write a prompt that uses **negative context** to prevent unwanted recommendations:

```
Write synthesis protocol for PLA/graphene nanofibers.

DO NOT:
- [Add your constraints here]
- 
- 
-
```

**Test in sandbox:** Does the output respect your constraints?

---

## Exercise 7: Assumption Surfacing

### Scenario

Ask the AI to recommend optimal graphene loading for your composite.

**Standard prompt:**
```
What's the optimal graphene loading for PLA composites?
```

**Enhanced prompt (with assumption surfacing):**
```
Recommend optimal graphene loading for PLA composites.

Before providing recommendations, explicitly state:
1. What you're assuming about target properties
2. What you're assuming about processing method
3. What you're assuming about cost constraints
4. What "optimal" means in this context

Then provide recommendations with assumptions clearly noted.
```

**Test both:** How does surfacing assumptions improve the answer?

---

## Bonus Challenge: Combined Frameworks

### Scenario

You need to create a technical report that includes:

1. Executive summary (narrative, audience-dependent)
2. Comparative data table (structured, precise)
3. Recommendations (narrative, strategic)

### Your Task

**Design a workflow using BOTH frameworks:**

1. Use **CO-STAR** for executive summary
2. Use **AUTOMAT** for data table
3. Use **CO-STAR** for recommendations

**Document:** How does combining frameworks improve overall quality?

---

## Reflection Questions

After completing exercises, consider:

1. **Context Impact:** How much did explicit context improve output quality?
2. **Framework Selection:** Did you choose appropriately between AUTOMAT and CO-STAR?
3. **Iteration Count:** How many refinement rounds were typically needed?
4. **Hallucination Detection:** What patterns did you notice in AI errors?
5. **Efficiency:** How much time did good context/frameworks save vs. trial-and-error?

---

## Workshop Debriefing

At the end of Day 2, we'll discuss:

- Common context mistakes and how to avoid them
- When to use AUTOMAT vs. CO-STAR (decision heuristics)
- Hallucination patterns specific to materials science
- Real examples from participants' work

---

**Next:** [Day 3 Overview](../day3/overview.md) – Technical Architecture & Green AI →
