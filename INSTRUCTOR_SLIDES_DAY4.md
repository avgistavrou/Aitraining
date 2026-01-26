# Day 4 Instructor Slides
## AmaDema AI Training Programme

**Format:** Detailed slide-by-slide content for PowerPoint creation  
**Duration:** 1.5 hours (90 minutes)  
**Slide Count:** ~35 slides  
**Branding:** Red, Black, White (AmaDema colours)  
**Interactivity Level:** High (Efficiency challenges, bias detection, privacy scenarios)

---

## SLIDE 1: Title Slide

**Visual:**
- Large title centred
- Subtle red accent line/border
- AmaDema logo in corner

**Content:**
```
Day 4: Mastery & Responsibility

Mastering Optimisation, Ethics, and Data Security
```

**Design Notes:**
- Background: White with subtle red geometric pattern
- Title: Black text, large font (48pt)
- Subtitle: Gray text (24pt)
- "Day 4" in red highlight

**Speaker Notes:**
> Welcome to our final session! Today is about transitioning from being a "user" of AI to a "professional practitioner." We're covering the three pillars of mastery: Efficiency (how to save time and the environment), expertise (how to learn deeper), and responsibility (how to protect our IP and ensure fairness). Let's finish strong!

---

## SLIDE 2: Quick Check-In

**Visual:**
- Simple, welcoming layout
- Icons for Sandbox, Hallucinations, and Coordinates

**Content:**
```
Quick Check-In

🛠️ Successfully used the Local Sandbox?

🔍 Spotted a hallucination this week?

🧠 One thing you remember about "Semantic Space"?

Quick responses (2-3 people)
```

**Speaker Notes:**
> Before we start Day 4, let's look back at Day 3. Who managed to get into the Local Sandbox? Anyone catch the AI making up a DOI or a property value? And does anyone remember what we mean by "semantic space"? (Pause for 2-3 brief answers).

---

## SLIDE 3: Day 3 Recap

**Visual:**
- Three-point summary
- Red checkmarks

**Content:**
```
Day 3: Technical Under the Hood

✓ NLMs vs LLMs: 
  Small models for simple tasks, Large for reasoning.

✓ Embeddings & Tokens: 
  Words → Coordinates → Pattern Matching.

✓ Hallucination Prevention: 
  Grounding in reality (RAG, Low Temp, Verification).
```

**Speaker Notes:**
> Yesterday was technical. We demystified the "magic." We learned that LLMs are just probability engines navigating a mathematical map. We also learned that because they are pattern-matchers, they will lie to look plausible—and we learned how to stop that through grounding techniques like RAG and temperature control.

---

## SLIDE 4: Day 4 Learning Objectives

**Visual:**
- List with red bullet points
- Target icon in corner

**Content:**
```
Learning Objectives

1. Apply Green AI practices to reduce footprint.
2. Master advanced optimisation (Caching, Batching).
3. Build expertise via the "Why Cascade".
4. Recognise and mitigate bias in technical outputs.
5. Navigate AmaDema privacy protocols & the Red List.
```

**Speaker Notes:**
> Today's goals are practical and ethical. By the end of these 90 minutes, you'll know how to run your AI queries at 80% less cost to the environment, how to learn the principles behind the AI's answers, and how to keep AmaDema's trade secrets 100% safe.

---

## SLIDE 5: PART 1: Efficiency & Sustainability

**Visual:**
- Full-width red background
- White text: PART 1
- Large "Efficiency & Sustainability" title

**Speaker Notes:**
> We start with Part 1: Efficiency. In a professional setting, being "fast" is good, but being "efficient" is responsibility. Every query has a cost—computational and environmental.

---

## SLIDE 6: The Environmental Cost of AI

**Visual:**
- Divided slide (Water vs. Carbon)
- Water droplet and fire/smoke icons

**Content:**
```
The Hidden Costs

💧 Water Consumption (Cooling)
   - 10–50 mL per query
   - Evaporated and lost to the ecosystem

🔥 Carbon Footprint (Energy)
   - GPT-4 (1,000 words) ≈ 4.32g CO₂e
   - Similar to charging your smartphone
   - 70× difference based on server location!
```

**Speaker Notes:**
> Most people think AI is "digital and clean." It isn't. Data centres are massive industrial sites. Every complex prompt you run consumes about a shot glass of water for cooling. And depending on if the server is in Norway (green energy) or the US (fossil fuels), the carbon cost can vary by 70 times.

---

## SLIDE 7: Scaling Effects: Why You Matter

**Visual:**
- Growth chart showing 2023 vs 2025 energy projections
- "50× Increase" in red text

