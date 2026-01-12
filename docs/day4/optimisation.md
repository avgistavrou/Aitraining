# Optimisation Strategies

Practical techniques to reduce token usage, improve response quality, and minimise environmental impact whilst maintaining or improving output quality.

---

## The Optimisation Hierarchy

```
Level 1: Query Planning
├─ Think before prompting
├─ Define clear objectives
└─ Batch related questions

Level 2: Prompt Engineering
├─ Use frameworks (AUTOMAT/CO-STAR)
├─ Specify output format upfront
└─ Add constraints to reduce iterations

Level 3: Caching & Reuse
├─ Save successful prompts as templates
├─ Cache outputs for incremental updates
└─ Build knowledge base

Level 4: Tool Selection
├─ Use NLMs for simple tasks
├─ Use smallest LLM that meets quality threshold
└─ Implement local models for repetitive work

Level 5: Advanced Techniques
├─ Fine-tuning for domain-specific tasks
├─ Quantization for faster inference
└─ RAG (Retrieval Augmented Generation)
```

---

## Strategy 1: The One-Shot Principle

**Goal:** Get the right output on the **first attempt**.

### The Problem: Iterative Refinement

Typical inefficient workflow:

```
[Attempt 1] "Summarise this paper"
→ Too generic

[Attempt 2] "Make it more technical"
→ Wrong focus

[Attempt 3] "Focus on synthesis methods"
→ Missing quantitative data

[Attempt 4] "Include temperatures and pressures"
→ Finally acceptable
```

**Cost:** 4× the tokens, time, and environmental impact

---

### The Solution: Comprehensive Upfront Specification

```
[Single Attempt] Using AUTOMAT:

Act as a Materials Science Technical Reviewer.

Task: Summarise synthesis methodology from the attached paper.

Output: Structured summary with sections:
1. Synthesis method (brief description)
2. Key parameters (table: parameter, value, units)
3. Novel aspects (bullet points)
4. Reproducibility assessment (high/medium/low + justification)

Constraints:
- Extract only explicitly stated values (no estimation)
- Focus on sections 2-3 of paper (synthesis and characterisation)
- Ignore theoretical calculations in section 4
- Flag any ambiguous or missing critical parameters

Tone: Technical, objective, suitable for replication assessment
```

**Result:** First attempt yields production-ready output

**Savings:** 75% reduction in tokens and time

---

## Strategy 2: Strategic Context Pruning

**Goal:** Include only **relevant** context, not everything.

### The Problem: Context Overload

```
[Bloated Context]
"I'm a materials scientist at AmaDema, a company founded in 2018 
by Dr. Smith and Dr. Jones, specialising in advanced ceramics and 
polymer nanocomposites. We have 15 employees across R&D, production, 
and sales. Our main products are electrospun nanofibers for 
aerospace and biomedical applications. We're currently working on a 
project funded by an EPSRC grant (£450k over 3 years) to develop 
sustainable alternatives to PLA. My role is Senior Researcher 
focusing on synthesis optimisation. I've been here for 2 years after 
completing my PhD at Bristol on graphene functionalisation. 
Currently, we're in month 14 of the project and need to demonstrate 
proof-of-concept by month 18 for the next review. 

Could you help me format this synthesis protocol?"
```

**Problems:**
- 90% of context irrelevant to task
- Increased token cost
- Potential information leakage (company details)

---

### The Solution: Task-Relevant Context Only

```
[Optimised Context]
"Act as a Laboratory Documentation Specialist.

Context: Converting informal lab notes to standardised synthesis 
protocol format for materials science publication.

Task: Format the following lab notes according to standard 
structure (Materials, Equipment, Procedure, Characterisation).

[LAB NOTES]"
```

**Savings:** 80% reduction in tokens, eliminated IP leakage risk

---

## Strategy 3: Structured Output Specification

**Goal:** Reduce back-and-forth by defining exact format upfront.

### The Problem: Format Mismatches

```
[Vague Request]
"Extract synthesis parameters from these 10 papers"

[Output]
Long prose paragraphs mixing papers, inconsistent parameter mentions, 
difficult to compare...

[Follow-up]
"Can you put that in a table?"

[Follow-up 2]
"Can you add the DOI column?"

[Follow-up 3]
"Can you sort by temperature?"
```

