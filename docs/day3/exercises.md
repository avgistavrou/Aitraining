# Day 3 Exercises

Practice tool selection, environmental impact measurement, and green AI strategies.

---

## Exercise 1: NLM vs LLM Decision Making

For each task below, decide the most appropriate tool and justify your choice based on technical requirements and environmental impact.

### Task A: Patent Classification

```
Scenario: Classify 200 patents into 5 categories (polymers, ceramics, 
metals, composites, coatings) based on title and abstract.

Output needed: CSV file with columns [Patent Number, Category, 
Confidence Score]
```

**Your decision:**
- [ ] NLM (BERT-based classifier)
- [ ] Small LLM (Llama 8B)
- [ ] Large LLM (GPT-4)

**Justification:** ___________

**Environmental impact comparison:**

| Tool | Energy (kWh) | CO₂ (g) | Water (mL) | Time |
|------|--------------|---------|------------|------|
| NLM | ___ | ___ | ___ | ___ |
| Small LLM | ___ | ___ | ___ | ___ |
| Large LLM | ___ | ___ | ___ | ___ |

**Time:** 10 minutes

---

### Task B: Research Proposal Review

```
Scenario: Review 3-page research proposal for scientific merit, 
identify gaps in methodology, and provide strategic recommendations 
for improvement.

Output needed: 1-page review with scored rubric and narrative feedback
```

**Your decision:**
- [ ] NLM (BERT-based classifier)
- [ ] Small LLM (Llama 8B)
- [ ] Large LLM (GPT-4)

**Justification:** ___________

---

### Task C: Chemical Entity Extraction

```
Scenario: Extract all chemical compound names (with CAS numbers 
if mentioned) from 100 synthesis protocols.

Output needed: List of unique compounds with frequency count
```

**Your decision:**
- [ ] NLM (ChemBERT)
- [ ] Small LLM (Llama 8B)
- [ ] Large LLM (GPT-4)

**Justification:** ___________

---

### Task D: Strategic Competitive Analysis

```
Scenario: Analyse 15 competitor patents and 10 recent publications 
to identify gaps in market and recommend 3 strategic R&D directions 
for next 2 years.

Output needed: 3-page strategic memo for executive team
```

**Your decision:**
- [ ] NLM (BERT-based)
- [ ] Small LLM (Llama 8B)
- [ ] Medium LLM (Llama 70B)
- [ ] Large LLM (GPT-4)

**Justification:** ___________

---

### Task E: Document Screening

```
Scenario: Screen 500 papers to find those discussing "electrospinning" 
and "non-oxide ceramics". Create shortlist of relevant papers.

Output needed: CSV with [DOI, Relevance Score, Brief Note]
```

**Your decision:**
- [ ] NLM (SciBERT classifier)
- [ ] Small LLM (Llama 8B)
- [ ] Large LLM (GPT-4)

**Justification:** ___________

**Expected efficiency gain vs. using large LLM:** ___%

---

## Exercise 2: Carbon Footprint Calculation

### Part A: Track Your Usage

**Track AI usage for the past week (or estimate):**

| Day | Queries | Avg Tokens/Query | Total Tokens | Task Types |
|-----|---------|------------------|--------------|------------|
| Mon | ___ | ___ | ___ | ___ |
| Tue | ___ | ___ | ___ | ___ |
| Wed | ___ | ___ | ___ | ___ |
| Thu | ___ | ___ | ___ | ___ |
| Fri | ___ | ___ | ___ | ___ |
| **Total** | ___ | ___ | ___ | ___ |

---

### Part B: Calculate Impact

**Weekly footprint:**
- Queries: ___
- Tokens: ___
- CO₂: Tokens × 0.005g = ___ g
- Water: Tokens × 0.1mL = ___ mL

**Annual projection:**
- Queries/year: ___ × 52 = ___
- Tokens/year: ___ × 52 = ___
- CO₂: ___ g × 52 = ___ kg
- Water: ___ mL × 52 = ___ litres