**Content:**
```
Why Efficiency is a Skill

1. Model Size: Bigger models = More energy per token.
2. User Growth: Millions joining every month.
3. Frequency: AI moving from "search" to "daily workflow".

Result: Total AI energy use projected to grow 50× by 2025.
```

**Speaker Notes:**
> Individual queries seem small, but aggregate impact is huge. As we integrate AI into every part of AmaDema's R&D, our "AI footprint" will become a key ESG metric. Efficiency is now a professional skill.

---

## SLIDE 8: Professional Green AI Principles

**Visual:**
- Four quadrant icons: One-Shot, Right-Size, Batch, Value

**Content:**
```
Green AI Principles

🎯 The One-Shot Goal
   Reduce iterations from 5 down to 1.

⚖️ Right-Sizing
   Use Llama 8B for routine tasks, not GPT-4.

📦 Batching & Caching
   Process 10 items at once; save successful results.

💎 Value Check
   "Is this insight worth 50mL of water?"
```

**Speaker Notes:**
> Here is how we fight back. 1: Use frameworks to get it right the first time—that's an 80% energy saving right there. 2: Don't use a supercar (GPT-4) to go to the corner shop; use a small local model for simple formatting or extraction. 3: Batch related tasks. 4: Think before you prompt.

---

## SLIDE 9: Optimisation Strategy 1: One-Shot Principle

**Visual:**
- "Amateur" (Iterative) vs "Professional" (Framework) comparison
- Red vs Green arrows

**Content:**
```
The One-Shot Principle

Amateur: 4–6 iterations
"Summarise" → "Technical" → "Include data" → "Use table"
(Total Cost: 400% tokens)

Professional: 1 iteration
Complete AUTOMAT or CO-STAR prompt.
(Total Cost: 100% tokens)

Savings: 75% reduction in tokens, time, and carbon.
```

**Speaker Notes:**
> The biggest waste of AI is "prompting by trial and error." If you send a vague prompt, get a bad answer, and then spend 5 turns fixing it, you've wasted four times the resources. A professional spends 2 minutes planning the prompt to save 10 minutes of fixing it.

---

## SLIDE 10: Optimisation Strategy 2: Context Pruning

**Visual:**
- "Bloated" text (greyed out) vs "Relevant" text (bold red)

**Content:**
```
Strategic Context Pruning

❌ Bloated Context:
"I am a researcher at AmaDema, founded in 2018, we have 
15 staff... [3 paragraphs of history]... anyway, format 
this lab note."

✅ Task-Relevant Context Only:
"Act as a Lab Documentation Specialist. Context: Formatting 
informal notes for publication. Task: [Notes]"

Result: 80% token reduction, zero IP leakage.
```

**Speaker Notes:**
> Don't tell the AI your life story or the company's founding date unless it's relevant to the specific task. Irrelevant context adds "noise" to the semantic space and costs money. Keep it lean.

---

## SLIDE 11: Advanced Technique: Query Batching

**Visual:**
- Image of 10 SEM images being sent in one block

**Content:**
```
Query Batching

Instead of:
10 separate queries for 10 SEM images.

Try:
"Analyse these 10 SEM images. For each, measure diameter 
and porosity. Output results in a single table."

Benefits:
✓ 70% less overhead
✓ 40% total token reduction
✓ Easier data comparison
```

**Speaker Notes:**
> If you have a repetitive task—like analysing 10 images or extracting data from 10 papers—don't do them one by one. Batch them. The "overhead" tokens (the instructions) only get charged once, and the AI can often find patterns across the set that it would miss individually.

---

## SLIDE 12: PART 2: Advanced Conversational Learning

**Visual:**
- Full-width red background
- White text: PART 2
- Large "Advanced Conversational Learning" title

**Speaker Notes:**
> Part 2: Moving from "Getting Answers" to "Building Expertise."

---

## SLIDE 13: The Power of "Why"

**Visual:**
- Ladder icon showing 5 levels

**Content:**
```
The "Why" Hierarchy

Level 5: Transfer ("Why is this universal?")
Level 4: Boundaries ("Why would this fail?")
Level 3: Principles ("Why does this work?")
Level 2: Rationale ("Why this approach?")
Level 1: Surface ("What should I do?")
```

**Speaker Notes:**
> Amateurs ask "What." Professionals ask "Why." If the AI tells you to use a specific solvent, asking "Why that solvent?" moves you from a set of instructions to a lesson in polymer chemistry.

---

## SLIDE 14: LIVE DEMO: The "Why Cascade"

**Visual:**
- Screen capture of a "Why" dialogue
- Red highlights on the AI's reasoning

**Content:**
```
[Live Demo Scenario]

Problem: "I need to improve thermal stability of PLA."

AI Recommendation: "Add 3-5% graphene."

The Cascade:
1. Why graphene? (Mechanism)
2. Why 3-5% specifically? (Boundaries)
3. Why does aggregation happen at 6%? (Limitations)
```

