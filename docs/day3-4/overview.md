# Day 3-4 Overview: Technical Architecture & Sustainability

## Session Goals

Understand the **engine room** of AI technologies to promote sustainable and efficient usage.

By the end of these sessions, you will:

- ✅ Distinguish between **NLMs and LLMs** and choose appropriate tools
- ✅ Implement **Green AI** practices to minimise environmental impact
- ✅ Apply **optimisation strategies** for efficient prompt design
- ✅ Measure and reduce the **carbon footprint** of your AI workflows

---

## The Flamethrower Analogy

Large Language Models are **computational flamethrowers**—powerful, impressive, but energy-intensive.

### The Problem

**Scenario:** You need to light a candle.

**Options:**

1. **Use a lighter** (efficient, appropriate tool)
2. **Use a flamethrower** (massive overkill, wasteful, dangerous)

**Current behaviour:** Many users deploy LLMs (flamethrowers) for tasks that could be handled by simpler models (lighters).

---

## Why This Matters

### Environmental Cost

**Training GPT-3:**
- 🔥 Produced **85,000 kg of CO₂**
- 🚗 Equivalent to **112 cars running for a year**

**But training is one-time.** The bigger problem: **inference** (when you use the model).

**ChatGPT usage:**
- 💧 Consumes **~0.5 litres of fresh water** per 20-50 prompts
- ⚡ Inference emissions can **exceed training emissions within weeks** of deployment

**Data centres:**
- ~40% of energy goes to **cooling**
- 2/3 of new US data centres (since 2022) are in areas experiencing **water scarcity**

### Your Role

**Every user interaction requires computational resources.**

You, the user, play a role in this consumption. Responsible AI use includes environmental responsibility.

---

## Session Structure

### Part 1: Understanding the Architecture (45 minutes)

1. **NLMs vs LLMs** – What's the difference and when to use each
2. **Model sizes** – 8B vs 70B vs 405B parameters
3. **Context windows** – Computational cost implications
4. **Token economics** – Understanding usage and efficiency

### Part 2: Green AI Practices (45 minutes)

1. **Measuring carbon footprint** of AI queries
2. **Optimisation strategies** – Reduce usage without sacrificing quality
3. **Distillation** – Using large models to train small ones
4. **Quantization** – Running models at lower precision
5. **Caching** – Reusing outputs intelligently

---

## Key Concepts

### NLMs (Natural Language Models)

**Small, efficient models** for specific tasks:

- Keyword extraction
- Classification
- Named entity recognition
- Simple Q&A

**Examples:** BERT, RoBERTa, DistilBERT

**Analogy:** The lighter—efficient for specific tasks.

---

### LLMs (Large Language Models)

**Large, powerful models** for complex reasoning:

- Creative writing
- Complex analysis
- Code generation
- Multi-step reasoning

**Examples:** GPT-4, Claude, Llama 3.3

**Analogy:** The flamethrower—powerful but energy-intensive.

---

## The Decision Framework

```
What's your task?

├─ Simple, repetitive, keyword-based?
│   └─> Use NLM (BERT-based models)
│       - Keyword filtering in papers
│       - Classifying documents
│       - Extracting specific entities
│
└─ Complex, creative, reasoning-required?
    └─> Use LLM (GPT, Claude, Llama)
        - Literature synthesis with interpretation
        - Novel protocol generation
        - Strategic analysis
```

---

## Green AI Principles

### 1. Reduce Usage

**Strategies:**

- ✅ Batch similar queries together
- ✅ Use AI for **high-value tasks**, not trivial ones
- ✅ Cache and reuse outputs when possible
- ✅ Think before you prompt—plan your query

**Bad practice:**
```
[Query 1] "What is PLA?"
[Query 2] "What is graphene?"
[Query 3] "What are nanocomposites?"
[Query 4] "How do you combine PLA and graphene?"
```
**4 queries, massive redundancy**

**Good practice:**
```
[Query 1] "Explain PLA/graphene nanocomposites including: 
definitions, synthesis methods, and key properties. 
Assume audience has materials science background."
```
**1 query, same information**

---

### 2. Choose Efficiently

**Strategies:**

- ✅ Consider computational cost of requests
- ✅ Avoid unnecessary regeneration of content
- ✅ Choose **smaller models** when appropriate (Llama 8B vs 70B)
- ✅ Select providers committed to **renewable energy**

**Model size comparison:**

