# Prompt Engineering Cheat Sheet

Quick reference guide for crafting effective prompts.

---

## AUTOMAT Framework

| Component | What to Include | Example |
|-----------|----------------|---------|
| **A**udience | Who will use this output? | R&D team, IP legal, management |
| **U**ser Persona | AI's role/expertise | "Act as Senior Polymer Chemist" |
| **T**ask | Specific action required | Extract synthesis parameters, format protocol |
| **O**utput | Format and structure | Markdown table, JSON, bullet points |
| **M**ethod | Approach/methodology | ISO standards, systematic review |
| **A**ssumptions | Constraints, boundaries | Exclude pre-2020, focus on non-oxide ceramics |
| **T**one | Voice and style | Technical, formal, conversational |

**Best for:** Functional, structured tasks with clear outputs

---

## CO-STAR Framework

| Component | What to Include | Example |
|-----------|----------------|---------|
| **C**ontext | Background and situation | Market position, project goals, constraints |
| **O**bjective | Goal to achieve | Secure funding, convince stakeholders |
| **S**tyle | Writing approach | Academic, journalistic, executive |
| **T**one | Emotional quality | Confident, cautious, inspirational |
| **A**udience | Who will read this | VC investors, peer reviewers, management |
| **R**esponse | Output format/structure | 2-page memo, 5 sections, bullet points |

**Best for:** Narrative, strategic documents requiring rich context

---

## Quick Decision: Which Framework?

```
Is your task...

FUNCTIONAL & STRUCTURED?          |  NARRATIVE & STRATEGIC?
(data extraction, formatting,     |  (reports, summaries, pitches,
code generation, classification)  |  strategic analysis, proposals)
           ↓                       |              ↓
     USE AUTOMAT                  |        USE CO-STAR
```

---

## The Red List – Never Share

### 🚫 Unpublished Research
- Novel molecular structures
- Exact synthesis parameters
- Experimental results (ongoing)
- Failed experiments (negative data)
- Grant applications under review

### 🚫 Commercial Sensitive
- Exact formulations and ratios
- Proprietary process conditions
- Yield data revealing efficiency
- Cost breakdowns
- Customer/partner identities
- Pricing strategies

### 🚫 Personal & Confidential
- Employee information
- Customer data
- Internal communications with strategy
- Financial data
- Legal documents

### 🚫 Security Sensitive
- Access credentials
- System configurations
- Security protocols
- Vulnerability assessments

**Solution for sensitive work:** Use local sandbox (Ollama + Llama)

---

## Hallucination Prevention

### Techniques

1. **Explicit constraints:** "If data missing, mark 'Not reported'—do not estimate"
2. **Citation requirements:** "Cite with DOI for every claim"
3. **Range specification:** "Focus only on papers 2020-2024"
4. **Verification instruction:** "Flag any uncertainty in your response"

### Verification Checklist

- [ ] Citations are real (verify DOIs)
- [ ] Numerical values are plausible
- [ ] Claims align with domain knowledge
- [ ] No internal contradictions
- [ ] Sources match claims

---

## Optimization Quick Wins

### 1. Batch Queries

❌ **Bad:** 10 separate queries for 10 papers  
✅ **Good:** 1 query processing all 10 papers

**Savings:** ~70%

---

### 2. Think Before Prompting

❌ **Bad:** Stream of consciousness, multiple refinement rounds  
✅ **Good:** Plan query with framework, get it right first time

**Savings:** ~75%

---

### 3. Cache & Reuse

❌ **Bad:** Regenerate monthly literature review from scratch  
✅ **Good:** Cache Month 1, only process new papers in Month 2+

**Savings:** ~90%

---

### 4. Choose Right Model

❌ **Bad:** GPT-4 for simple keyword extraction  
✅ **Good:** BERT-based NLM for classification/extraction, LLM for reasoning

**Savings:** ~95% for appropriate tasks

---

### 5. Use Templates

❌ **Bad:** Recreate prompt for each similar task  
✅ **Good:** Template with `{VARIABLES}`, fill in each time

**Savings:** ~80% time and consistency improvement

---

## Model Selection Guide

| Task Type | Best Tool | Example |
|-----------|-----------|---------|
| **Keyword extraction** | NLM (BERT) | Find all papers mentioning "electrospinning" |
| **Document classification** | NLM (BERT) | Categorize 200 patents by technology |
| **Simple formatting** | Small LLM (8B) | Convert lab notes to template |
| **Literature synthesis** | Medium LLM (70B) | Summarize 20 papers with trend analysis |
| **Strategic analysis** | Large LLM (GPT-4) | Competitive gap analysis and recommendations |
| **Code generation** | Medium/Large LLM | Python script for data analysis |

---

## Common Prompt Mistakes

### ❌ Mistake 1: Vague Task

**Bad:** "Summarise this paper"  
**Good:** "Extract synthesis methodology with parameter table: temp, pressure, yield"

---

### ❌ Mistake 2: No Output Format

**Bad:** "Extract data from these papers"  
**Good:** "Markdown table with columns: [Author, Year, Method, Key Finding]"

---

### ❌ Mistake 3: Missing Constraints

**Bad:** "What's the melting point of PLA?"  
**Good:** "If melting point reported in paper, extract with page #. If not reported, state 'Not reported'—do not use external data"

---

### ❌ Mistake 4: Context Overload

**Bad:** [500 words of company history for simple task]  
**Good:** [Only task-relevant context, <100 words]

---

### ❌ Mistake 5: Wrong Tool

**Bad:** Using GPT-4 for keyword filtering  
**Good:** Use BERT for extraction, GPT-4 for reasoning

---

## Environmental Impact Reference

| Action | Tokens | CO₂ (g) | Water (mL) |
|--------|--------|---------|------------|
| Simple query | ~100 | 0.5 | 10 |
| Complex prompt | ~500 | 2.5 | 50 |
| Document processing | ~2000 | 10 | 200 |
| **Inefficient workflow** (10+ queries) | ~10,000 | 50 | 1000 |
| **Optimized workflow** (1-2 queries) | ~1,000 | 5 | 100 |

**Your goal:** >70% reduction through optimization

---

## Emergency Contacts

**For technical issues with sandbox:**
- Check Docker Desktop is running
- Restart containers: `docker-compose restart`
- View logs: `docker-compose logs`

**For content questions:**
- Review relevant section in course materials
- Ask in workshop Slack channel
- Contact Avgi Stavrou

**For data security concerns:**
- Stop immediately
- Report to supervisor
- Follow Red List protocol

---

## Quick Links

- [AUTOMAT Framework Details](../day1-2/automat-framework.md)
- [CO-STAR Framework Details](../day1-2/costar-framework.md)
- [Green AI Practices](../day3-4/green-ai.md)
- [Golden Prompts](golden-prompts.md)
- [Red List Protocol](red-list.md)

---

**💾 Download:** [PDF version of cheat sheet](../assets/AmaDema_AI_Cheat_Sheet.pdf) *(to be generated)*
