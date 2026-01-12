# Frequently Asked Questions (FAQ)

This page contains answers to questions submitted via the [AMA form](ama.md). Updated regularly during and after the workshop.

---

## General Questions

### What if I'm not comfortable sharing certain data even in the sandbox?

**Answer:** That's perfectly valid! The sandbox is for practice - you can always use:
- Hypothetical examples
- Sanitized/anonymized data
- Generic placeholders (e.g., "Polymer A", "[TEMP]°C")

The Red List protocol applies everywhere, including the sandbox, even though it's secure.

---

### Can I use the frameworks (AUTOMAT/CO-STAR) with tools other than ChatGPT?

**Answer:** Absolutely! These frameworks work with any LLM:
- Claude, Gemini, Copilot
- Local models (Llama, Mistral)
- Even specialized models (code assistants, research tools)

The principles are universal - clear structure, explicit constraints, defined outputs.

---

## Technical Questions

### Why does the sandbox model respond slower than ChatGPT?

**Answer:** Two main reasons:
1. **CPU vs GPU:** ChatGPT runs on powerful GPUs; our sandbox uses CPU (slower but private)
2. **Model size:** We use 3B parameters (fast, efficient) vs. ChatGPT's larger models

Trade-off: Privacy + zero cost vs. speed. For training purposes, 3-8 second responses are fine!

---

### Can I install the sandbox on my personal laptop?

**Answer:** Yes! See the instructor after the workshop for the setup guide. Requirements:
- 16GB+ RAM
- Docker Desktop
- ~5GB disk space

---

## Framework Questions

### When should I use AUTOMAT vs. CO-STAR?

**Quick rule:**
- **AUTOMAT:** Functional tasks with clear outputs (data extraction, formatting, code)
- **CO-STAR:** Strategic/narrative tasks needing rich context (reports, pitches, analysis)

See [comparison in Day 1-2 materials](day1-2/costar-framework.md#automat-vs-co-star-when-to-use-each) for detailed decision tree.

---

### What if my prompt doesn't work even with frameworks?

**Troubleshooting checklist:**
1. Is output format specified exactly? (table columns, bullet structure, etc.)
2. Are constraints explicit? ("If missing, mark 'NR'" not just "summarize")
3. Is the task clear? (avoid "help me with X" - be specific)
4. Is context relevant? (remove unnecessary background)
5. Is model capable? (use LLM for reasoning, NLM for extraction)

Post your prompt in AMA for personalized feedback!

---

## Red List & Security

### What if I accidentally shared something from the Red List?

**Immediate steps:**
1. Stop using that conversation/session
2. Notify your supervisor
3. Document what was shared
4. Follow company incident response

**Prevention:** When in doubt, use sandbox or don't share at all.

---

### Are public AI models actually storing my data?

**Answer:** Depends on the tool and settings:
- **ChatGPT:** 30-day retention (can opt out), enterprise versions don't train on data
- **Claude:** Doesn't train on conversations
- **Copilot:** Depends on Microsoft 365 plan

Always check privacy policies. For sensitive work: use sandbox.

---

## Green AI Questions

### How do I calculate my actual carbon footprint?

**Simple formula:**
```
Annual CO₂ (g) = Queries/year × Average tokens/query × 0.005
```

Example:
- 50 queries/week × 52 weeks = 2,600 queries/year
- Average 500 tokens/query = 1,300,000 tokens/year
- 1,300,000 × 0.005 = 6,500g = 6.5 kg CO₂/year

Use the [Day 3-4 calculator exercise](day3-4/exercises.md#exercise-6-carbon-footprint-audit) for your specific usage.

---

### Is using AI even worth it environmentally?

**Answer:** It depends on the task. Use this decision framework:

**Worth it when:**
- Replaces more energy-intensive alternatives (e.g., flying to meetings)
- Significantly multiplies human productivity (literature review: 20 hours → 2 hours)
- Uses optimized workflows (batching, caching, right-sized models)

**Not worth it when:**
- Task is trivial (spell-checking - use local tools)
- Human can do it as fast
- Using inefficient workflows (10 queries for something that needs 1)

---

## Application Questions

### Can I use these techniques for non-materials-science work?

**Answer:** Yes! The frameworks are domain-agnostic:
- AUTOMAT works for any structured task
- CO-STAR works for any strategic communication
- Red List applies to any company data
- Green AI applies to any usage

Just adapt examples to your domain.

---

### How long until I'm "good" at prompt engineering?

**Realistic timeline:**
- **Week 1:** Frameworks feel mechanical, need reference
- **Month 1:** Using frameworks naturally, fewer iterations
- **Month 3:** Intuitive prompting, creating own templates
- **Month 6:** Teaching others, identifying new applications

**Accelerator:** Practice daily. Use AI for 1-2 real tasks per day.

---

## Workshop Logistics

### Will I get a certificate?

**Answer:** Yes! Upon completing all exercises, you'll receive:
- Digital certificate of completion
- Badge for email signature
- Reference on your professional development record

---

### Can I share these materials with colleagues?

**Answer:** Materials are **proprietary to AmaDema employees**. 

**You can:**
- Share within AmaDema (internal knowledge transfer)
- Reference concepts in your work
- Teach frameworks to AmaDema colleagues

**You cannot:**
- Share materials externally (competitors, partners, public)
- Post on public platforms
- Distribute outside company

---

### What if I miss a session?

**Answer:** All materials are on this website permanently. You can:
- Review missed content asynchronously
- Practice exercises in sandbox (if available)
- Schedule catch-up with instructor

---

## More Questions?

**During workshop:** Use the [AMA form](ama.md) or ask instructor directly.

**After workshop:** Submit via [AMA form](ama.md) - new answers added weekly.

---

**Last updated:** January 2026  
**Questions answered:** Updated after each workshop session
