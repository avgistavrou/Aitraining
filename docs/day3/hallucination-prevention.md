# Truth vs. Probability: Hallucination Prevention

**Core Concept:** AI generates plausible patterns, not truth—learn to ground it in reality

---

## The Most Critical Section for Scientists

You now understand:
- Words are coordinates in semantic space (Section 1)
- Attention enables context understanding (Section 2)

**Now the crucial question:** Why does it lie?

And more importantly: **How do we stop it?**

---

## What Is a Hallucination?

**Hallucination:** When an LLM generates plausible-sounding but factually incorrect information.

### Real Example

**You ask:** "Find papers on high-entropy alloy electrospinning."

**AI responds:**
> "Here are relevant papers:
> 
> 1. Zhang, L., et al. (2021). "Electrospun High-Entropy Alloy Nanofibers for Catalysis." *Journal of Materials Chemistry A*, 9(15), 9876-9885. DOI: 10.1039/d1ta02847k
> 
> 2. Kumar, S., et al. (2022). "Novel Synthesis Routes for HEA Fiber Production." *Advanced Functional Materials*, 32(18), 2201445. DOI: 10.1002/adfm.202201445"

**Problem:** You check CrossRef. **Neither DOI exists. The papers are fabricated.**

**But they look perfect:** Realistic names, plausible titles, correct journal format, valid-looking DOIs.

---

## Why Hallucinations Happen

### Remember: AI Is a Pattern Completion Engine

When you ask for citations, here's what **actually** happens:

**Step 1:** AI recognizes the pattern "You want a citation list"

**Step 2:** It knows citations follow this pattern:
```
[Author Name] et al. ([Year]). "[Title]." [Journal], [Volume](Issue), [Pages]. DOI: [Number]
```

**Step 3:** It generates tokens that fit this pattern:
- **"Zhang"** — Common surname in materials science papers (seen thousands of times)
- **"et al."** — Standard multi-author format
- **"2021"** — Recent, plausible year
- **"Electrospun High-Entropy Alloy Nanofibers"** — Combines keywords from your query
- **"Journal of Materials Chemistry A"** — Real, high-impact journal
- **"9(15), 9876-9885"** — Plausible volume/issue/pages
- **"10.1039/d1ta02847k"** — Follows DOI format for this publisher

**It looks correct because each component is plausible. But the combination doesn't exist.**

---

## The Probability vs. Truth Problem

### What AI Optimizes For

**Not:** "Is this true?"  
**But:** "Is this the most likely next token?"


Imagine you're **interpolating material properties** from a sparse dataset. You fit a curve through known points.

- **Between data points:** Interpolation is reliable
- **Beyond data points:** Extrapolation becomes guesswork
- **In gaps:** The curve looks smooth but could be wrong

**AI does the same in semantic space:**
- **Patterns it's seen often:** Reliable
- **Combinations it hasn't seen:** Plausible-sounding guesses
- **Missing data:** Fills gaps with probability-weighted tokens

---

## Types of Hallucinations You'll Encounter

### 1. Citation Fabrication

**Most common in scientific contexts.**

```
Pattern learned:
"Papers about [Topic]" → List format → Author-Year-Title-Journal-DOI

Fabrication:
Combines real elements (journal names, plausible authors) 
into fake combinations
```

**How to catch:**
- Verify **every DOI** in CrossRef or Google Scholar
- Check author names match the paper
- Read actual abstract, does it match the claimed content?

---

### 2. Confident Number Fabrication

**Example:**

**You ask:** "What is the degradation temperature of PLA/5% graphene nanocomposite?"

**AI responds:** "The degradation temperature is approximately 342°C, as reported in multiple studies."

**Problem:** This specific composition might not have been studied. AI interpolated from:
- Pure PLA degradation: ~320-340°C
- Graphene generally increases thermal stability
- "~342°C" sounds precise and plausible

**Reality:** Could be anywhere from 330-360°C depending on processing, or not studied at all.

---

### 3. Plausible but Nonexistent Methods

**Example:**

**You ask:** "How do I characterize graphene dispersion in polymer matrix?"

**AI responds:** "Use nano-quantum-XPS (NQ-XPS), a technique that combines X-ray photoelectron spectroscopy with quantum dot labeling..."

**Problem:** "Nano-quantum-XPS" doesn't exist. AI combined:
- XPS (real technique)
- "Nano" (common prefix in nanomaterials)
- "Quantum" (sounds advanced)
- Made up a plausible description

---

### 4. Misattributed Discoveries

**Example:**

**You ask:** "Who discovered carbon nanotubes?"

**AI responds:** "Richard Smalley discovered carbon nanotubes in 1991 during his work on fullerenes."

