# Day 3 Instructor Slides
## AmaDema AI Training Programme

**Format:** Detailed slide-by-slide content for PowerPoint creation  
**Focus:** Understanding AI Under the Hood  
**Slide Count:** 32 slides (optimized)  
**Branding:** Red, Black, White (AmaDema colors)

---

## SLIDE 1: Title Slide

**Visual:**
- AmaDema logo (top left)
- Large title centered
- Subtle red accent line/border

**Content:**
```
AmaDema AI Training Programme
Day 3: Understanding AI Under the Hood

How Computers Turn Words Into Predictions
```

**Design Notes:**
- Background: White with subtle red geometric pattern
- Title: Black text, large font (48pt)
- Subtitle: Gray text (24pt)
- Circuit/neural network motif

**Speaker Notes:**
> Welcome to Day 3. Days 1-2 taught you how to use AI—frameworks, IP protection, verification. Today we answer the "why." As engineers, you trust tools you understand. By the end of today, you'll understand the mechanism from words to predictions, why AI hallucinates, and how to prevent it. This transforms you from AI users to informed practitioners.

---

## SLIDE 2: Recap & Today's Focus

**Visual:**
- Split view: Days 1-2 vs Day 3
- Arrow showing progression

**Content:**
```
Days 1-2: How to Use AI
✓ AUTOMAT/CO-STAR frameworks
✓ Red List & IP protection
✓ Verification basics

Today: How AI Actually Works
→ Words become mathematical coordinates
→ Why "Large" matters (attention + scale)
→ Why AI hallucinates & how to stop it

From Application → Understanding
```

**Design Notes:**
- Left panel gray (past), right panel red (today)
- Arrow emphasizing progression

**Speaker Notes:**
> Quick recap. Days 1-2: practical application skills. Today: the mechanism behind those skills. Understanding how AI works makes you better at using it. You'll see why structured prompts work, why hallucinations happen, and why verification isn't optional. Let's look under the hood.


## SLIDE 5: Session Structure Overview

**Visual:**
- Three connected boxes
- Flow diagram

**Content:**
```
Today's Journey

Part 1: NLM Foundations
How words become coordinates in semantic space
(Property space analogy)

Part 2: The "Large" in LLM
Attention mechanism + scale = context understanding
(Composite weighting analogy)

Part 3: Truth vs. Probability
Why models hallucinate & grounding techniques
(Engineering verification protocols)
```

**Design Notes:**
- Three connected boxes
- Icons: building blocks, magnifying glass, balance scale
- No time blocks—conceptual flow

**Speaker Notes:**
> Three parts building on each other. Part 1: Foundation—how words become coordinates. Part 2: Scale—how attention enables context. Part 3: Critical section—hallucinations and prevention. We'll use materials science analogies throughout. You already have the mental models; we're just mapping them to AI.

---

## SLIDE 6: Section Title - NLM Foundations

**Visual:**
- Bold section divider
- Building blocks icon

**Content:**
```
PART 1: NLM FOUNDATIONS

How Words Become Coordinates

The foundation of all AI language processing
```

**Design Notes:**
- Large title, centered
- Red building blocks icon
- Clean divider aesthetic

**Speaker Notes:**
> Part 1: Neural Language Model foundations. The core problem: computers can't read "steel" or "polymer." They need mathematics. This section shows how AI converts words into coordinates in mathematical space using a concept you already know from materials engineering.


## SLIDE 8: Materials Property Space Analogy

**Visual:**
- Table of materials with properties
- 3D plot showing clustering

**Content:**
```
You Already Know This Concept!

| Material | Density | Strength | Conductivity |
|----------|---------|----------|--------------|
| Steel    | 7.85    | 400-550  | 50           |
| Aluminium| 2.70    | 47-70    | 237          |
| Titanium | 4.51    | 293      | 22           |
| PTFE     | 2.1-2.2 | 13-30    | 0.25         |

Each material = Point in property space
Similar properties = Close together
```

**Design Notes:**
- Clean table on left
- 3D visualization on right showing materials as points
- Clustering visible (metals together, PTFE separate)