**Total:** 4 queries to get usable output

---

### The Solution: Specify Format Exactly

```
[Structured Request]
"Extract synthesis parameters from these 10 papers.

Output: Markdown table with columns:
- Paper (Author Year)
- DOI
- Polymer
- Nanofiller
- Nanofiller Loading (wt%)
- Synthesis Method
- Key Temperature (°C)
- Solvent System

Sort by: Temperature (ascending)

If parameter not reported: mark 'NR'
If ambiguous: mark 'Ambiguous [brief note]'"
```

**Result:** Single query yields ready-to-use table

**Savings:** 75% reduction in iterations

---

## Strategy 4: Constraint Engineering

**Goal:** Prevent hallucinations and irrelevant content through explicit constraints.

### Effective Constraints

#### Whitelisting (What to Include)

```
Constraints:
- Focus exclusively on peer-reviewed journal articles
- Only papers published 2020-2024
- Only electrospinning-based synthesis methods
- Must explicitly report mechanical properties
```

---

#### Blacklisting (What to Exclude)

```
Constraints:
- Exclude review papers and book chapters
- Exclude theoretical/computational studies
- Exclude patents and conference proceedings
- Ignore papers on melt-spinning or solution casting
```

---

#### Handling Uncertainty

```
Constraints:
- If data is missing, mark as "Not reported"—do not estimate
- If multiple values given, report as range
- If conflicting values across papers, flag discrepancy
- Do not extrapolate from related materials
```

---

## Strategy 5: Prompt Chaining with Checkpoints

**Goal:** Break complex tasks into steps with validation.

### When to Use

✅ Complex multi-step analysis  
✅ Tasks requiring intermediate validation  
✅ High-stakes outputs needing verification

### Example: Patent Prior Art Search

#### Step 1: Broad Identification

```
Prompt 1: "Review these 50 patents and identify those claiming 
electrospinning-based synthesis of polymer/graphene composites. 
Output: List of patent numbers that meet criteria."
```

**→ Human checkpoint:** Verify list before proceeding

---

#### Step 2: Detailed Extraction

```
Prompt 2: "For the following 12 patents [list from Step 1], extract:
- Claims related to synthesis method
- Graphene content ranges
- Processing temperatures
- Novelty statements

Output: Comparative table"
```

**→ Human checkpoint:** Verify accuracy of extracted data

---

#### Step 3: Overlap Analysis

```
Prompt 3: "Compare these 12 patents against our method [description]. 
For each patent, assess overlap: High/Medium/Low/None. Justify 
assessment."
```

**→ Human checkpoint:** Review before legal submission

---

**Why better than single query:**
- Intermediate validation catches errors early
- Each step can be cached and reused
- Easier to debug if issues arise
- Human expertise applied at critical junctions

---

## Strategy 6: Templating for Recurring Tasks

**Goal:** Create reusable, proven prompts for common tasks.

### Template Library

#### Template 1: Literature Summary

```
Act as a {DOMAIN} Specialist reviewing literature for {PURPOSE}.

Task: Summarise key findings from the following paper relevant to 
{SPECIFIC_FOCUS}.

Paper: {TITLE}, {DOI}

Output format:
1. Main finding (1 sentence)
2. Methodology (brief, 2-3 sentences)
3. Key quantitative results (table if >3 values, else bullets)
4. Limitations/caveats (bullets)
5. Relevance to {SPECIFIC_FOCUS} (1-2 sentences)

Constraints:
- Extract only explicitly stated results
- If methodology unclear, note as limitation
- Do not compare to other papers

Tone: {TONE}
```

**Usage:** Replace `{VARIABLES}` each time, consistent quality

---

#### Template 2: Experimental Design Brainstorming

```
Act as a Senior {DOMAIN} Researcher with expertise in {SUBFIELD}.

Context: We are experiencing {PROBLEM_DESCRIPTION} in our current 
{PROCESS}. Existing approaches have limitations: {LIMITATIONS}.

Task: Propose 5 alternative experimental approaches to address this 
problem.

For each approach, provide:
1. Brief description (2-3 sentences)
2. Expected advantages (bullets)
3. Potential challenges (bullets)
4. Resource requirements (equipment, materials, time)
5. Risk level (High/Medium/Low)

Constraints:
- Focus on approaches feasible with {AVAILABLE_EQUIPMENT}
- Stay within {BUDGET_CONSTRAINT}
- Exclude approaches requiring >6 months development
- Prioritise approaches with literature precedent

Output: Numbered list, sorted by risk level (Low to High)
```