**Contextualise your impact:**
- Equivalent driving: ___ kg CO₂ ÷ 0.15 kg/km = ___ km
- Equivalent to ___ London-Paris flights (250 kg CO₂ each)
- Percentage of UK average (5,500 kg CO₂/year): ___%

---

### Part C: Identify High-Impact Queries

**Review your past week. Identify:**

1. **Most token-intensive query:** ___________  
   **Could it be optimized?** ___________

2. **Most frequently repeated query type:** ___________  
   **Could you create a template?** ___________

3. **Query that could use NLM instead of LLM:** ___________  
   **Expected savings:** ___%

---

### Part D: Set Reduction Goals

**Based on your footprint, set realistic goals:**

**This month:**
- Target query reduction: ___%
- Target token reduction: ___%
- Strategies to implement:
  1. ___________
  2. ___________
  3. ___________

**Expected annual savings:**
- CO₂: ___ kg (___% reduction)
- Water: ___ litres (___% reduction)

**Time:** 20 minutes

---

## Exercise 3: The Green Optimization Challenge

**THE BIG CHALLENGE!**

### The Inefficient Chain

Your colleague wants to understand PLA/graphene electrospinning for a new project. They currently use this approach:

```
Query 1: "What is polylactic acid?"
Query 2: "What are the properties of PLA?"
Query 3: "What is graphene?"
Query 4: "What is graphene oxide?"
Query 5: "How do graphene and graphene oxide differ?"
Query 6: "What is electrospinning?"
Query 7: "How does electrospinning work for polymers?"
Query 8: "Can you add nanofillers during electrospinning?"
Query 9: "What are the challenges of dispersing graphene in PLA?"
Query 10: "What are typical electrospinning parameters for PLA?"
Query 11: "How does graphene content affect fiber properties?"
Query 12: "What are best practices for PLA/graphene electrospinning?"
```

**Current metrics:**
- Total queries: 12
- Estimated tokens: ~6,000
- Time: 15-20 minutes (with reading between queries)
- Water: ~300 mL
- CO₂: ~30 g

---

### Your Task

**Refactor into 1-2 optimised queries** that achieve the same learning outcome.

**Requirements:**

1. ✅ Cover all knowledge areas from original 12 queries
2. ✅ Appropriate for materials scientist audience
3. ✅ Structured output that's easy to reference
4. ✅ Use CO-STAR or AUTOMAT framework
5. ✅ Specify output format clearly

---

### Your Optimised Solution

**Query 1 (or only query):**
```
[WRITE YOUR OPTIMISED PROMPT HERE]
```

**Query 2 (if needed):**
```
[WRITE SECOND PROMPT IF NECESSARY]
```

---

### Test and Evaluate

1. **Execute in sandbox** and time the interaction
2. **Compare output quality** to original chain
3. **Calculate metrics:**

| Metric | Original | Optimised | Reduction |
|--------|----------|-----------|-----------|
| Queries | 12 | ___ | __% |
| Tokens | ~6,000 | ___ | __% |
| Time | 15-20 min | ___ min | __% |
| Water | 300 mL | ___ mL | __% |
| CO₂ | 30 g | ___ g | __% |

**Quality assessment:**
- [ ] Covers all original topics
- [ ] Output is well-structured
- [ ] Easy to reference later
- [ ] Suitable for materials scientist

**Time:** 25 minutes

---

## Exercise 4: Provider Comparison

### Scenario

You need to process 1,000 literature reviews per year. Compare environmental impact across providers.

### Provider Options

| Provider | Model | Renewable Energy % | Water Intensity | Carbon Intensity |
|----------|-------|-------------------|----------------|------------------|
| Google (Gemini) | Gemini Pro | 64% | Medium | Low |
| Microsoft (Copilot) | GPT-4 | 70% | Medium | Low |
| OpenAI (ChatGPT) | GPT-4 | 70% (via Azure) | Medium | Low |
| Local (Sandbox) | Llama 3.2 3B | Depends on your grid | Very Low | Depends |

