# Day 1 Exercises

Practice applying AUTOMAT framework, conversational learning, and responsible AI principles.

---

## Exercise 1: AUTOMAT for Literature Data Extraction

### Scenario

You have 8 papers on electrospun PLA/graphene nanocomposites. You need to extract synthesis parameters for a competitive analysis being prepared for your quarterly R&D review.

### Your Task

Construct a complete AUTOMAT prompt that will:

1. Extract key synthesis parameters from these papers
2. Output in a structured format suitable for comparison
3. Include constraints to ensure consistency
4. Handle missing data appropriately

### Requirements

- ✅ Define appropriate User Persona
- ✅ Specify Audience (R&D team)
- ✅ Define Task explicitly
- ✅ Specify Output format (table structure)
- ✅ Include Method guidance
- ✅ Add Assumptions/Constraints
- ✅ Set appropriate Tone

### Test Your Prompt

1. Access the sandbox: `http://[instructor-IP]:3000`
2. Paste your AUTOMAT prompt
3. Evaluate the output:
   - Is the format exactly as specified?
   - Are constraints followed?
   - Is tone appropriate?
4. Refine and re-test until satisfied

---

## Exercise 2: The Hallucination Hunt

!!! danger "Challenge: Find the Errors"
    Below is an AI-generated report about PLA/graphene nanocomposite synthesis. It contains **5 deliberate errors**:
    
    - 1 fabricated citation
    - 1 physically impossible value
    - 1 misattributed discovery/method
    - 1 internally inconsistent claim
    - 1 non-existent characterisation technique

### The Report

> **Synthesis and Characterisation of PLA/Graphene Nanocomposite Fibers**
> 
> **Introduction**
> 
> Poly(lactic acid) (PLA) is a biodegradable thermoplastic derived from renewable resources. Its mechanical properties can be enhanced through incorporation of graphene nanofiller. The first successful electrospinning of PLA was demonstrated by Reneker and Chun (1996), establishing the foundation for modern nanofiber production.
> 
> **Materials and Methods**
> 
> Graphene oxide (GO) was dispersed in N,N-dimethylformamide (DMF) via sonication for 45 minutes at 40 kHz. PLA pellets (Mw 150 kDa, Natureworks) were dissolved in DMF to create a 12% w/v solution. GO dispersion was added to achieve final concentrations of 3%, 5%, and 7% w/w relative to PLA mass.
> 
> The polymer-nanofiller solution was loaded into a 10 mL syringe fitted with a 21-gauge needle. Electrospinning parameters were optimised following the protocol established by Zhang et al. (2023) in *Polymer Engineering Science* (DOI: 10.1002/pen.2023.08.445). Applied voltage: 22 kV, working distance: 18 cm, flow rate: 1.2 mL/h. Fibers were collected on aluminium foil-covered rotating drum (1500 rpm).
> 
> In-situ reduction of GO was performed using hydrazine vapour at 95°C for 3 hours in a sealed chamber, based on the method pioneered by Smalley and Kroto (1991) for carbon nanotube functionalisation.
> 
> **Characterisation**
> 
> Morphology was assessed via scanning electron microscopy (SEM, Zeiss Sigma 300). Average fiber diameter was measured from 50 random fibers per sample using ImageJ software. Reduction efficiency was confirmed using quantum-resolution X-ray photoelectron spectroscopy (QR-XPS), showing C/O ratio increase from 2.3 (GO) to 14.7 (reduced graphene).
> 
> Thermal properties were evaluated via differential scanning calorimetry (DSC, TA Instruments Q200). Heating rate: 10°C/min from 25°C to 250°C. The glass transition temperature (Tg) of pure PLA was 58°C, consistent with literature values. Melting point (Tm) remained constant at 168°C across all graphene loadings.
> 
> Tensile testing was performed on fiber mat samples (50 × 10 mm, thickness ~100 μm) using Instron 5566 with 100 N load cell. Crosshead speed: 10 mm/min, gauge length: 30 mm. Results showed Young's modulus increased from 2.1 GPa (pure PLA) to 5.8 GPa (7% graphene). Simultaneously, elongation at break increased from 12% (pure PLA) to 35% (7% graphene), indicating improved ductility alongside enhanced stiffness.
> 
> **Results**
> 
> SEM analysis revealed uniform fiber morphology with average diameters of 580 nm (pure PLA), 520 nm (3% graphene), 480 nm (5% graphene), and 440 nm (7% graphene). The diameter reduction correlates with increased solution conductivity from graphene incorporation.
> 
> All samples exhibited complete reduction of GO to graphene, as confirmed by QR-XPS analysis showing >85% reduction in oxygen-containing functional groups.
> 
> **Discussion**
> 
> The simultaneous improvement in modulus and ductility represents a significant advancement over previous PLA/graphene composites, which typically show modulus-ductility trade-offs. This behaviour is attributed to the uniform dispersion achieved via in-situ reduction, preventing stress concentration at filler aggregates.