**Speaker Notes:**
> You already work with this concept! You describe materials with properties: density, strength, conductivity. Each material is a point in property space. Steel and aluminum cluster as metals. PTFE sits far away as a polymer. Plot these values, and relationships become spatial. AI does exactly this with words—semantic space instead of property space, but identical mathematics.

---

## SLIDE 9: Semantic Space - Words as Coordinates

**Visual:**
- Parallel to property space
- Word vectors shown

**Content:**
```
AI Does the Same with Words

'Steel'   → [0.12, -0.98, 0.45, ...]  (768 numbers)
'Iron'    → [0.15, -0.95, 0.42, ...]  (768 numbers)
'Polymer' → [-0.45, 0.23, -0.67, ...] (768 numbers)
'Banana'  → [0.88, 0.34, -0.12, ...]  (768 numbers)

Words with similar meanings → Similar vectors
→ Close together in "semantic space"
```

**Design Notes:**
- Vectors displayed clearly
- Visual showing Steel/Iron close, Banana far
- 2D projection of 768D space

**Speaker Notes:**
> Same concept, different space. Each word gets 768 coordinates in semantic space. Just like (7.85, 450, 50) locates steel in property space, this vector locates "steel" in meaning space. Steel and Iron are close—both appear in similar contexts. Banana is distant—different domain entirely. The AI learned these relationships from reading billions of documents, learning statistical patterns of word co-occurrence, not chemistry itself.

---

## SLIDE 10: Three Steps - Text to Mathematics

**Visual:**
- Process flow diagram
- Example sentence transforming

**Content:**
```
From Text → Math: Three Steps

Example: "Electrospinning PLA nanofibers requires voltage control."

Step 1: TOKENIZATION
["Electro", "spinning", " PLA", " nan", "of", "ibers", ...]

Step 2: EMBEDDINGS
Each token → 768-dimensional vector

Step 3: SEMANTIC SPACE
All words plotted in meaning-space

Result: Computer sees NUMBERS, not words
```

**Design Notes:**
- Three boxes showing transformation
- Sentence flowing through steps
- Clear progression visual

**Speaker Notes:**
> Three-step process. Tokenization: break into chunks (~4 characters each)—like unit cells in crystal lattice. Embeddings: each token becomes 768-number coordinate. Semantic space: all vectors plotted. Final result: when you type "steel," computer sees mathematical coordinates, not letters. Everything from here is vector math in 768-dimensional space.

---

## SLIDE 11: Why This Matters - AI Measures Similarity

**Visual:**
- Example query visualization
- Similarity diagram

**Content:**
```
AI Doesn't "Understand"—It Measures Similarity

You ask: "What's similar to steel?"

AI doesn't think "metals with high strength"

AI finds words with vectors close to steel's vector

Often correct: Iron, Aluminium
(They appear in similar contexts in training text)

Sometimes wrong: If training data has biases/gaps
```

**Design Notes:**
- Query shown
- Similarity visualization (close vs far words)
- Warning icon for "sometimes wrong"

**Speaker Notes:**
> Critical distinction. When you ask what's similar to steel, AI doesn't reason about metallurgy. It finds words with nearby vectors in semantic space. Often correct—Iron, Aluminium appear in similar contexts. Sometimes wrong if training data had gaps. It's pattern matching in mathematical space, not knowledge. This explains both AI's power and its limits.


## SLIDE 13: NLM Summary

**Visual:**
- Summary box with key points

**Content:**
```
Section 1 Summary: Words → Coordinates

Key Concepts:
1. Words are tokenized (broken into chunks)
2. Each token gets 768-number embedding (vector)
3. Similar meanings → Similar vectors in semantic space
4. AI operates in math space, not language space

Materials Science Parallel:
Property space (materials) = Semantic space (words)

Next: How "Large" Language Models add context
```

**Design Notes:**
- Numbered summary points
- Analogy emphasized
- Transition to Part 2

**Speaker Notes:**
> Section 1 complete. Words become coordinates through tokenization and embedding. Similar meanings cluster in 768D space. Everything AI does is vector math. The materials parallel: exactly how you work with property space. Limitation: no context yet. That's Part 2—attention mechanisms and scale.