**Your local grid (UK average):** ~30% renewable

---

### Calculate Impact

**Assumptions:**
- Each review: ~2,000 tokens
- Annual tokens: 2,000 × 1,000 = 2,000,000

**Cloud provider (70% renewable):**
- CO₂: 2,000,000 × 0.005g × 0.3 (fossil fuel portion) = 3,000 g = 3 kg
- Water: 2,000,000 × 0.1mL = 200,000 mL = 200 L

**Local (UK grid, 30% renewable, smaller model):**
- CO₂: 2,000,000 × 0.001g (smaller model) × 0.7 (fossil fuel portion) = 1,400 g = 1.4 kg
- Water: Minimal (personal device cooling)

---

### Your Decision

**Best provider for this use case:** ___________

**Justification:** ___________

**Expected annual savings vs. worst option:** ___________

**Time:** 10 minutes

---

## Exercise 5: Batch Processing Design

### Scenario

You have 20 synthesis protocols to format into standardized templates.

**Inefficient approach (baseline):**
```
20 separate queries: "Format this protocol into standard template"
- Queries: 20
- Tokens: ~10,000
- Time: 60 minutes
```

---

### Design Batched Approach

**Your batched prompt:**
```
[DESIGN YOUR PROMPT TO HANDLE ALL 20 PROTOCOLS AT ONCE]
```

**Expected metrics:**
- Queries: ___
- Tokens: ___
- Time: ___
- Reduction: ___%

---

### Test Your Approach

**Potential issues:**
- Context window limits?
- Quality degradation?
- Error handling?

**Your mitigation strategies:**
1. ___________
2. ___________
3. ___________

**Time:** 15 minutes

---

## Exercise 6: Template Creation

### Task

Create a reusable prompt template for a task you perform >5 times/month.

**Template name:** ___________

**Task description:** ___________

**Frequency:** ___ times/month

---

### Your Template

```
[PERSONA]
Act as {ROLE} with expertise in {DOMAIN}.

[AUDIENCE]
Audience: {TARGET_AUDIENCE}

[TASK]
Task: {SPECIFIC_TASK}

[OUTPUT]
Output format:
{FORMAT_SPECIFICATION}

[METHOD]
Method: {APPROACH}

[CONSTRAINTS]
Constraints:
- {CONSTRAINT_1}
- {CONSTRAINT_2}
- {CONSTRAINT_3}

[TONE]
Tone: {TONE}

[INPUT]
{DATA_PLACEHOLDER}
```

---

### Usage Example

**Fill in variables for one actual use case:**

```
[SHOW YOUR TEMPLATE WITH REAL VALUES]
```

---

### Impact Calculation

**Before template (writing custom prompt each time):**
- Time per prompt: ___ minutes
- Queries per use: ___
- Monthly time: ___ minutes

**After template (fill-in-blanks):**
- Time per prompt: ___ minutes
- Queries per use: ___
- Monthly time: ___ minutes

**Savings:**
- Time saved: ___ minutes/month
- Token savings: ___%
- CO₂ saved: ___ g/month

**Time:** 20 minutes

---

## Reflection Questions

After completing exercises, consider:

1. **Tool Selection:** How many tasks could use lighter-weight tools (NLMs instead of LLMs)?
2. **Footprint Awareness:** Were you surprised by your carbon/water footprint?
3. **Optimization Potential:** What's your realistic reduction target?
4. **Practical Adoption:** Which strategies will you implement immediately?
5. **Team Impact:** How can your team collectively reduce footprint?

---

## Action Plan

Based on exercises, create your personal green AI action plan:

**This week:**
1. ___________
2. ___________
3. ___________

**This month:**
1. ___________
2. ___________
3. ___________

**Accountability:** Share plan with a colleague for mutual support

---

**Next:** [Day 4 Overview](../day4/overview.md) – Advanced Optimization & Ethics →