**Problem:** 
- Smalley worked on fullerenes (different structure)
- Sumio Iijima is generally credited with CNT discovery (1991)
- AI confused related but distinct discoveries

---

### 5. Frankenstein Facts

**Combining true elements incorrectly.**

**Example:**

**You ask:** "What is the glass transition temperature of PEEK?"

**AI responds:** "PEEK has a glass transition temperature of 143°C and is commonly used in biomedical implants due to its biocompatibility and sterilization resistance."

**Analysis:**
- ✅ PEEK Tg ≈ 143°C (correct)
- ✅ Used in biomedical implants (correct)
- ❌ But: PLA is the common biocompatible polymer, not PEEK (confused)
- ❌ PEEK's advantage is high-temperature resistance, not primarily biocompatibility

**Half-truths are dangerous, look correct at first glance.**

---

## Why Scientists Are Vulnerable

### Hallucinations Exploit Domain Expertise

**The trap:** 
- AI uses correct terminology
- Follows proper scientific format
- Cites realistic journals
- Uses appropriate statistical language

**Result:** Your brain pattern-matches "this looks like a real paper" and trusts it.

**Defense:** Explicit verification protocols (covered below).

---

## The Engineering Fix: Grounding Techniques

You can't eliminate hallucinations (they're fundamental to how LLMs work), but you can **dramatically reduce them**.

### Technique 1: Explicit Constraint Instructions

**Without constraint:**
```
"What is the tensile strength of PLA/graphene composites?"
```

**AI:** Will generate a plausible number even if it doesn't know.

---

**With constraint:**
```
"Based ONLY on the attached papers, extract reported tensile strength 
values for PLA/graphene composites. If no value is reported, respond 
with 'Not reported in provided sources.' Do NOT estimate or use 
external knowledge."
```

**Result:** AI admits ignorance instead of guessing.

---

### Technique 2: RAG (Retrieval-Augmented Generation)

**The Problem:** AI's "knowledge" is frozen at training time (no updates, no access to your documents).

**The Solution:** RAG = Give AI access to specific documents, force it to cite them.

---

#### How RAG Works

**Step 1: Create a Document Database**
- Upload your papers, protocols, datasheets
- System creates embeddings for each chunk

**Step 2: Query-Time Retrieval**
- Your query is embedded
- System finds most relevant document chunks
- Only those chunks are provided to the LLM

**Step 3: Grounded Generation**
- AI generates response using ONLY the provided chunks
- Must cite which chunk each claim comes from

---

#### RAG Example

**Your question:** "What synthesis temperature did Zhang et al. use for PLA electrospinning?"

**Without RAG:** AI might fabricate "Zhang et al. used 25°C with 15kV voltage..."

**With RAG:**
1. System searches your document library for Zhang papers
2. Finds relevant section: "Electrospinning was performed at room temperature (23 ± 2°C)..."
3. AI responds: "According to Zhang et al. (Section 3.2), electrospinning was performed at 23 ± 2°C."

**Key difference:** Response is **grounded in actual text you provided**, not pattern-matched from training.

---

### Technique 3: Temperature Control

**"Temperature"** is a parameter controlling randomness in token selection.

**Low temperature (0.0-0.3):** Deterministic, chooses most probable token  
**High temperature (0.7-1.0):** Creative, explores less probable tokens

---

#### When to Use Each

**Technical/Scientific Tasks → Low Temperature (0.1-0.2)**
```
Task: Extract exact synthesis parameters
Temperature: 0.1
Result: Conservative, factual, less likely to hallucinate
```

**Creative Tasks → Higher Temperature (0.7-0.9)**
```
Task: Brainstorm novel synthesis approaches
Temperature: 0.8
Result: More creative, explores alternatives, more hallucination risk
```

---

#### Practical Example

**Prompt:** "What is the melting point of PLA?"

**Temperature 0.1 (deterministic):**
> "The melting point of PLA is approximately 150-160°C."

**Temperature 0.9 (creative):**
> "The melting point of PLA can range from 150-180°C depending on the molecular weight, stereoisomer content, and crystallinity of the specific formulation."

**Both accurate, but low temperature is more concise and certain.**

---

### Technique 4: Chain-of-Thought Prompting

**Force AI to "show its work"** — breaks reasoning into steps, catches errors earlier.

---

#### Without Chain-of-Thought

**Prompt:** "Is PLA/graphene suitable for aerospace applications?"

**Response:** "Yes, PLA/graphene composites offer excellent strength-to-weight ratios suitable for aerospace use."

**Problem:** Skipped critical issues (thermal stability, long-term degradation).

---

#### With Chain-of-Thought