---

## SLIDE 14: Section Title - The "Large" in LLM

**Visual:**
- Bold section divider
- Scale/magnifying glass icon

**Content:**
```
PART 2: THE "LARGE" IN LLM

Scale + Attention = Context Understanding

How AI learned to disambiguate meaning
```

**Design Notes:**
- Large title
- Magnifying glass icon in red
- Professional divider

**Speaker Notes:**
> Part 2: What makes language models "Large." We've built the foundation—words as coordinates. Now we scale up and add the key ingredient: attention mechanisms. By the end of this section, you'll understand how AI went from simple pattern matching to apparent context understanding.

---

## SLIDE 15: The "Lead" Problem

**Visual:**
- Two sentences side by side
- "Lead" highlighted in both

**Content:**
```
The Context Problem

Sentence 1:
"The lead shielding protected the sensor from radiation."

Sentence 2:
"The lead investigator supervised the electrospinning trials."

Same word: "lead"
Different meanings: Metal (Pb) vs. Leadership

At NLM stage: ONE embedding for "lead"

How does AI know which meaning?

Answer: CONTEXT + ATTENTION
```

**Design Notes:**
- Two sentence boxes
- "Lead" in red highlight
- Question mark between them

**Speaker Notes:**
> Here's the problem NLMs can't solve. Same word—"lead"—completely different meanings. You instantly knew sentence 1 is about Pb metal, sentence 2 about leadership. How? You looked at surrounding words. "Shielding," "radiation"—scientific context. "Investigator," "supervised"—human context. This is context-dependent disambiguation. For AI to do this, it needs attention mechanisms that weight surrounding words' importance.

---

## SLIDE 16: Composite Material Analogy

**Visual:**
- Fiber-reinforced composite diagram
- Load transfer illustration

**Content:**
```
Engineering Analogy: Composite Materials

In fiber-reinforced composites:
• Matrix and fibers INTERACT
• Properties don't just add linearly
• Each component's contribution depends on:
  - Interface bonding
  - Load transfer
  - Spatial arrangement

→ Dynamic weighting based on context

Attention Does the Same for Words
```

**Design Notes:**
- Composite cross-section
- Interaction arrows
- Load transfer diagram

**Speaker Notes:**
> Use a concept you know: composites. Matrix and fibers don't simply add—there's complex interaction. Interface bonding, load transfer, spatial effects. Each component's contribution is dynamically weighted based on surrounding context. Strong bonding means fibers carry more load. Attention mechanisms do exactly this for words. "Lead" dynamically weights surrounding words. High weight to "shielding"? Metal context. High weight to "investigator"? Leadership context. Same principle.

---

## SLIDE 17: Attention Mechanism Visualized

**Visual:**
- Sentence with attention weights shown
- Arrows connecting words

**Content:**
```
Attention in Action

Sentence: "The lead shielding protected the sensor"

When processing "lead":
       The    lead   shielding  protected   sensor
        ↓      ↓         ↓          ↓          ↓
Weight: 0.05   1.0      0.85       0.60       0.75

High attention to "shielding" and "sensor"
→ Metal (Pb) context activated

The word "lead" dynamically adjusts meaning
based on weighted context
```

**Design Notes:**
- Sentence at top
- Arrows from "lead" to other words
- Arrow thickness = attention weight
- Numbers clearly visible

**Speaker Notes:**
> Attention visualized. Processing "lead," the model assigns importance weights to every word. "The" gets low weight—not informative. "Shielding" gets high weight—very informative! "Sensor" also high. Result: "lead" incorporates context from high-weight words, determining we're discussing Pb metal. Different sentence—"lead investigator"—would show high attention to "investigator," triggering leadership meaning. Context changes everything.

---

## SLIDE 18: What Makes Models "Large"

**Visual:**
- Scale comparison table
- Analogy to engineering complexity