### Your Task

1. **Identify all 5 errors** using verification protocols from [Responsible AI](responsible-ai.md)
2. **Explain why each is wrong** (not just "this is false")
3. **Suggest how to verify** the correct information
4. **Propose a fix** for each error

### Verification Tools

- [CrossRef DOI Search](https://search.crossref.org/)
- [Google Scholar](https://scholar.google.com/)
- [PubMed](https://pubmed.ncbi.nlm.nih.gov/)
- Materials handbooks
- Your scientific judgment

### Time Limit

20 minutes in workshop session

---

## Exercise 3: Red List Assessment

For each scenario below, determine:

- ✅ **Green:** Safe to use with external AI tools
- ⚠️ **Yellow:** Safe after sanitisation (describe how)
- 🚫 **Red:** Must use local sandbox only

### Scenario A

```
Prompt: "Convert this lab notebook entry into standardised digital format"

Attachment: Handwritten notes containing:
- Date: 15 Jan 2025
- Experiment: PLA/GO electrospinning test
- Voltage: 22 kV
- Distance: 18 cm  
- Solution: 12% PLA in DMF with 5% GO
- Outcome: Good fiber formation, uniform diameter
- Next steps: Try 7% GO, optimise voltage
```

**Your assessment:** ___________  
**Reasoning:** ___________  
**Sanitisation approach (if applicable):** ___________

---

### Scenario B

```
Prompt: "Summarise key findings from these papers on PLA degradation kinetics"

Attachment: List of 6 DOIs from published literature (2020-2024)
```

**Your assessment:** ___________  
**Reasoning:** ___________

---

### Scenario C

```
Prompt: "Analyse this SEM image and measure fiber diameters"

Attachment: SEM image from Experiment #343 (patent-pending process), 
filename: "AmaDema_NanoFiber_Protocol_v7_HighRes.tif"
```

**Your assessment:** ___________  
**Reasoning:** ___________  
**Sanitisation approach (if applicable):** ___________

---

### Scenario D

```
Prompt: "Generate Python code to calculate Young's modulus from stress-strain data"

Attachment: None (just asking for generic code structure)
```

**Your assessment:** ___________  
**Reasoning:** ___________

---

### Scenario E

```
Prompt: "Draft response to customer email about shipment delay"

Context: "Customer is Aerospace Innovations Ltd, they ordered 50kg of 
our ceramic nanofibers for Q1 delivery. We're 3 weeks delayed due to 
equipment malfunction. They're our largest customer (40% of revenue). 
Need to maintain relationship whilst being honest about delay."
```

**Your assessment:** ___________  
**Reasoning:** ___________  
**Sanitisation approach (if applicable):** ___________

---

## Exercise 4: Prompt Refinement Challenge

### Scenario

You tested this prompt in the sandbox and got poor results. Your task: refine it using AUTOMAT.

### Original (Poor) Prompt

```
Summarise recent research on polymer nanocomposites
```

### Problems with This Prompt

1. No specific polymer or nanofiller defined
2. No time frame for "recent"
3. No output format specified
4. No constraints on scope
5. No audience or use case indicated

### Your Refined Prompt

Using AUTOMAT, rewrite this prompt to:

- Specify the exact polymer and nanofiller of interest
- Define output format
- Set appropriate constraints
- Indicate intended use
- Define audience

**Test both versions** in the sandbox and compare outputs.

---

## Exercise 5: Conversational Learning Practice

### Scenario

**Initial prompt:** "What's the best graphene loading for PLA composites?"

**AI response:** "5-7 wt% typically provides a good balance of mechanical enhancement and processability."

### Your Task

Design a learning dialogue with at least 5 follow-up questions that:

1. Probe the reasoning behind this recommendation
2. Explore alternative scenarios
3. Understand trade-offs
4. Identify assumptions
5. Build a transferable decision framework

### Example Follow-ups

1. ___________
2. ___________
3. ___________
4. ___________
5. ___________

**Test this dialogue in the sandbox** and document what you learned beyond the initial answer.

---

## Reflection Questions

After completing exercises, consider:

1. **Efficiency:** How much time did AUTOMAT save vs. conversational approach?
2. **Quality:** Did structured prompts produce more relevant outputs?
3. **Reproducibility:** Could a colleague use your prompt and get similar results?
4. **Security:** Did you successfully avoid Red List violations?
5. **Learning:** What surprised you about AI's capabilities or limitations?

---

## Workshop Debriefing

At the end of Day 1, we'll discuss:

- Common patterns in successful prompts
- Frequently missed constraints
- Hallucination detection strategies that worked
- Real examples from participants' work

---

**Next:** [Day 2 Overview](../day2/overview.md) – Context & CO-STAR Framework →
