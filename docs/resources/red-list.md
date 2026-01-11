# The Red List: Data Security Protocol

!!! danger "NEVER SHARE THESE WITH PUBLIC AI MODELS"
    The Red List defines data types that must NEVER be uploaded to external AI services (ChatGPT, Claude, Gemini, etc.)
    
    **For sensitive data: Use local sandbox ONLY**

---

## Category 1: Unpublished Research Data

### 🚫 Novel Molecular Structures

**Examples:**
- Chemical formulas for new compounds
- Molecular structures before patent filing
- Novel synthesis routes
- Proprietary modifications to known structures

**Why protected:** Patent priority, competitive advantage

**Solution:** Use local sandbox with anonymised structures like `[Compound A]`, `[Novel polymer X]`

---

### 🚫 Exact Synthesis Parameters

**Examples:**
- Precise temperature/pressure conditions
- Exact precursor ratios
- Specific catalyst concentrations
- Processing times and sequences
- Equipment-specific settings

**Why protected:** Manufacturing know-how, competitive advantage

**Solution:** Use generic placeholders: `[TEMP]°C`, `[X]% loading`, `[Y] hours`

---

### 🚫 Experimental Results (Ongoing Research)

**Examples:**
- Raw data from current experiments
- Performance metrics before publication
- Characterisation results
- Yield data
- Comparative test results

**Why protected:** Competitive advantage, patent disclosure risk

**Solution:** Wait until published OR use aggregate/anonymised data: "Yield improved ~20%" instead of "Yield: 87.3%"

---

### 🚫 Failed Experiments (Negative Data)

**Examples:**
- Approaches that didn't work
- Conditions that led to failure
- Unexpected results