**Content:**
```
Three Aspects of "Large"

1. Training Data Scale
   Read ~billions of pages (nearly entire internet)

2. Parameter Count
   Billions of adjustable weights

3. Context Window
   Process thousands of words at once

Scale Comparison:
Small NLM:    ~100M parameters
Medium LLM:   ~8B parameters
Large LLM:    ~70B parameters
Massive LLM:  ~175-405B parameters

More parameters = More pattern complexity
```

**Design Notes:**
- Three aspects clearly separated
- Scale table with engineering analogies
- Progressive sizing

**Speaker Notes:**
> What makes models "Large"? Three aspects. Training data: read billions of pages. Parameters: billions of adjustable weights—like regression coefficients, but billions instead of dozens. Context window: process thousands of words simultaneously. Scale comparison: 100 million to 405 billion parameters. More parameters means more capacity for complex patterns. But bigger isn't always better—more parameters means slower, more expensive, higher energy use. Match model size to task complexity.

---

## SLIDE 19: What Training Actually Learned

**Visual:**
- Training process illustration
- Pattern examples

**Content:**
```
Not Facts—Probabilities

Training Task: Predict the next word

Example: "The tensile strength of PLA is approximately ___"

Model Learned:
✓ "50" or "60" appear often after this phrase
✓ "MPa" usually follows strength values
✓ Common sentence patterns in materials papers

Model Did NOT Learn:
✗ Actual tensile strength of PLA
✗ Why PLA has this strength
✗ How to measure tensile strength

Learned: How scientists WRITE about strength
Not: What strength actually IS
```

**Design Notes:**
- Training example prominent
- Two columns: Learned vs Not Learned
- Checkmarks and X marks

**Speaker Notes:**
> Critical insight: training learned patterns, not facts. From thousands of papers mentioning PLA tensile strength, it learned "50 MPa" is common completion. Not because it knows polymer chemistry—because it saw this pattern repeatedly. The model learned how scientists write about PLA, not what PLA actually is. Can't calculate, can't measure, can't reason from first principles. Pattern completion feels like knowledge. It isn't. Always verify.

---

## SLIDE 20: The Illusion of Knowledge

**Visual:**
- Split view: perception vs reality
- Process flowchart

**Content:**
```
What You See vs. What Actually Happens

You Ask: "What is the Young's modulus of PLA?"

Looks Like: AI "knows" → tells you "3.5 GPa"

Actually Happens:
1. Tokenize: ["What", " is", " Young", "'s", " modulus", " PLA"]
2. Embed: Convert to vectors
3. Attend: High attention "Young's modulus" + "PLA"
4. Predict: Most probable tokens → "3" "." "5" "GPa"

Is it correct? Often yes. Sometimes no.

It's PATTERN COMPLETION, not knowledge retrieval
```

**Design Notes:**
- Two panels showing perception/reality
- Flowchart of actual process
- Warning emphasis

**Speaker Notes:**
> The illusion of understanding. You ask about PLA's modulus, AI responds confidently "3.5 GPa." Feels like it looked it up, right? Wrong. Here's what happened: tokenization, embedding, attention between modulus and PLA, then predicting most probable next tokens. "3.5 GPa" appeared frequently enough in training that it's highly probable. Often correct—if pattern was common. Sometimes wrong—if interpolating. Don't mistake confident pattern completion for reliable knowledge.

---

## SLIDE 21: Strengths and Weaknesses

**Visual:**
- Two-column comparison
- Warning triangle

**Content:**
```
What LLMs Are Good/Bad At

Strengths:
✓ Context awareness (disambiguates words)
✓ Long-range dependencies (across paragraphs)
✓ Semantic reasoning ("similar" vs "opposite")
✓ Pattern synthesis (novel combinations)

Weaknesses:
✗ No fact database (can't "look up" values)
✗ No calculation (can't reliably multiply)
✗ No logical certainty (everything probabilistic)
✗ Hallucinates when uncertain (plausible guesses)

⚠️  CRITICAL: Confidence ≠ Accuracy
Always verify, especially numbers and citations
```

**Design Notes:**
- Clear columns
- Warning triangle prominent
- Key message bolded

