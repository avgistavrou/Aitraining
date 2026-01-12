# Responsible AI & Risk Management

!!! danger "Critical Principle"
    **Access to AI tools does not require data exposure.**
    
    You can leverage AI's power whilst protecting AmaDema's intellectual property.

---

## Understanding Hallucinations

### What Are Hallucinations?

**Hallucination:** When an LLM generates plausible-sounding but factually incorrect or fabricated information.

### Why Do They Occur?

LLMs are **pattern-matching prediction engines**, not knowledge databases.

When you ask:

> "What is the tensile strength of Ti₆Al₄V processed at 400°C with 2% oxygen content?"

The model doesn't:
- ❌ Look up this value in a database
- ❌ Calculate it from first principles
- ❌ Admit uncertainty

Instead, it:
- ✅ Predicts the most probable next tokens based on training patterns
- ✅ Synthesises a plausible-sounding answer from similar contexts
- ✅ Presents it with confidence

---

## Types of Hallucinations

### 1. Confident Fabrication

**Example:**

**Prompt:** "What is the melting point of polyethylene glycol-alt-polylactic acid copolymer with 40% PEG content?"

**Response:** "The melting point is 87.3°C, as reported by Zhang et al. (2019) in *Polymer Science Journal* 45(3):234-241."

**Problem:** 
- Specific temperature seems precise
- Citation appears legitimate
- **But:** Paper doesn't exist, value is fabricated

---

### 2. Plausible Interpolation

**Example:**

**Prompt:** "What is the Young's modulus of PLA nanofibers with 7% graphene?"

**Response:** "Approximately 4.2 GPa, based on typical reinforcement trends for graphene-loaded PLA."

**Problem:**
- Sounds reasonable (graphene does increase modulus)
- "Approximately" creates false credibility
- **But:** Actual value depends heavily on dispersion, fiber alignment, testing conditions
- Could be anywhere from 2-8 GPa

---

### 3. Non-Existent Citations

**Example:**

**Prompt:** "Find papers on non-oxide ceramic nanofibers."

**Response:** Lists 10 papers with authors, titles, journals, DOIs.

**Problem:** 
- 3-4 are real papers
- 6-7 are fabricated (plausible combinations of real authors, realistic titles, fake DOIs)
- **Verify every citation**

---

### 4. Misattributed Knowledge

**Example:**

**Prompt:** "Who discovered carbon nanotubes?"

**Response:** "Richard Smalley discovered carbon nanotubes in 1991."

**Problem:**
- Smalley worked on fullerenes (different structure)
- Iijima is generally credited with CNT discovery (1991)
- Model conflated related research

---

## The Red List: Data You Must Never Share

!!! danger "The Red List Protocol"
    These data types must **NEVER** be uploaded to public AI models (ChatGPT, Claude, Gemini, etc.)

### Category 1: Unpublished Research Data

🚫 **Novel molecular structures** (before patent filing)  
🚫 **Exact synthesis parameters** for proprietary processes  
🚫 **Experimental results** from ongoing R&D  
🚫 **Failed experiments** (negative data has IP value)  
🚫 **Grant applications under review**  

---

### Category 2: Commercial Sensitive Information

🚫 **Exact formulations** (precursor ratios, additives)  
🚫 **Process temperatures/pressures** for proprietary methods  
🚫 **Yield data** that reveals manufacturing efficiency  
🚫 **Cost breakdowns** and supplier information  
🚫 **Customer identities** and partnership details  
🚫 **Pricing strategies** and profit margins  

---

### Category 3: Personal & Confidential Data

🚫 **Employee information** (names, contact details, salaries)  
🚫 **Customer data** (contacts, orders, communications)  
🚫 **Internal communications** (emails, meeting notes with strategy)  
🚫 **Financial data** (budgets, forecasts, bank details)  
🚫 **Legal documents** (contracts, NDAs, IP correspondence)  

---

### Category 4: Security-Sensitive Information

🚫 **Access credentials** (passwords, API keys, tokens)  
🚫 **System configurations** (server setups, network architecture)  
🚫 **Security protocols** (physical access, data backup procedures)  
🚫 **Vulnerability assessments** and penetration test results  

---

## Data Sanitisation Strategies