---

### Building Your Template Library

1. **Identify recurring tasks** in your workflow
2. **Perfect the prompt** through iteration (once)
3. **Generalise by adding variables** `{PLACEHOLDER}`
4. **Document the template** with usage notes
5. **Share with team** for collective efficiency

---

## Strategy 7: Caching and Incremental Updates

**Goal:** Never regenerate what you've already processed.

### Implementation

#### Month 1: Initial Build

```
Task: Comprehensive literature review of PLA/graphene electrospinning 
(100 papers, 2015-2024)

Output: Detailed database with synthesis parameters, properties, 
methods

[Save output as: PLA_Graphene_Database_2024-01.md]
```

---

#### Month 2: Incremental Update

```
Task: Update PLA/graphene database with papers published since 
2024-01-31

New papers: [5 DOIs]

Instructions:
1. Process only the 5 new papers
2. Use same format as existing database
3. Flag any contradictions with existing entries
4. Output only the new entries (I will append manually)
```

**Savings:** 95% reduction in computational cost (5 vs 105 papers)

---

### Caching Best Practices

✅ **Use consistent formatting** (easy to append)  
✅ **Include timestamps** (track what's current)  
✅ **Version control** (track changes over time)  
✅ **Tag by topic** (reuse across projects)  
✅ **Document sources** (verify when needed)

---

## Strategy 8: Query Batching

**Goal:** Process multiple items in single query to reduce overhead.

### Example: SEM Image Analysis

#### Inefficient (Individual Processing)

```
[Query 1] "Analyse SEM image 1: measure average fiber diameter"
[Query 2] "Analyse SEM image 2: measure average fiber diameter"
[Query 3] "Analyse SEM image 3: measure average fiber diameter"
...
[Query 10] "Analyse SEM image 10: measure average fiber diameter"
```

**Cost:** 10 queries, high overhead per query

---

#### Efficient (Batched Processing)

```
[Single Query] "Analyse the following 10 SEM images of electrospun 
fibers. For each:
- Measure average fiber diameter (from 20 random fibers)
- Calculate standard deviation
- Assess fiber uniformity (CV%)
- Note any defects (beads, fusion points)

Output: Table with columns [Image ID, Avg Diameter (nm), SD, CV%, 
Defects (Y/N), Notes]

Images: [Attach all 10]"
```

**Cost:** 1 query, 70% less overhead

**Savings:** ~40% total reduction in tokens

---

## Strategy 9: Local Model Fine-Tuning

**Goal:** Train domain-specific models for highly repetitive tasks.

### When to Consider

✅ Task performed >1000 times/year  
✅ Task is highly standardised  
✅ Quality threshold well-defined  
✅ Training data available or easy to generate

### Process

#### Step 1: Generate Training Data

Use large model (GPT-4) to create 500-1000 example inputs/outputs:

```
Prompt: "Generate 50 diverse examples of synthesis protocol 
formatting tasks. For each:
- Input: Informal lab notes (varied styles)
- Output: Standardised ISO format protocol

Ensure diversity in: polymer types, synthesis methods, level of 
detail in notes"
```

**Cost:** High upfront (500-1000 examples)

---

#### Step 2: Fine-Tune Small Model

Use examples to fine-tune Llama 8B on this specific task:

```bash
# Technical implementation (simplified)
python fine_tune.py \
  --model llama-3.3-8b \
  --task protocol_formatting \
  --examples training_data.json \
  --epochs 3
```

**Time:** ~2-4 hours on GPU

---

#### Step 3: Deploy

Use fine-tuned model for all future protocol formatting:

**Per-query cost:**
- Original (GPT-4): ~$0.03, ~50g CO₂
- Fine-tuned (Llama 8B local): ~$0.001, ~2g CO₂

**Breakeven:** After ~1000 uses (typical: 3-6 months)

**Annual savings (2000 uses):** 
- $56 cost savings
- 96 kg CO₂ reduction

---

## Strategy 10: Retrieval-Augmented Generation (RAG)

**Goal:** Give AI access to your specific documents without retraining.

### What is RAG?

**Traditional approach:** AI relies only on training data  
**RAG approach:** AI retrieves relevant chunks from your documents, then generates response

### Materials Science Use Case

**Scenario:** You have 500 internal synthesis protocols, want AI to answer questions about them

---

#### Without RAG (Inefficient)

```
Option A: Include all 500 protocols in prompt
Problem: Exceeds context window, massive token cost

Option B: Manually find relevant protocols, include in prompt
Problem: Time-consuming, error-prone
```

---

#### With RAG (Efficient)

```
[Setup once]
1. Upload 500 protocols to vector database
2. Each protocol is embedded (numerical representation)

[Each query]
1. Your question is embedded
2. System finds 3-5 most relevant protocols automatically
3. Only those protocols included in prompt to AI
4. AI generates response using only relevant context
```

**Benefits:**
- Automatic retrieval (no manual searching)
- Token-efficient (only relevant docs)
- Always up-to-date (add new protocols anytime)
- Works with unlimited document libraries

---

### Simple RAG Implementation

**Tools:**
- **LlamaIndex** or **LangChain** (Python frameworks)
- **ChromaDB** or **FAISS** (vector databases)
- **Ollama** (local LLM)

**Implementation time:** 2-4 hours initial setup

**Payoff:** Ongoing efficiency for document-heavy workflows

---

## Real-World Optimization: Before & After

### Case Study: Quarterly Competitive Analysis

#### Before Training

**Task:** Analyse 50 competitor patents for quarterly R&D strategy meeting

**Approach:**
1. Read each patent manually
2. Ask AI for clarification on unclear sections (ad hoc queries)
3. Summarise findings in Word document
4. Ask AI to polish document

**Time:** 20 hours  
**Queries:** ~100  
**Tokens:** ~50,000  
**Environmental cost:** 2.5 L water, 250g CO₂

---

#### After Training

**Approach:**

**Step 1: Batch classification** (NLM)
```
Use BERT to classify 50 patents by technology area
→ Result: 12 relevant to our focus areas
→ 5 minutes, negligible environmental cost
```

**Step 2: Structured extraction** (AUTOMAT + LLM)
```
Single batched query extracting synthesis methods, claims, novelty 
from 12 relevant patents
→ Result: Structured comparison table
→ 1 query, ~15 minutes
```

**Step 3: Strategic analysis** (CO-STAR + LLM)
```
Single query generating competitive gap analysis and recommendations 
based on extracted data
→ Result: Executive summary with strategic insights
→ 1 query, ~10 minutes
```

**Step 4: Cache for next quarter**
```
Save structured data, only process new patents next quarter
```

---

**Time:** 4 hours (80% reduction)  
**Queries:** ~5 (95% reduction)  
**Tokens:** ~5,000 (90% reduction)  
**Environmental cost:** 0.25 L water, 25g CO₂ (90% reduction)  
**Quality:** Higher (more structured, comprehensive)

---

## Optimization Checklist

Before submitting any AI query, verify:

- [ ] **Objective clear?** (What exactly do I need?)
- [ ] **Output format specified?** (Table, bullets, code, etc.)
- [ ] **Constraints defined?** (What to include/exclude?)
- [ ] **Could I batch this?** (Process multiple items together?)
- [ ] **Can I reuse existing output?** (Check cache first?)
- [ ] **Right model size?** (Smallest that meets quality threshold?)
- [ ] **Could NLM handle this?** (Simple extraction/classification?)
- [ ] **Have I used a template?** (For recurring tasks?)

**Goal:** Answer "yes" to ≥6 of these before hitting enter

---

## Exercise: Optimize Your Own Workflow

!!! question "Challenge"
    
    **Step 1:** Identify one recurring AI task in your work
    
    **Step 2:** Document your current approach:
    - How many queries per instance?
    - How long does it take?
    - What's the output quality?
    
    **Step 3:** Apply 3 optimization strategies from this page
    
    **Step 4:** Test optimised approach in sandbox
    
    **Step 5:** Calculate improvements:
    - % reduction in queries
    - % reduction in time
    - % reduction in tokens
    - Change in quality (better/same/worse)
    
    **Share your results** with workshop group

---

**Next:** [Day 3-4 Exercises](exercises.md) – Practice optimization techniques →