**Speaker Notes:**
> Strengths and weaknesses consolidated. Strengths: context awareness, long-range connections, semantic reasoning, pattern synthesis—impressive capabilities. Weaknesses for scientists: no fact database, can't calculate reliably, everything probabilistic, hallucinates when uncertain. Most dangerous: presents guesses with same confidence as facts. For scientists: Confidence does NOT equal accuracy. Always verify numbers and citations. This is what Part 3 is all about.

---

## SLIDE 22: LLM Summary

**Visual:**
- Summary box
- Transition arrow

**Content:**
```
Section 2 Summary: Scale + Attention = Context

Key Concepts:
1. Attention: Dynamic weighting of surrounding words
2. Context changes meaning ("lead" example)
3. "Large" = Billions of parameters (pattern capacity)
4. Training learned patterns, not facts
5. Multi-head attention: Multiple perspectives

Engineering Parallel:
Composite design—components interact,
context determines contribution

Next: Why does AI confidently fabricate citations?
```

**Design Notes:**
- Numbered summary
- Engineering parallel emphasized
- Question leading to Part 3

**Speaker Notes:**
> Section 2 complete. Attention enables context-dependent understanding through dynamic weighting. "Large" refers to billions of parameters capturing complex patterns. Training learned text patterns, not factual knowledge. Engineering parallel: like composite materials where contributions depend on context and interactions. Now the critical question: If AI is pattern-completing, why does it fabricate realistic-looking citations? That's Part 3—most important section for scientists.

---

## SLIDE 23: Section Title - Truth vs. Probability

**Visual:**
- Bold divider
- Balance scale icon (unbalanced toward probability)

**Content:**
```
PART 3: TRUTH VS. PROBABILITY

Why Models Hallucinate
& How to Ground Them

The most critical section for scientists
```

**Design Notes:**
- Large title
- Balance scale tilted
- Stronger visual weight—critical content

**Speaker Notes:**
> Part 3: Truth versus probability. Most critical section for scientific work. You understand how AI works—words to coordinates, attention for context, pattern completion. Now we confront the danger: AI confidently generates fabricated information. Why does this happen? How do we prevent it? By the end, you'll understand hallucinations deeply enough to protect yourself and use AI responsibly.

---

## SLIDE 24: Real Example - Fabricated Citation

**Visual:**
- Realistic fake citation displayed
- Red "FABRICATED" stamp

**Content:**
```
The Hallucination Problem

You Ask: "Find papers on high-entropy alloy electrospinning"

AI Responds:
"Zhang, L., et al. (2021). 'Electrospun High-Entropy Alloy 
Nanofibers for Catalysis.' J. Mater. Chem. A, 9(15), 9876-9885. 
DOI: 10.1039/d1ta02847k"

Check CrossRef → DOI doesn't exist

But Looks Perfect:
✓ Realistic author (Zhang is common)
✓ Plausible title (combines your keywords)
✓ Real journal (J. Mater. Chem. A exists)
✓ Valid DOI format (10.1039/... correct for RSC)

COMPLETELY FABRICATED
```

**Design Notes:**
- Citation in professional format
- Green checkmarks showing what looks real
- Large red "FABRICATED" stamp
- Warning aesthetic

**Speaker Notes:**
> Real example of the problem. You ask for citations, AI provides this beautiful citation. Check every element: Zhang is common in materials science. Title combines your keywords. Journal is real and high-impact. DOI format is correct for Royal Society of Chemistry. Looks absolutely authentic. Problem: CrossRef check—DOI doesn't resolve. Paper doesn't exist. AI fabricated it. Not malicious—pattern completed a plausible citation. This is terrifying for scientists. If you trusted without checking, you might cite non-existent paper. This is why understanding hallucinations is critical.

---

## SLIDE 25: Why Hallucinations Happen

**Visual:**
- Step-by-step breakdown
- Pattern components highlighted

