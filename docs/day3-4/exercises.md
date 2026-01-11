# Day 3-4 Exercises

Practice applying Green AI principles and optimisation strategies with real-world scenarios.

---

## Exercise 1: NLM vs LLM Decision Making

For each task below, decide the most appropriate tool and justify your choice.

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

**Estimated environmental impact of your choice vs. alternatives:** ___________

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

## Exercise 2: The Green Optimisation Challenge

**THE BIG CHALLENGE** from Day 3-4 Overview!

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

### Evaluation Criteria

| Criterion | Points | Your Score |
|-----------|--------|------------|
| **Functionality** (covers all topics) | 20 | ___ |
| **Efficiency** (query count reduction) | 30 | ___ |
| **Quality** (clarity of output) | 30 | ___ |
| **Innovation** (creative approach) | 20 | ___ |
| **TOTAL** | 100 | ___ |

---

### Test Your Solution

1. **Execute in sandbox** and time the interaction
2. **Compare output quality** to original chain (do you have same knowledge?)
3. **Calculate metrics:**
   - Actual queries used: ___
   - Estimated tokens: ___
   - Time taken: ___
   - Reduction vs. original: ___%

**Prize:** Team with highest score wins "Green AI Champion" badge!

---

## Exercise 3: Prompt Bloat Removal

The following prompt has significant bloat. Your task: **optimize it whilst maintaining functionality**.

### Original Prompt (Bloated)

```
Hi! I hope you're doing well today. I'm reaching out because I need 
some help with something related to my work. I'm a materials scientist 
at AmaDema - have you heard of us? We're a small company, about 15 
people, founded in 2018. We focus on advanced materials, specifically 
ceramics and polymer nanocomposites. It's pretty interesting work! 
Anyway, I've been working on this project for a while now, probably 
about 6 months or so, and we're trying to develop these new polymer 
nanofibers. They're made using a technique called electrospinning - 
not sure if you're familiar with that? It's where you use high voltage 
to create very thin fibers from a polymer solution. Pretty cool 
technology!

So here's what I need help with. I have this lab notebook entry from 
last Tuesday (or was it Wednesday? I think Tuesday) where I documented 
one of our synthesis experiments. The thing is, the notes are kind of 
informal - you know how it is when you're in the lab, you just jot 
things down quickly. But now my supervisor wants me to write it up 
properly for our internal documentation system. The format we use is 
based on ISO standards, I think ISO 9001 or maybe it was a different 
number? Anyway, it's pretty structured.

The lab notes include information about the materials I used - PLA 
(that's polylactic acid, in case you didn't know), some solvents (DMF 
and DCM), and graphene oxide as a nanofiller. I also wrote down the 
electrospinning parameters like voltage and distance, though I'm not 
sure if I recorded everything. Sometimes I forget to write down the 
humidity level in the lab, which can actually be important.

Could you maybe help me convert these informal notes into a proper 
structured protocol? I'm not sure exactly what sections I need to 
include, but typically we have Materials, Equipment, Procedure, and 
something about safety? Oh, and if there's information missing, could 
you let me know what I should add? That would be really helpful.

Here are the notes: [LAB NOTES WOULD BE PASTED HERE]

Thanks so much! I really appreciate your help with this. Let me know 
if you need any clarification on anything!
```

**Problems identified:**
1. ___________
2. ___________
3. ___________
4. ___________
5. ___________

---

### Your Optimised Version

**Rewrite using AUTOMAT framework:**

```
[YOUR OPTIMIZED PROMPT HERE]
```

**Metrics:**

| Metric | Original | Optimised | Reduction |
|--------|----------|-----------|-----------|
| Word count | 389 | ___ | __% |
| Estimated tokens | ~520 | ___ | __% |
| Irrelevant information | High | ___ | ___ |
| IP leakage risk | Medium | ___ | ___ |

---

## Exercise 4: Caching Strategy Design

### Scenario: Monthly Literature Review

**Current approach (inefficient):**

