# Workshop Restructure: 4 Individual Days

## Content Distribution Plan

### Day 1 (1.5 hours): Foundation & AUTOMAT
**New content:**
- ✅ Overview (created)
- ✅ Intro to Prompt Engineering (created)

**From existing:**
- AUTOMAT Framework (from day1-2/)
- Conversational Learning Basics (from conversational/learning-partner.md - first half)
- Responsible AI & Red List (from day1-2/responsible-ai.md)
- Exercises (adapted from day1-2/exercises.md - relevant ones)

---

### Day 2 (1.5 hours): Context & CO-STAR
**New content:**
- Overview (to create)

**From existing:**
- Context Deep Dive (expand fundamentals/context-matters.md)
- CO-STAR Framework (from day1-2/costar-framework.md)
- Hallucination Hunt (from day1-2/responsible-ai.md)
- Exercises (from day1-2/exercises.md - hallucination hunt, CO-STAR practice)

---

### Day 3 (1.5 hours): Technical Understanding
**New content:**
- Overview (to create)

**From existing:**
- NLMs vs LLMs (from day3-4/nlms-vs-llms.md)
- Green AI Introduction (from day3-4/green-ai.md - first sections)
- Environmental Impact (from ethics/environmental.md)
- Exercises (from day3-4/exercises.md - tool selection, initial footprint calc)

---

### Day 4 (1.5 hours): Optimization & Ethics
**New content:**
- Overview (to create)
- Wrap-up & Certification (to create)

**From existing:**
- Green AI Strategies (from day3-4/green-ai.md - optimization sections)
- Optimization Techniques (from day3-4/optimisation.md)
- Advanced Conversational Learning (from conversational/why-questions.md)
- Ethics & Bias (from ethics/bias.md + ethics/privacy.md)
- Final Exercises (from day3-4/exercises.md - optimization challenge)

---

## File Operations Needed

### Create New Folders:
```
docs/day1/
docs/day2/
docs/day3/
docs/day4/
```

### Copy & Adapt Files:

**Day 1:**
- Copy: day1-2/automat-framework.md → day1/automat-framework.md
- Split: conversational/learning-partner.md → day1/conversational-basics.md (first half)
- Copy: day1-2/responsible-ai.md → day1/responsible-ai.md
- Adapt: day1-2/exercises.md → day1/exercises.md (Ex 1, 3, 4, 5)

**Day 2:**
- Copy: day1-2/costar-framework.md → day2/costar-framework.md
- Expand: fundamentals/context-matters.md → day2/context-deep-dive.md
- Extract: day1-2/responsible-ai.md (hallucination section) → day2/hallucination-hunt.md
- Adapt: day1-2/exercises.md → day2/exercises.md (Ex 2, hallucination hunt)

**Day 3:**
- Copy: day3-4/nlms-vs-llms.md → day3/nlms-vs-llms.md
- Split: day3-4/green-ai.md → day3/green-ai-intro.md (concepts + impact)
- Copy: ethics/environmental.md → day3/environmental-impact.md
- Adapt: day3-4/exercises.md → day3/exercises.md (Ex 1, 6)

**Day 4:**
- Split: day3-4/green-ai.md → day4/green-ai-strategies.md (optimization section)
- Copy: day3-4/optimisation.md → day4/optimisation.md
- Copy: conversational/why-questions.md → day4/advanced-conversational.md
- Merge: ethics/bias.md + ethics/privacy.md → day4/ethics-bias-privacy.md
- Adapt: day3-4/exercises.md → day4/exercises.md (Ex 2, 7, 8, 9, bonus)

### Delete Old Folders (after copying):
```
docs/day1-2/
docs/day3-4/
docs/conversational/
docs/ethics/
```

### Update Navigation (mkdocs.yml):
Replace day1-2 and day3-4 sections with individual day1, day2, day3, day4 sections

---

## Estimated Steps: ~40-50 file operations

This is comprehensive. Should I proceed with the full restructure?