**Content:**
```
The Mechanism Behind Fabrication

Step 1: AI recognizes "You want citations"

Step 2: Knows citation format:
[Author] et al. ([Year]). "[Title]." [Journal], [Vol], [Pages]. DOI

Step 3: Generates plausible tokens:
• "Zhang" → Common surname
• "2021" → Recent year
• "Electrospun HEA..." → YOUR keywords
• "J. Mater. Chem. A" → Real journal
• "10.1039/..." → Valid DOI format

Each component is plausible
The combination doesn't exist

Pattern completion, not information retrieval
```

**Design Notes:**
- Three-step flowchart
- Each component labeled with probability
- Clear logical progression

**Speaker Notes:**
> Why this happens. When you ask for citations, AI recognizes the pattern and starts completing it. "Zhang"—high probability surname. "2021"—recent, plausible. Title—combines your keywords. Journal—real and relevant. DOI—correct format. Each piece is plausible based on training patterns. But—critical point—AI never checked if this combination exists. It stitched together probable components. Result: looks real, is fake. Pattern completion at its most dangerous.

---

## SLIDE 26: The Four Grounding Techniques

**Visual:**
- Four technique boxes
- Solution framework

**Content:**
```
How to Prevent Hallucinations

You can't eliminate them, but you can
DRAMATICALLY reduce them:

1. Explicit Constraint Instructions
   Force AI to admit ignorance vs. guess

2. RAG (Retrieval-Augmented Generation)
   Ground AI in your specific documents

3. Temperature Control
   Reduce randomness for technical tasks

4. Chain-of-Thought
   Force step-by-step reasoning

Next: Deep dive on each technique
```

**Design Notes:**
- Four boxes clearly separated
- Icons for each technique
- Solution-focused layout

**Speaker Notes:**
> Good news: while you can't eliminate hallucinations—fundamental to LLMs—you can dramatically reduce them. Four core techniques: Explicit constraints—tell AI "if you don't know, say so." RAG—provide specific documents, force citations. Temperature—reduce randomness, be conservative. Chain-of-thought—force explicit reasoning, catch errors early. Let's explore each.

---

## SLIDE 27: Technique 1 - Explicit Constraints

**Visual:**
- Before/after comparison
- Red X / Green checkmark

**Content:**
```
Technique 1: Explicit Constraints

Without Constraint:
"What is the tensile strength of PLA/graphene?"
→ AI generates plausible number (may be wrong)

With Constraint:
"Based ONLY on attached papers, extract tensile strength.
If no value reported, respond 'Not reported in provided sources.'
Do NOT estimate or use external knowledge."
→ AI admits ignorance instead of guessing

Key Phrase: "If unknown, state 'Not reported'—
             do not estimate"
```

**Design Notes:**
- Side-by-side comparison
- Key phrase highlighted
- Simple, actionable

**Speaker Notes:**
> Technique 1: Explicit constraints. Simplest and most effective. Without constraints, AI generates plausible number even if uncertain. With constraints, you explicitly instruct: "If no value, say 'Not reported.' Don't estimate." Now AI admits ignorance. Magic phrase: "if unknown, state 'Not reported'—do not estimate or use external knowledge." Single sentence dramatically reduces hallucinations. Why it works: clear instructions for handling uncertainty. Without them, defaults to pattern completion.

---

## SLIDE 28: Technique 2 - RAG

**Visual:**
- RAG architecture diagram
- Three-step process

**Content:**
```
Technique 2: RAG (Retrieval-Augmented Generation)

Problem: AI's knowledge frozen at training time

Solution: Give AI access to YOUR documents

How RAG Works:
1. Create document database (your papers/protocols)
2. Query retrieves relevant chunks automatically
3. AI generates using ONLY those chunks

Example:
You: "What temperature did Zhang use?"
RAG: [Retrieves Zhang paper, Section 3.2]
AI: "Zhang used 23±2°C (Section 3.2, p.8)"

Response grounded in actual text you provided
```

**Design Notes:**
- Three-step flow diagram
- Document icons
- Example with citation

**Speaker Notes:**
> Technique 2: RAG—game-changer for document work. Problem: AI's knowledge froze at training. Can't access your latest papers, protocols, proprietary data. RAG gives AI real-time access to your documents. Upload documents, they're chunked and embedded. Your query finds relevant chunks. AI responds using only those chunks, citing specifically. Critically: grounded in text you provided, not pattern-matched from training. Huge reduction in hallucinations. Tools like LlamaIndex, LangChain make this easy.