- Every month: Generate complete literature review on "PLA degradation kinetics"
- AI processes all papers found (typically 80-100)
- Most papers are repeats from previous months
- Takes 2-3 hours
- ~15,000 tokens per month

**Your task:** Design a caching strategy to optimize this workflow.

---

### Questions to Address

1. **Initial build:**
   - What should be cached from Month 1?
   - What format ensures easy updates?
   - What metadata should be included?

2. **Incremental updates:**
   - How do you identify only new papers?
   - What query retrieves only new information?
   - How do you integrate with existing cache?

3. **Maintenance:**
   - When should cache be regenerated completely?
   - How do you handle contradictory findings?
   - How do you track cache freshness?

---

### Your Caching Strategy

**Month 1 approach:**
```
[YOUR INITIAL QUERY AND CACHING METHOD]
```

**Month 2+ approach:**
```
[YOUR INCREMENTAL UPDATE QUERY]
```

**Expected savings:**
- Queries: ___ → ___ (__% reduction)
- Tokens: ___ → ___ (__% reduction)
- Time: ___ → ___ (__% reduction)

---

## Exercise 5: Template Creation

### Task

Create a reusable prompt template for a recurring task in your work.

**Requirements:**

1. Identify a task you perform >5 times/month
2. Create a template with `{VARIABLES}` for customisation
3. Document usage instructions
4. Test with 3 different examples

---