| Model | Parameters | Inference Speed | Energy per Query | Best For |
|-------|------------|-----------------|------------------|----------|
| Llama 3.3 8B | 8 billion | Fast | Low | Routine tasks |
| Llama 3.3 70B | 70 billion | Medium | Medium | Complex analysis |
| GPT-4 | ~1.76 trillion | Slow | High | Critical reasoning |

**Rule:** Use the **smallest model that achieves your quality threshold**.

---

### 3. Acknowledge the Option

**It's acceptable to choose not to use LLMs** based on ethical and environmental factors.

There is still value in:
- Understanding how they work
- Knowing how they might be used by others
- Making informed decisions about adoption

**Not using AI is a valid, principled choice.**

---

## Optimisation Strategies Preview

### Strategy 1: Prompt Batching

**Before:** 5 separate queries (5× computational cost)  
**After:** 1 batched query (1× computational cost)

**Savings:** 80% reduction in energy/water usage

---

### Strategy 2: Caching Outputs

**Scenario:** Monthly literature review on "PLA degradation kinetics"

**Bad practice:** Generate new summary every month  
**Good practice:** Cache previous summary, only process new papers

**Savings:** 70-90% reduction for recurring tasks

---

### Strategy 3: Template Reuse

**Scenario:** Formatting 20 synthesis protocols

**Bad practice:** Write new prompt for each protocol  
**Good practice:** Create one perfect prompt, reuse 20 times

**Savings:** Reduces token usage and time

---

### Strategy 4: Model Distillation

**Concept:** Use a large model (GPT-4) to train a small, task-specific model

**Process:**
1. Generate 1000 training examples with large model
2. Fine-tune small model (Llama 8B) on these examples
3. Use small model for routine tasks

**Savings:** 10-100× reduction in inference cost for recurring tasks

---

## Real-World Impact

### Scenario: AmaDema's Weekly Literature Review

**Current approach (inefficient):**

- Team member uses ChatGPT to summarise 20 papers
- Each paper: 3-5 prompts (refinement iterations)
- Total: ~80 prompts/week
- Annual: ~4,160 prompts
- **Carbon footprint:** ~104 litres of water, ~42 kg CO₂

**Optimised approach:**

- Create one perfect AUTOMAT prompt
- Batch all 20 papers in single query
- Cache results, only process new papers weekly
- Total: ~5 prompts/week
- Annual: ~260 prompts
- **Carbon footprint:** ~6.5 litres of water, ~2.6 kg CO₂

**Savings:** 94% reduction in environmental impact, same quality output

---

## Learning Outcomes

### Technical Understanding

- [x] **Distinguish NLM vs LLM** architectures
- [x] **Calculate token usage** for different query types
- [x] **Estimate carbon footprint** of AI workflows
- [x] **Select appropriate model size** for tasks

### Practical Skills

- [x] **Batch queries** effectively
- [x] **Cache and reuse** outputs
- [x] **Refactor prompt chains** for efficiency
- [x] **Implement Green AI** practices in daily work

### Strategic Awareness

- [x] **Recognise environmental cost** of AI
- [x] **Make informed decisions** about AI adoption
- [x] **Advocate for sustainable** AI practices in your team
- [x] **Balance utility with responsibility**

---

## The Green Optimisation Challenge

In Part 2, you'll participate in the **Green Optimisation Challenge**:

### The Challenge

**Given:** A colleague's inefficient prompt chain (8-12 queries)

**Your task:** Refactor it into the minimum number of queries whilst maintaining output quality

**Scoring:**
- ✅ Functionality (does it work?)
- ✅ Efficiency (how many queries?)
- ✅ Quality (output comparable to original?)

**Prize:** "Green AI Champion" badge for most efficient solution

---

## Session Pre-Work

Before Day 3, please:

1. ✅ Review your own AI usage patterns (how many queries/day?)
2. ✅ Identify recurring tasks that could be cached/templated
3. ✅ Bring examples of prompt chains you'd like to optimise
4. ✅ Consider: "Am I using a flamethrower to light a candle?"

---

## Success Metrics

By the end of Day 3-4, you will demonstrate:

1. **Tool selection** – Choose NLM vs LLM appropriately
2. **Query optimisation** – Reduce token usage by >50% vs original
3. **Caching strategy** – Identify reusable outputs in your workflows
4. **Impact measurement** – Calculate carbon savings from optimisation

---

**Ready to begin?** Start with [NLMs vs LLMs](nlms-vs-llms.md) →