**Prompt:** 
```
"Is PLA/graphene suitable for aerospace applications? 
Analyze step-by-step:
1. What are aerospace material requirements?
2. What are PLA/graphene properties?
3. Where do they match/mismatch?
4. Final assessment with caveats."
```

**Response:**
> "Step 1: Aerospace requires high strength-to-weight, thermal stability to 200°C+, long-term durability, low outgassing.
> 
> Step 2: PLA/graphene offers: Good strength-to-weight, thermal degradation ~320°C (pure PLA ~160°C Tm), biodegradable (not ideal for long-term), moderate outgassing.
> 
> Step 3: Matches: Lightweight, good mechanical properties. Mismatches: Thermal limits (Tm still ~160°C despite graphene), biodegradation undesirable, outgassing concerns.
> 
> Step 4: Assessment: NOT suitable for primary aerospace structures due to limited thermal stability and degradation. Possible for low-temp, short-term applications only."

**Result:** More nuanced, catches issues the quick answer missed.

---

### Technique 5: Multiple Verification Sources

**Never trust a single AI response for critical data.**

**Verification workflow:**

```
1. AI provides answer → 
2. Check CrossRef/Google Scholar for citations → 
3. Verify in authoritative source (handbook, database) → 
4. Cross-reference with colleague knowledge → 
5. If critical: Independent experiment/measurement
```

---

## Practical Grounding Checklist

Before trusting AI output, verify:

- [ ] **Citations are real** (DOI resolves, authors match)
- [ ] **Numbers are reasonable** (within known ranges for material)
- [ ] **Units are correct** (MPa not GPa, °C not K unless specified)
- [ ] **Methods exist** (no "nano-quantum-XPS" fabrications)
- [ ] **Logic is sound** (claims don't contradict each other)
- [ ] **Sources are primary** (not "studies show..." without citation)

---

## Red Flags: When to Be Extra Skeptical

🚩 **Suspiciously round numbers** (exactly 100°C, exactly 5.0 GPa)  
🚩 **Excessive precision** (87.34256°C when measurement precision is ±2°C)  
🚩 **Vague attributions** ("studies show", "research indicates" without citation)  
🚩 **Impossible combinations** (high modulus AND high ductility simultaneously)  
🚩 **Non-existent techniques** (quantum-resolution methods, nano-XPS variants)  
🚩 **Perfect results** (no uncertainties, no error bars, no caveats)

---

## Decision Framework: Trust vs. Verify

```
AI outputs → Categorize by risk

LOW RISK (General knowledge, published facts):
├─ Quick spot-check acceptable
└─ Example: "What is PLA?" → General polymer description

MEDIUM RISK (Specific claims, requires accuracy):
├─ Verify citations and key claims
└─ Example: "Properties of PLA/graphene" → Check sources

HIGH RISK (Critical decisions, safety, IP):
├─ Full verification required
├─ Cross-reference multiple sources
├─ Independent confirmation
└─ Example: "Synthesis conditions for patent" → Verify everything
```

---

## Why Grounding Techniques Work

**Hallucinations occur when:**
- AI fills gaps with probability-based guesses
- No source document constrains output
- Task requires precision beyond training patterns

**Grounding techniques work by:**
- ✅ Providing source documents (RAG)
- ✅ Explicitly forbidding guessing (constraint instructions)
- ✅ Reducing randomness (low temperature)
- ✅ Forcing step-by-step reasoning (chain-of-thought)
- ✅ Requiring citations (verification anchors)

**Result:** AI behavior shifts from "plausible pattern generation" toward "constrained information extraction."

---

## Real-World Example: Patent Prior Art Search

**Task:** Find papers that might conflict with your PLA/graphene synthesis patent.

---

### ❌ Dangerous Approach (High Hallucination Risk)

**Prompt:** "Find papers on PLA/graphene electrospinning"

**Problems:**
- May fabricate citations
- May miss real papers
- No way to verify completeness

---

### ✅ Safe Approach (Grounded)

**Step 1: RAG Setup**
```
Upload 50 papers from your literature database to RAG system
```

**Step 2: Constrained Query**
```
"Based ONLY on the uploaded papers, identify any that describe:
1. Electrospinning of PLA with graphene or graphene oxide
2. In-situ reduction methods during polymer processing
3. Synthesis parameters similar to [your conditions]

For each paper, cite:
- DOI
- Exact section where relevant method is described
- Page numbers

If no papers match, respond 'No matching papers in database.' 
Do NOT suggest papers not in the uploaded set."
```

**Step 3: Manual Verification**
```
For each paper AI identifies:
1. Open actual paper PDF
2. Verify cited section exists
3. Assess actual overlap degree
4. Document for legal team
```

**Result:** Trustworthy prior art search, no fabricated papers.

---

## Temperature Settings for Different Tasks

| Task Type | Temperature | Reasoning |
|-----------|------------|-----------|
| **Data extraction** | 0.0-0.1 | Need exact values, no creativity |
| **Citation lists** | 0.0-0.2 | Must be factual, no fabrication |
| **Technical summaries** | 0.2-0.4 | Factual but readable |
| **Brainstorming** | 0.7-0.9 | Want creative alternatives |
| **Creative writing** | 0.8-1.0 | Want diverse, novel outputs |
| **Safety-critical** | 0.0-0.1 | Conservative, no risks |

---

## The Honest AI Prompt Pattern

**Make AI admit when it doesn't know.**

**Template:**
```
[Task description]

Constraints:
- If information is not in provided sources, state "Not available in provided sources"
- If you are uncertain, state "Uncertain:" followed by your confidence level
- If multiple interpretations exist, state "Multiple interpretations:" and list them
- Do NOT estimate, approximate, or guess beyond provided information
- Do NOT use training data knowledge for this task
- Flag any assumptions you make

If you cannot complete this task with high confidence, explain why.
```

**Result:** AI produces "I don't know" responses instead of hallucinating.

---

## Quick Check: Do You Understand Hallucinations?

!!! question "Test Your Understanding"
    **1.** Why does AI fabricate citations?
    
    a) It's trying to deceive you  
    b) It generates plausible patterns even when specific fact doesn't exist  
    c) It has a faulty memory  
    d) It's been trained on fake papers
    
    **2.** What does RAG do?
    
    a) Makes AI smarter  
    b) Gives AI access to specific documents to ground responses  
    c) Eliminates all hallucinations  
    d) Speeds up processing
    
    **3.** When should you use low temperature (0.1)?
    
    a) Always  
    b) For creative brainstorming  
    c) For factual, data-extraction tasks  
    d) Never
    
    **4.** What is the most important defense against hallucinations?
    
    a) Using expensive models  
    b) Writing polite prompts  
    c) Verification protocols  
    d) Longer prompts
    
    **Answers:** 1-b, 2-b, 3-c, 4-c