---

## SLIDE 29: Technique 3 & 4 - Temperature and Chain-of-Thought

**Visual:**
- Two techniques side by side
- Temperature scale + reasoning steps

**Content:**
```
Technique 3: Temperature Control
"Temperature" = Randomness in token selection

Low (0.0-0.3): Deterministic, conservative, factual
High (0.7-1.0): Creative, exploratory, risky

Use Low for: Data extraction, citations, technical work
Use High for: Brainstorming, creative tasks

Technique 4: Chain-of-Thought
Force AI to "show its work"

Instead of: "Is PLA/graphene aerospace-suitable?"
Use: "Analyze step-by-step: 1) Requirements?
     2) Properties? 3) Match/mismatch? 4) Assessment?"

Catches reasoning errors early
```

**Design Notes:**
- Split slide
- Temperature slider visual
- Step-by-step boxes for CoT

**Speaker Notes:**
> Techniques 3 and 4 together. Temperature: controls randomness. Low temperature (0.1)—conservative, picks most probable token, fewer hallucinations. High (0.9)—creative, explores alternatives, more risk. For technical work, use low. For brainstorming, use high. Chain-of-thought: force explicit reasoning. Instead of quick answer, require step-by-step analysis. Catches nuance quick answers miss. Like peer review during writing, not after. Essential for complex assessments.

**Live Demo (if time allows):**
> Open sandbox (Ollama). Show temperature setting in interface. Test with same query at different temperatures:
> 
> Query: "Suggest 3 alternative solvents for dissolving PLA"
> 
> Temperature 0.1: "DMF, chloroform, and dichloromethane are the most commonly used solvents for dissolving PLA."
> (Conservative, predictable, common choices)
> 
> Temperature 0.9: "While DMF is standard, consider exploring 1,4-dioxane for specific molecular weight control, or γ-butyrolactone for more environmentally conscious processing, or even acetone-hexafluoroisopropanol mixtures for specialized applications."
> (Creative, diverse, explores alternatives)
> 
> Point out: Low temperature = safer for data extraction. High temperature = useful for brainstorming novel approaches.
> 
> Invite participants to try in their sandbox after session.

---

## SLIDE 30: Verification Checklist

**Visual:**
- Practical checklist format
- Risk tiers color-coded

**Content:**
```
Practical Verification Checklist

Before Trusting AI Output:
□ Citations are real (DOI resolves, authors match)
□ Numbers are reasonable (within known ranges)
□ Units are correct (MPa not GPa, unless appropriate)
□ Methods exist (no "nano-quantum-XPS" fabrications)
□ Logic is sound (no contradictions)
□ Sources are primary (not vague "studies show...")

Risk-Based Approach:
Low Risk: Quick spot-check
Medium Risk: Verify citations and key facts
High Risk: Full verification, multiple sources
```

**Design Notes:**
- Checkbox format (printable)
- Three-tier risk levels
- Red/yellow/green coding

**Speaker Notes:**
> Practical checklist for verification. Six key checks before trusting output: citations real, numbers reasonable, units correct, methods exist, logic sound, sources primary. Apply risk-based approach: low risk (general knowledge)—quick check. Medium risk (specific claims)—verify citations. High risk (critical decisions, safety, IP)—full verification, cross-reference. This becomes second nature. AI is tool, not oracle. Your expertise is final arbiter.

---

## SLIDE 31: Red Flags

**Visual:**
- Warning signs with icons
- Real examples

**Content:**
```
Red Flags: Heightened Skepticism Required

🚩 Suspiciously round numbers (exactly 100°C, 5.0 GPa)
🚩 Excessive precision (87.34256°C when ±2°C precision)
🚩 Vague attributions ("studies show" without citation)
🚩 Impossible combinations (high modulus AND ductility)
🚩 Nonexistent techniques (quantum-resolution methods)
🚩 Perfect results (no error bars, no uncertainties)

If it sounds too good to be true, verify extensively

Your domain expertise is your best defense
```