**Why protected:** Valuable for IP strategy (knows what doesn't work), can guide competitors

**Solution:** Use hypothetical framing: "What factors might cause [generic problem]?" instead of sharing specific failures

---

### 🚫 Grant Applications Under Review

**Examples:**
- Unpublished research proposals
- Preliminary data submitted with grants
- Project timelines and milestones
- Budget information

**Why protected:** Competitive funding advantage, IP disclosure

**Solution:** Wait until funded OR use public information only

---

## Category 2: Commercially Sensitive Information

### 🚫 Exact Formulations

**Examples:**
- Precise ingredient/component ratios
- Additive identities and concentrations
- Proprietary blends
- Trade secret compositions

**Why protected:** Core competitive advantage

**Solution:** Use generic descriptions: "Polymer matrix with nano-reinforcement in optimal ratio"

---

### 🚫 Process Temperatures/Pressures/Conditions

**Examples:**
- Exact processing windows
- Optimised parameter sets
- Equipment-specific conditions
- Multi-step sequences with timing

**Why protected:** Manufacturing efficiency, quality control

**Solution:** Use ranges or categories: "Elevated temperature", "Moderate pressure"

---

### 🚫 Yield Data Revealing Efficiency

**Examples:**
- Production yields
- Waste percentages
- Batch success rates
- Process efficiency metrics

**Why protected:** Reveals manufacturing capability and costs

**Solution:** Use qualitative terms: "High yield", "Commercial viability demonstrated"

---

### 🚫 Cost Breakdowns

**Examples:**
- Raw material costs
- Processing costs per unit
- Profit margins
- Pricing strategies

**Why protected:** Competitive pricing advantage

**Solution:** Never share; if needed, use cost-effectiveness comparisons without absolute values

---

### 🚫 Customer/Partner Identities

**Examples:**
- Customer names
- Partner company identities
- Collaboration details
- Contract terms

**Why protected:** Confidentiality agreements, competitive intelligence

**Solution:** Use generic terms: "Aerospace partner", "European customer"

---

## Category 3: Personal & Confidential Data

### 🚫 Employee Information

**Examples:**
- Names with roles
- Contact details
- Salary information
- Performance reviews
- Personal data of any kind

**Why protected:** Privacy laws (GDPR, etc.), professional ethics

**Solution:** Never share; use roles only: "Senior Researcher", "Lab Technician"

---

### 🚫 Customer Data

**Examples:**
- Contact information
- Order details
- Communication history
- Technical requirements
- Company-specific information

**Why protected:** Confidentiality agreements, data protection law

**Solution:** Never share; if needed for templates, use completely anonymised examples

---

### 🚫 Internal Communications with Strategy

**Examples:**
- Strategy meeting notes
- Email discussions about direction
- Decision-making rationale
- Internal debates

**Why protected:** Competitive strategy

**Solution:** Never share; for formatting help, use sanitised examples

---

### 🚫 Financial Data

**Examples:**
- Revenue figures
- Budget allocations
- Forecasts
- Bank details
- Investment information

**Why protected:** Competitive intelligence, security

**Solution:** Never share

---

### 🚫 Legal Documents

**Examples:**
- Contracts
- NDAs
- IP correspondence
- Litigation materials
- Legal advice

**Why protected:** Attorney-client privilege, confidentiality

**Solution:** Never share; seek legal counsel for advice

---

## Category 4: Security-Sensitive Information

### 🚫 Access Credentials

**Examples:**
- Passwords
- API keys
- Authentication tokens
- System access details

**Why protected:** Security breach risk

**Solution:** NEVER share; rotate immediately if accidentally exposed

---

### 🚫 System Configurations

**Examples:**
- Server setups
- Network architecture
- Software configurations
- Database schemas

**Why protected:** Security vulnerability

**Solution:** Never share

---

### 🚫 Security Protocols

**Examples:**
- Physical access procedures
- Data backup systems
- Incident response plans
- Vulnerability assessments

**Why protected:** Security effectiveness

**Solution:** Never share

---

## Decision Tree: Can I Share This?

```
START: I want to use AI for [task]

↓

Does the task involve Red List data?
├─ NO → Proceed, but verify output
└─ YES → Can I sanitise the data?
    ├─ YES → Sanitise, then use external AI
    │   └─ Verify sanitisation is complete
    │       - All specific values removed?
    │       - All identities anonymised?
    │       - No reverse-engineering possible?
    │
    └─ NO → Use local sandbox ONLY
        └─ Benefits:
            - Complete privacy
            - No external logging
            - Full control
```

---

## Sanitisation Techniques

### Technique 1: Placeholder Replacement

**Before (Red List violation):**
```
"Synthesised at 750°C for 4 hours using 2.5% graphene oxide"
```

**After (Safe):**
```
"Synthesised at [TEMP]°C for [TIME] hours using [X]% nanofiller"
```

---

### Technique 2: Aggregation

**Before (Red List violation):**
```
"Sample A: 45.2 MPa, Sample B: 47.1 MPa, Sample C: 44.8 MPa"
```

**After (Safe):**
```
"Tensile strength averaged 45-47 MPa across samples"
```

---

### Technique 3: Hypothetical Framing

**Before (Red List violation):**
```
"Our novel PLA/graphene composite with in-situ reduction shows 40% improvement"
```

**After (Safe):**
```
"For polymer/nanofiller composites generally, what factors typically influence mechanical property improvements of 30-50%?"
```

---

### Technique 4: Generic Domain Transfer

**Before (Red List violation):**
```
"Need to optimise electrospinning of PLA at 22kV for customer X"
```

**After (Safe):**
```
"General principles for optimising electrospinning parameters for thermoplastic polymers?"
```

---

## Red List Violation Examples

### ❌ Example 1: Unpublished Data

```
Prompt: "Analyse this data from Experiment #343. Samples showed 
tensile strength of 42.3, 45.1, 44.8 MPa at 5% graphene loading 
using our proprietary in-situ reduction method at 95°C for 3 hours..."
```

**Violations:**
- Exact experimental data (unpublished)
- Specific synthesis conditions
- Proprietary method details

**Fix:** Use local sandbox OR wait until published

---

### ❌ Example 2: Customer Information

```
Prompt: "Draft email to Aerospace Innovations Ltd about 3-week delay 
in their 50kg order of ceramic nanofibers. They're our largest 
customer (40% revenue). Need to maintain relationship..."
```

**Violations:**
- Customer name
- Order details
- Revenue information

**Fix:** 
```
"Draft email template for customer communication regarding production 
delay. Context: Important client, technical issue, maintaining 
relationship. Use generic placeholders."
```

---

### ❌ Example 3: IP Disclosure

```
Prompt: "Review this patent draft for our novel [detailed invention 
description before filing]..."
```

**Violations:**
- Pre-filing disclosure (affects patent priority)
- Complete invention details

**Fix:** Use local sandbox OR wait until filed

---

## Incident Response

**If you accidentally share Red List data:**

1. **STOP:** Do not continue the conversation
2. **DOCUMENT:** Screenshot what was shared, timestamp
3. **REPORT:** Immediately notify:
   - Your supervisor
   - IT/Security team
   - Legal (if IP-related)
4. **ASSESS:** Determine sensitivity and potential impact
5. **MITIGATE:** Follow company incident response protocol
6. **LEARN:** Update processes to prevent recurrence

**Do NOT:**
- Try to "delete" the conversation (data may be logged)
- Continue using that session
- Assume "no harm done"

---

## Training Verification

Test your understanding:

### Scenario 1
"I want to format 20 synthesis protocols into standard templates. The protocols contain exact temperatures, pressures, and precursor ratios for our proprietary process."

**Assessment:** ☐ Green ☐ Yellow ☐ Red  
**Action:** ___________

---

### Scenario 2
"I want to summarise 5 published papers on PLA degradation (all with DOIs, published 2020-2023)."

**Assessment:** ☐ Green ☐ Yellow ☐ Red  
**Action:** ___________

---

### Scenario 3
"I want to analyse SEM images from our patent-pending process, filename contains 'AmaDema_Proprietary_Method_v7'."

**Assessment:** ☐ Green ☐ Yellow ☐ Red  
**Action:** ___________

**Answers:**
1. Red - Use local sandbox (proprietary process parameters)
2. Green - Proceed (published data)
3. Red - Use local sandbox (patent-pending process)

---

**Remember:** When in doubt, use local sandbox. Privacy is permanent; exposure is irreversible.

---

**Next:** [External Resources](external.md) → [Summary](../summary.md)