---

## Summary: From Understanding to Prevention

**What you've learned:**

### Section 1: NLM Foundations
Words → Coordinates → Semantic space (the map)

### Section 2: LLM Scaling
Attention + Scale → Context understanding (navigating the map)

### Section 3: Hallucination Prevention
Probability ≠ Truth → Grounding techniques (keeping AI honest)

---

## The Core Principle

**AI is a brilliant pattern-matching engine that will confidently generate plausible text even when it doesn't know the answer.**

**Your responsibility:**
- Provide constraints to prevent guessing
- Use grounding techniques (RAG, low temperature)
- Verify critical outputs
- Apply domain expertise to catch errors

**With proper grounding, AI becomes a powerful tool. Without it, it's a liability.**

---

## Practical Takeaways for Materials Engineers

✅ **Never trust citations** without verification (use CrossRef)  
✅ **Use RAG** for document-based tasks (ground in your sources)  
✅ **Set low temperature** (0.1-0.2) for technical work  
✅ **Explicit constraints** prevent hallucinations ("If unknown, say 'unknown'")  
✅ **Chain-of-thought** catches reasoning errors  
✅ **Verify numbers** against handbooks and databases  
✅ **Apply domain expertise** — if it sounds wrong, it probably is

---

## Final Analogy: AI as an Intern

**Think of LLMs as a brilliant but occasionally dishonest intern:**

✅ **Very good at:** Pattern recognition, summarization, formatting, first-draft writing  
❌ **Very bad at:** Admitting ignorance, precise calculations, novel reasoning  
⚠️ **Dangerous when:** Filling knowledge gaps with confident-sounding guesses

**Your role:** Provide clear instructions, verify output, catch errors with your expertise.

**With proper supervision:** Incredibly productive tool  
**Without supervision:** Source of confident misinformation

---

## Action Items After This Session

1. **Test hallucination detection** in sandbox: Ask for citations on a niche topic, verify they're fake
2. **Practice constraint prompting**: Force AI to admit "not in source" instead of guessing
3. **Experiment with temperature**: Try same query at 0.1 and 0.9, compare outputs
4. **Verify your past AI interactions**: Check citations from previous queries

---

**Congratulations!** You now understand AI better than most of users. You know:

- How it works (words → coordinates → attention → probability)
- Why it fails (pattern matching, not truth seeking)
- How to fix it (grounding techniques, verification)

**Use this knowledge responsibly.** 🚀

---

**Next:** [Day 4 Overview](../day4/overview.md): Mastery & Responsibility →