**Design Notes:**
- Red flag icons prominent
- Examples italicized
- Warning emphasis

**Speaker Notes:**
> Red flags signaling heightened skepticism. Suspiciously round numbers—nature isn't that neat. Excessive precision beyond measurement capability—fabricated. Vague attributions—hallucination territory. Impossible combinations—rare, needs verification. Nonexistent techniques—quantum-resolution anything usually fake. Perfect results—not real science. Bottom line: if it sounds too good to be true, verify extensively. Your domain expertise is your best defense. Trust your instincts. If it feels wrong, it probably is.

---

## SLIDE 32: Day 3 Summary & Takeaways

**Visual:**
- Three-part summary
- Key actions listed

**Content:**
```
What You've Learned Today

Part 1: NLM Foundations
Words → Coordinates in semantic space
(Like materials in property space)

Part 2: The "Large" in LLM
Attention + Scale = Context understanding
(Pattern matching, not knowledge)

Part 3: Truth vs. Probability
AI prioritizes plausibility over truth
→ Use grounding techniques (constraints, RAG, temperature, CoT)
→ Always verify

Practical Takeaways:
✓ Never trust citations without verification
✓ Use RAG for document-based tasks
✓ Set low temperature (0.1-0.2) for technical work
✓ Apply domain expertise—if it sounds wrong, it is

You now understand AI better than 95% of users
```

**Design Notes:**
- Three-section recap
- Key takeaways bulleted
- Confidence-building message

**Speaker Notes:**
> Day 3 complete. Part 1: Words become coordinates—semantic space parallel to property space. Part 2: Large models use attention for context—pattern matching, not knowledge. Part 3: AI prioritizes probability over truth—hallucinations predictable and preventable with grounding techniques. Practical takeaways: never trust citations without verification, use RAG for documents, low temperature for technical work, apply your expertise. You understand AI better than 95% of users. You know how it works, why it fails, how to prevent failures. Tomorrow: Green AI and advanced optimization. Excellent work!

---

## END OF DAY 3 SLIDES

---

## APPENDIX: Facilitation Notes

### Timing Guidance (Flexible)

- Welcome & Recap: 5 min
- Part 1 (NLM Foundations): 25-30 min
- Part 2 (LLM Scaling): 25-30 min
- Part 3 (Hallucinations): 30-35 min
- Wrap-up: 5 min

**Total: ~90 minutes (adjust based on engagement)**

**Note:** Time blocks removed from main slides. Flow is conceptual, not rigid.

---

### Interactive Elements (Reduced)

Essential interactions only:
- 2-3 Quick polls (show of hands)
- 1 Live demonstration (hallucination check if time allows)
- Q&A breaks between parts (brief)

**Removed:**
- Think-pair-share activities
- Extended group discussions
- Volunteer sharing sessions
- Multiple live demos

**Rationale:** Tighter time management, streamlined delivery

---

### Materials Needed

- Laptop with slides
- Projector/screen
- Whiteboard for ad-hoc explanations
- Participants need: Laptops, website access
- Optional: CrossRef access for verification demo

---

### Key Messages to Drive Home

1. **AI is pattern matching, not knowledge retrieval**
2. **Confidence ≠ Accuracy** (Most critical for scientists)
3. **Always verify, especially citations and numbers**
4. **Grounding techniques are non-optional for scientific work**
5. **Your domain expertise is final arbiter**

---

### Adaptation Notes

- Slides optimized for ~90 minutes
- Conceptual flow emphasized over time blocks
- Simpler speaker notes (streamlined)
- Reduced interactivity for efficiency
- Materials table updated exactly per content
- PTFE added, PLA removed from property space examples
- All analogies maintained but simplified

---

### Troubleshooting

- If running over: Condense Part 1 (simpler), maintain Part 3 (critical)
- If ahead: Add Q&A time, expand verification examples
- If engagement drops: Quick poll, real example, whiteboard visual
- Technical questions: Answer briefly, defer deep dives to website

---

**END OF INSTRUCTOR SLIDES DOCUMENT**