You can still use AI for sensitive tasks by **sanitising data before processing**.

### Strategy 1: Anonymisation

**Replace specific details with generic placeholders.**

❌ **Original (DO NOT SHARE):**
```
We synthesised PLA/graphene nanofibers using electrospinning at 
25kV with a 15cm working distance. Precursor solution: 12% PLA 
(Mw 100kDa) in DMF:DCM (3:1), with 5% graphene oxide reduced 
in-situ using hydrazine vapour at 80°C for 4 hours. Yield: 87%.
```

✅ **Sanitised (SAFE TO SHARE):**
```
We synthesised polymer/nanofiller composite nanofibers using 
electrospinning at [VOLTAGE] with [DISTANCE] working distance. 
Precursor solution: [CONCENTRATION]% polymer (Mw [VALUE]) in 
[SOLVENT], with [X]% nanofiller processed via [METHOD]. 
Yield: [HIGH/MEDIUM/LOW].
```

**Now you can ask:**
> "Convert this generic protocol description into a standardised template with sections for Materials, Methods, and Characterisation."

---

### Strategy 2: Aggregation

**Share trends rather than specific data points.**

❌ **Specific (Red List violation):**
```
Synthesis batch #343: Tensile strength 45.2 MPa at 23°C, 
42.1 MPa at 40°C, 38.9 MPa at 60°C
```

✅ **Aggregated (Safe):**
```
Tensile strength decreases approximately 15% between 20-60°C 
for our polymer composite
```

---

### Strategy 3: Hypothetical Framing

**Ask about general principles, not your specific case.**

❌ **Specific (reveals IP):**
```
We're using in-situ reduction during electrospinning to disperse 
graphene oxide in PLA. What synthesis parameters should we optimise?
```

✅ **Hypothetical (Safe):**
```
For in-situ reduction of nanofillers during polymer processing 
(generic question), what parameters typically affect dispersion 
quality in polymer nanocomposites? Provide a general framework 
for optimisation, not specific values.
```

---

### Strategy 4: Use Local Models

**For truly sensitive work, use the air-gapped sandbox.**

The local Llama model:
- ✅ Your data never leaves the room
- ✅ No internet connection required
- ✅ No storage by external providers
- ✅ Full admin monitoring

**Best for:**
- Analysing proprietary experimental data
- Drafting patent applications
- Processing customer information
- Strategic planning documents

---

## Verification Protocols

**Never trust AI outputs without verification.**

### Protocol 1: Citation Verification

**For every citation:**

1. ✅ Verify DOI resolves to real paper
2. ✅ Check authors match
3. ✅ Confirm journal and year
4. ✅ Read abstract—does claim match?
5. ✅ Check actual data in paper