### Template Structure

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
```

---

### Usage Documentation

**Template name:** ___________

**Purpose:** ___________

**Variables to customize:**
- `{VARIABLE_1}`: ___________
- `{VARIABLE_2}`: ___________
- `{VARIABLE_3}`: ___________

**Example usage:**
```
[SHOW COMPLETED EXAMPLE WITH VARIABLES FILLED IN]
```

**Expected time savings:** ___________

---

## Exercise 6: Carbon Footprint Audit

### Personal AI Usage Assessment

**Week 1: Tracking**

Track your AI usage for one week:

| Day | Queries | Avg Tokens/Query | Total Tokens | Notes |
|-----|---------|------------------|--------------|-------|
| Mon | ___ | ___ | ___ | ___ |
| Tue | ___ | ___ | ___ | ___ |
| Wed | ___ | ___ | ___ | ___ |
| Thu | ___ | ___ | ___ | ___ |
| Fri | ___ | ___ | ___ | ___ |
| **Total** | ___ | ___ | ___ | ___ |

---

### Calculate Environmental Impact

**Annual projection:**
- Queries/year: ___ × 52 = ___
- Tokens/year: ___
- CO₂: Tokens × 0.005g = ___ g (___ kg)
- Water: Tokens × 0.1mL = ___ mL (___ L)

**Equivalent impact:**
- Driving: ___ km (at 150g CO₂/km)
- Plastic bottles: ___ (at 82g CO₂/bottle)

---

### Week 2: Optimization

**Identify 3 optimization opportunities:**

1. **Opportunity:** ___________  
   **Strategy:** ___________  
   **Expected savings:** ___%

2. **Opportunity:** ___________  
   **Strategy:** ___________  
   **Expected savings:** ___%

3. **Opportunity:** ___________  
   **Strategy:** ___________  
   **Expected savings:** ___%

---

**Implement optimizations** and re-track for one week:

**Week 2 metrics:**
- Queries/week: ___ (was: ___, reduction: __%)
- Tokens/week: ___ (was: ___, reduction: __%)
- CO₂ saved/year: ___ kg

---

## Exercise 7: Batch Processing Challenge

### Scenario

You have 20 synthesis protocols to format into standardized templates.

**Inefficient approach (baseline):**
```
20 separate queries, each: "Format this protocol into standard template"
```

**Your task:** Design an efficient batched approach.

---

### Approach A: Single Mega-Batch

**Prompt:**
```
[DESIGN YOUR BATCHED PROMPT FOR ALL 20 PROTOCOLS]
```

**Pros:**
- ___________
- ___________

**Cons:**
- ___________
- ___________

**Expected savings:** ___%

---

### Approach B: Hybrid Strategy

**If single batch doesn't work well, design hybrid:**

**Step 1:** ___________  
**Step 2:** ___________  
**Step 3:** ___________

**Rationale:** ___________

---

### Test and Compare

| Approach | Queries | Tokens | Time | Quality |
|----------|---------|--------|------|---------|
| Individual (baseline) | 20 | ~10,000 | 60 min | High |
| Single batch | ___ | ___ | ___ | ___ |
| Hybrid | ___ | ___ | ___ | ___ |

**Winner:** ___________  
**Justification:** ___________

---

## Exercise 8: RAG Feasibility Assessment

### Evaluate RAG for Your Use Case

**Your scenario:**

Describe a document-heavy recurring task:
___________

**Questions:**

1. **How many documents?** ___________
2. **How often queried?** ___________
3. **Are documents similar/standardized?** ___________
4. **How often updated?** ___________

---

### ROI Calculation

**Setup cost:**
- Time: ~4 hours
- Technical skill: Medium
- Initial token cost: ~5,000 tokens

**Ongoing benefit:**
- Queries saved per month: ___
- Tokens saved per month: ___
- Breakeven time: ___ months

**Recommendation:** 
- [ ] Implement RAG (high benefit)
- [ ] Consider later (medium benefit)
- [ ] Not worth it (low benefit)

**Justification:** ___________

---

## Exercise 9: Team Optimization Workshop

### Collaborative Challenge

**Setup:** Groups of 3-4 people

**Task:** Each person brings one inefficient AI workflow. Group collaboratively optimizes all workflows.

---

### Workflow Optimisation Template

**Person 1's workflow:**

**Current:**
- Task: ___________
- Queries: ___
- Time: ___
- Pain points: ___________

**Group's optimised approach:**
- Strategy used: ___________
- New query count: ___
- Expected time: ___
- Improvement: ___%

**Repeat for each group member**

---

### Group Presentation

**Best optimisation:** ___________

**Strategies used:**
1. ___________
2. ___________
3. ___________

**Total impact across group:**
- Combined query reduction: ___%
- Combined time savings: ___ hours/month
- Combined CO₂ reduction: ___ kg/year

---

## Bonus Exercise: The Extreme Optimisation Challenge

!!! danger "HARD MODE"
    **For advanced participants only**

### The Challenge

**Given:** The most bloated, inefficient AI workflow in the room

**Constraint:** Optimise to achieve >90% reduction in tokens

**Requirements:**
- Maintain output quality
- No compromise on accuracy
- Use any combination of strategies
- Document approach thoroughly

---

### Leaderboard

Team with highest % reduction wins:

| Team | Original Tokens | Optimised Tokens | Reduction % |
|------|----------------|------------------|-------------|
| ___ | ___ | ___ | ___ |
| ___ | ___ | ___ | ___ |
| ___ | ___ | ___ | ___ |

**Prize:** "Optimisation Master" badge + bragging rights

---

## Reflection Questions

After completing exercises, consider:

1. **Tool selection:** Did you choose the right tool (NLM vs LLM) for each task?
2. **Efficiency gains:** What was your average % improvement in token usage?
3. **Quality trade-offs:** Did any optimisations reduce output quality?
4. **Practical adoption:** Which strategies will you implement in daily work?
5. **Team impact:** How can your team collectively reduce environmental footprint?

---

## Workshop Debriefing

At the end of Day 3-4, we'll discuss:

- Most effective optimisation strategies
- Common challenges in implementation
- Real-world time savings achieved
- Environmental impact reduction
- Next steps for continuous improvement

---

## Action Plan

Based on exercises, create your personal optimisation action plan:

**This week:**
1. ___________
2. ___________
3. ___________

**This month:**
1. ___________
2. ___________
3. ___________

**This quarter:**
1. ___________
2. ___________
3. ___________

**Accountability:** Share plan with colleague for mutual support

---

**Next:** [Conversational Learning](../conversational/learning-partner.md) – Using AI as a learning partner →