**Speaker Notes:**
> (Perform live or show video) Watch how we peel back the layers. Each "Why" forces the AI to reveal its internal model. By the end of this 5-minute chat, I haven't just solved my PLA problem—I've learned the physics of nanofiller reinforcement.

**Interactive Element:**
> **Live Demo:**
> 1. Type: "I need to improve the thermal stability of my PLA/graphene composite. Why does thermal stability need improvement?"
> 2. Follow-up: "Why does PLA have limited thermal stability compared to PEEK?"
> 3. Follow-up: "Why does graphene specifically improve this? Walk me through the interface physics."
> 4. Observe how the AI moves from generic advice to structural mechanics.

---

## SLIDE 15: Socratic Dialogue

**Visual:**
- Image of Socrates or Greek pillar
- Prompt template in a box

**Content:**
```
Turn AI into a Tutor

Prompt:
"Act as a Socratic tutor. Instead of giving me direct 
answers, guide me to discover insights through questions. 
Start by asking what problem I am trying to solve."

✓ Develops diagnostic skills
✓ Prevents "blind trust"
✓ Identifies your own knowledge gaps
```

**Speaker Notes:**
> This is a game-changer for professional development. Instead of the AI doing the work, you tell the AI to *make you* do the work. It will question your assumptions and guide you to the answer. It's the fastest way to upskill in a new area.

**Interactive Element:**
> **Group Activity:** Ask participants to copy the Socratic prompt into the sandbox and try a technical question from their current project. Spend 3 minutes in dialogue. (3 minutes total)

---

## SLIDE 16: PART 3: Ethics & Data Responsibility

**Visual:**
- Full-width red background
- White text: PART 3
- Large "Ethics & Data Responsibility" title

**Speaker Notes:**
> Part 3: The professional guardrails. Bias and Privacy.

---

## SLIDE 17: Bias in Materials Science AI

**Visual:**
- Three icon categories: Gender, Geographic, Historical

**Content:**
```
Types of Bias to Watch For

🌍 Geographic: Over-representing Western/US research.
👤 Gender: Associating roles (e.g., "Lead Researcher") with specific genders.
📜 Historical: Perpetuating old methods or excluding new sustainable alternatives.

AI is a mirror of its training data.
```

**Speaker Notes:**
> Even in technical fields, bias exists. If the training data is 90% Western papers from the 90s, the AI will suggest those solutions first. As engineers, we need to be aware of these "blind spots" in the models.

---

## SLIDE 18: Bias Mitigation Strategy

**Visual:**
- "Before" vs "After" prompt comparison

**Content:**
```
Mitigation Strategies

Instead of:
"Give me examples of pioneers in electrospinning."

Try:
"Provide examples of pioneering researchers in 
electrospinning from diverse backgrounds, including 
different regions (Asia, Global South) and genders. 
Highlight varied methodologies."

✓ Explicitly request diverse perspectives.
✓ Challenge stereotypical outputs.
```

**Speaker Notes:**
> The fix is simple: be explicit. If you want a global view, ask for it. If the AI refers to a "Lead Scientist" as "He" throughout a text, challenge it. Professionals ensure their outputs are fair and representative.

---

## SLIDE 19: Privacy: The Red List Protocol

**Visual:**
- Large "RED LIST" sign
- Icons for Patent, Recipe, Client

**Content:**
```
The Red List (NEVER SHARE)

🚫 Proprietary synthesis recipes
🚫 Unpublished experimental data
🚫 Patent-pending methodology
🚫 Client names or specific project IDs
🚫 Employee/Personal data

Rule: If it's AmaDema's secret, keep it off the Cloud.
```

**Speaker Notes:**
> This is the most important slide of the day. If you share an unpublished synthesis method with ChatGPT, it is no longer private. It becomes part of the training data or is stored on servers we don't control. This can invalidate patent applications. Follow the Red List strictly.

---

## SLIDE 20: The Local Sandbox Advantage

**Visual:**
- Diagram showing Local Laptop (Safe) vs. Cloud Server (Risk)

**Content:**
```
When to use the Local Sandbox?

✅ High Risk (Confidential IP, Restricted data)
⚠️ Medium Risk (Internal reports, Draft papers)
❌ Low Risk (Public literature, General coding)

Local = Data never leaves your device.
Cloud = Data travels over the internet.
```

**Speaker Notes:**
> This is why we gave you the Local Sandbox. For anything on the Red List, use the local models (like Llama 3.2 via Ollama). It might be slightly slower or less "smart" than GPT-4, but it is 100% secure.

---

## SLIDE 21: ACTIVITY: Privacy Risk Assessment