**Use:** [CrossRef](https://search.crossref.org/), [Google Scholar](https://scholar.google.com/), [PubMed](https://pubmed.ncbi.nlm.nih.gov/)

---

### Protocol 2: Quantitative Data Verification

**For any numerical claim:**

1. ✅ Check if value is within physically reasonable range
2. ✅ Compare to known benchmarks for similar materials
3. ✅ Verify units are consistent
4. ✅ Look up value in authoritative source (handbook, database)
5. ✅ If critical: independently calculate or measure

**Red flags:**
- Suspiciously round numbers (exactly 100°C, 5.0 GPa)
- Excessive precision (87.34256°C—unrealistic measurement precision)
- Values outside known ranges (PLA melting at 300°C—impossible)

---

### Protocol 3: Logical Consistency Check

**Ask:**
- Does this conclusion follow from the premises?
- Are there internal contradictions?
- Does it contradict established knowledge?
- Would an expert in this field agree?

**Example:**

**AI Output:** "Increasing graphene content from 5% to 10% improved tensile strength by 40% while simultaneously increasing elongation at break by 30%."

**Red flag:** Typically, higher filler content increases stiffness (tensile strength) but decreases ductility (elongation). This simultaneous improvement is possible but unusual—requires verification.

---

### Protocol 4: The "Skeptical Colleague" Test

**Before using AI output:**

> "If I presented this to my most skeptical colleague, what would they challenge?"

Then:
1. Pre-emptively verify those points
2. Add disclaimers where uncertainty exists
3. Provide supporting evidence for critical claims

---

## The Hallucination Hunt Exercise

!!! question "Challenge: Find the Errors"
    You'll receive an AI-generated synthesis report for a PLA/graphene nanocomposite.
    
    **Hidden errors (5 total):**
    - 1 fabricated citation
    - 1 physically impossible value
    - 1 misattributed discovery
    - 1 inconsistent claim
    - 1 non-existent characterisation method
    
    **Time limit:** 20 minutes
    
    **Prize:** "Critical Thinker" badge for fastest team

### Sample Report Excerpt

> "The nanocomposite was prepared following the method of Zhang et al. (2023, *Polymer Engineering*, DOI: 10.1016/j.poleng.2023.05.234). Graphene oxide was dispersed in N,N-dimethylformamide via sonication for 30 minutes, then mixed with 12% w/v PLA solution (Mw 150 kDa). The mixture was electrospun at 25 kV with a working distance of 15 cm. In-situ reduction was achieved using hydrazine vapour at 120°C for 2 hours, following the protocol first developed by Smalley (1996) for carbon nanotube functionalisation.
> 
> Characterisation via nano-X-ray photoelectron spectroscopy (nano-XPS) confirmed complete reduction of graphene oxide, with C/O ratio increasing from 2.1 to 15.8. Tensile testing showed Young's modulus of 4.2 GPa at 5% graphene loading, increasing to 8.9 GPa at 10% loading, while maintaining elongation at break >150% for both compositions. The melting point of the nanocomposite was measured at 168.5°C via DSC, consistent with the known value for PLA."

**What's wrong?** (Answers in workshop—no spoilers here!)

---

## Red List Violations: Case Studies

### Case Study 1: The Patent Disaster

**Scenario:** A researcher asked ChatGPT to help draft a patent application, including the complete synthesis protocol for a novel ceramic nanowire.

**What happened:**
1. Protocol was processed by OpenAI's servers
2. Data potentially used for model training (uncertain)
3. Timestamp creates "prior disclosure" risk
4. Patent application delayed 6 months for legal review
5. Had to file provisional patent immediately

**Lesson:** Never share unpublished IP with public models.

---

### Case Study 2: The Competitor Leak

**Scenario:** An R&D manager uploaded internal quarterly report (including customer names, pricing, and roadmap) to Claude for "executive summary generation."

**What happened:**
1. Document contained customer NDAs
2. Violated data protection agreements
3. Potential GDPR violation (customer data)
4. Required disclosure to affected customers
5. Damaged business relationships

**Lesson:** Sanitise all internal documents before processing.

---

### Case Study 3: The Successful Approach

**Scenario:** A materials scientist needed help analysing SEM images for fiber diameter distribution.

**What they did:**
1. Used local sandbox (air-gapped)
2. Processed images entirely offline
3. Generated Python script for analysis
4. Verified calculations independently
5. No external data sharing

**Outcome:** ✅ Faster analysis, full IP protection, zero risk.

**Lesson:** For sensitive data, use local models.

---

## Decision Framework: Can I Share This?

```
Is this data published or public?
├─ YES → Safe to use with any AI tool
└─ NO → Is it on the Red List?
    ├─ YES → Use local sandbox ONLY
    └─ NO → Can I sanitise it (anonymise, aggregate, hypothetical)?
        ├─ YES → Sanitise, then use external AI
        └─ NO → Use local sandbox ONLY
```

---

## Exercise: Red List Assessment

!!! question "Challenge"
    For each scenario, decide: ✅ Safe to share, ⚠️ Safe after sanitisation, or 🚫 Red List violation
    
    1. "Analyse this SEM image to measure fiber diameters" [image attached from ongoing experiment]
    2. "Summarise these 5 published papers on PLA degradation" [DOIs provided]
    3. "Convert this lab notebook entry into standardised format" [contains exact synthesis conditions for patent-pending process]
    4. "Generate Python code to calculate Young's modulus from stress-strain curves" [generic request, no data attached]
    5. "Draft an email to our customer Aerospace Corp about delay in shipment" [mentions company name]
    
    **Discuss:** What sanitisation would make unsafe items safe?

---

**Next:** [Day 1-2 Exercises](exercises.md) – Put frameworks into practice →