**Visual:**
- Scenarios table
- Red/Yellow/Green indicators

**Content:**
```
Scenario Analysis: Tool Selection

1. Analysis of 50 public DOIs for a review paper.
   → [Public AI] - Low Risk

2. Debugging a Python script for stress-strain curves.
   → [Public AI] - Low Risk (assuming generic code)

3. Optimising a proprietary resin formulation.
   → [Local Sandbox] - High Risk

4. Draft email to client mentioning specific project budget.
   → [Local Sandbox] - High Risk (PII/Client Data)

5. Fact-checking a general chemistry principle.
   → [Public AI] - Low Risk
```

**Speaker Notes:**
> Let's test your judgment. If the data is public or generic (like code or general science), use the fast public models. If it involves AmaDema recipes, client names, budgets, or anything on the Red List—use the Local Sandbox. No exceptions.

**Interactive Element:**
> **Quick Vote:** Call out each scenario and have participants point "Up" for Public AI or "Down" for Local Sandbox. (3 minutes total)

---

## SLIDE 22: DAY 4 EXERCISES

**Visual:**
- Large "PRACTICE TIME" text
- Timer set to 30 minutes

**Content:**
```
Day 4 Practice (30 Minutes)

Ex 1: Calculate your AI Footprint.
Ex 2: Design a 10-Question "Why Cascade".
Ex 3: Spot Bias in a research summary.
Ex 4: Complete Privacy Risk Assessment.

Open: docs/day4/exercises.md
```

**Speaker Notes:**
> Time to put it into practice. We have 30 minutes for the Day 4 exercises. I want you to focus especially on the "Why Cascade"—pick a topic from your actual work and try to go 10 layers deep with the AI. Go!

---

## SLIDE 23: The Complete Professional Workflow

**Visual:**
- Circular workflow diagram: Plan → Prompt → Execute → Verify → Learn

**Content:**
```
The Professional AI Workflow

1. Plan: Clear objective? (AUTOMAT vs CO-STAR)
2. Construct: Pruned context + Constraints.
3. Check: Red List/Privacy verify.
4. Execute: Local Sandbox for sensitive work.
5. Verify: Check citations (CrossRef).
6. Learn: Ask "Why" to build expertise.
```

**Speaker Notes:**
> This is what mastery looks like. It's a systematic loop. You don't just "chat" with AI; you engineer a workflow. If you follow these 6 steps, you will be in the top 1% of AI users globally.

---

## SLIDE 24: Certification & Next Steps

**Visual:**
- Image of the AmaDema AI Certificate
- List of requirements

**Content:**
```
AmaDema AI Efficiency Certification

Requirements:
1. Complete all exercises (Days 1-4).
2. Submit 1 optimised workflow (50%+ gains).
3. Create 3 reusable templates for your work.
4. Pass the Privacy & Bias assessment.

Submit to: instructor@amadema.com
```

**Speaker Notes:**
> We don't just want you to attend; we want you to be certified experts. To get the AmaDema AI Efficiency Certificate, you need to show us your results. Send us one "Before and After" workflow where you saved at least 50% of the time or tokens.

---

## SLIDE 25: Course Wrap-Up

**Visual:**
- "Congratulations!" in large text
- Photo of the training group (if available)

**Content:**
```
You are now an AI Engineer.

Not building models, but
ENGINEERING VALUE from models.

✓ Constrain vast potential into precise outputs.
✓ Protect AmaDema IP with local tools.
✓ Optimise for efficiency and sustainability.
✓ Learn continuously by asking "Why".
```

**Speaker Notes:**
> You have completed 6 hours of intensive training. You now have the frameworks (AUTOMAT, CO-STAR), the technical understanding (Tokens, Embeddings), and the ethical guardrails (Red List, Green AI) to transform how AmaDema does R&D.

---

## SLIDE 26: Final Thought & Action

**Visual:**
- "Go forth and engineer intelligently."
- Rocket ship icon

**Content:**
```
Your Mission This Week:

1. Teach ONE framework (AUTOMAT or CO-STAR) 
   to a colleague who wasn't here.

2. Audit your next 10 queries for efficiency.

3. Use the Local Sandbox for one secret task.
```

**Speaker Notes:**
> Last request: The best way to learn is to teach. This week, show AUTOMAT or CO-STAR to a colleague. Audit yourself—don't let those "lazy iterations" creep back in. And use the Sandbox! Thank you everyone for your energy and engagement. 🚀

---

## SLIDE 27: Q&A

**Visual:**
- Large question mark
- "Thank You!" text

**Speaker Notes:**
> We have 5 minutes for any final questions about Day 4, the certification, or the course in general. (Wait for questions). Thank you everyone!
