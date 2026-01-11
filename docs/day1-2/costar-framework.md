# The CO-STAR Framework

The **CO-STAR Framework** is designed for context-heavy communication where rich background information is essential for quality outputs. It's particularly effective for reports, summaries, and strategic documents.

---

## Framework Components

**CO-STAR** is an acronym for:

| Component | What It Means | Why It Matters |
|-----------|---------------|----------------|
| **C** | **Context** | Background information and situation |
| **O** | **Objective** | The goal you want to achieve |
| **S** | **Style** | Writing style and approach |
| **T** | **Tone** | Voice and emotional quality |
| **A** | **Audience** | Who will read/use this output |
| **R** | **Response** | Format and structure of output |

---

## Component Breakdown

### C – Context

**Provide rich background information.**

This includes:
- Current situation
- Why this task is needed
- Relevant constraints
- Historical background
- Related work

**Example:**

```
Context: AmaDema is preparing for a Series A funding round focused 
on sustainable materials. We need to demonstrate our non-oxide 
ceramic nanofibers' environmental advantages over traditional 
polymer competitors. Our target investors prioritise ESG 
(Environmental, Social, Governance) metrics. We have strong 
technical data but lack compelling narrative for non-technical 
stakeholders.
```

---

### O – Objective

**Define the specific goal.**

**Be explicit about what success looks like:**

❌ "Write about our materials"  
✅ "Create a compelling narrative that positions our non-oxide ceramics as the sustainable alternative to PLA, emphasising lifecycle carbon footprint reduction of 40%"

---

### S – Style

**Define the writing approach.**

**Common styles:**

- **Academic:** Structured, cited, peer-review quality
- **Journalistic:** Engaging, story-driven, accessible
- **Technical:** Precise, data-rich, domain-specific
- **Executive:** High-level, business-focused, concise
- **Conversational:** Friendly, approachable, informal

**Example:**

```
Style: Journalistic with technical credibility—engaging narrative 
for non-scientists, but backed by quantitative data. Think 
"Nature News" rather than primary research article.
```

---

### T – Tone

**Set the emotional quality and voice.**

**Scientific tones:**

- **Confident:** Asserting leadership position
- **Cautious:** Emphasising uncertainty, safety
- **Inspirational:** Vision-driven, future-focused
- **Objective:** Neutral, evidence-based
- **Urgent:** Emphasising timeliness, action needed

**Example:**

```
Tone: Confident but not arrogant. Emphasise innovation and 
environmental responsibility. Avoid hype—let data speak. 
Inspire confidence in our technical capability.
```

---

### A – Audience

**Define who will consume this.**

**Key questions:**

- What is their technical background?
- What are their priorities/concerns?
- What do they already know?
- What terminology level is appropriate?

**Example:**

```
Audience: Venture capital investors with general business 
background (not materials science experts). Familiar with 
sustainability concepts but need help understanding technical 
differentiation. Sceptical of greenwashing—want hard data.
```

---

### R – Response Format

**Specify structure and length.**

**Examples:**

```
Response: 2-page executive summary with:
- Opening hook (1 paragraph)
- Problem statement (2 paragraphs)
- Our solution (3 paragraphs)
- Market opportunity (2 paragraphs)
- Competitive advantage (2 paragraphs)
- Call to action (1 paragraph)

Include 2-3 data visualisation callouts (we'll create separately).
```

---

## Complete CO-STAR Example

### Scenario: Investor Pitch Document

**Prompt:**

```
[C] Context: AmaDema is a 3-year-old nanotechnology startup 
specialising in non-oxide ceramic nanofibers produced via 
electrospinning. We're preparing for Series A funding ($5M target) 
focused on scaling our sustainable materials platform. Our core 
innovation is a novel synthesis route that reduces carbon footprint 
by 40% vs. traditional PLA while maintaining comparable mechanical 
properties. We have IP protection (2 granted patents, 3 pending), 
pilot-scale production facility (500kg/month capacity), and 3 
industry partners (aerospace, automotive, biomedical). Competitors 
include PolyMat GmbH (Germany, polymer focus) and Nanotech Solutions 
(US, oxide ceramics only). Our target investors prioritise ESG 
metrics and deep-tech with clear commercialisation path.

[O] Objective: Create an executive summary for our pitch deck that 
positions AmaDema as the leading sustainable alternative to polymer 
nanofibers, emphasising our environmental advantages, technical 
moat, and clear path to profitability. Goal is to secure meetings 
with 15 VC firms over next quarter.

[S] Style: Professional but engaging. Think TechCrunch feature 
article meets technical white paper executive summary. Use 
storytelling to make technical innovation accessible, but back 
every claim with quantitative data. Structure should flow naturally 
while hitting all key investment criteria (market, technology, 
team, traction, ask).

[T] Tone: Confident and visionary, but grounded in evidence. 
Emphasise "inevitable future" of sustainable materials rather than 
speculative opportunity. Inspire FOMO (fear of missing out) on 
a transformative materials platform. Avoid hype language—let metrics 
do the talking. Professional but not stuffy.

[A] Audience: Venture capital partners and principals at deep-tech 
focused firms (e.g., DCVC, Lux Capital, Breakthrough Energy 
Ventures). They understand business fundamentals and sustainability 
trends, but not materials science details. Familiar with terms like 
"carbon footprint" and "lifecycle analysis" but need help 
understanding why non-oxide ceramics are technically superior. 
Sceptical of greenwashing—require hard data. Decision criteria: 
market size, defensibility, team quality, capital efficiency, exit 
potential.

[R] Response: 2-page executive summary (approximately 800 words) with:

Section 1: Opening Hook (1 paragraph)
- Lead with compelling problem/opportunity
- Immediately establish market urgency

Section 2: The Problem (2 short paragraphs)
- Why current polymer nanofibers inadequate
- Environmental and performance limitations

Section 3: Our Solution (3 paragraphs)
- Non-oxide ceramic nanofibers overview
- Key technical innovation (synthesis route)
- Quantitative advantages (carbon footprint, properties)

Section 4: Market Opportunity (2 paragraphs)
- TAM/SAM/SOM framework
- Target applications (aerospace, automotive, biomedical)

Section 5: Competitive Advantage & IP Moat (2 paragraphs)
- What makes us defensible
- Patent portfolio and technical barriers

Section 6: Traction & Milestones (1-2 paragraphs)
- Current partnerships
- Production capacity
- Recent achievements

Section 7: The Ask (1 paragraph)
- Funding amount and use of funds
- Next milestones
- Clear call to action

Include [DATA VISUALISATION CALLOUT] markers where we should insert 
charts (we'll create separately). 

Use bold for key metrics. Keep paragraphs under 100 words.
```

---

## AUTOMAT vs. CO-STAR: When to Use Each

### Use AUTOMAT When:

✅ Task is **functional and structured** (data extraction, formatting)  
✅ Output format is clearly defined (tables, lists, code)  
✅ Precision and reproducibility are critical  
✅ Minimal context needed  

**Example tasks:** Literature data extraction, protocol formatting, data analysis scripts

---

### Use CO-STAR When:

✅ Task requires **rich contextual understanding**  
✅ Output is narrative or strategic (reports, pitches, summaries)  
✅ Audience considerations are complex  
✅ Style and tone significantly impact effectiveness  

**Example tasks:** Executive summaries, investor pitches, strategic reports, literature reviews with interpretation

---

## Materials Science Example: Literature Review

### Using CO-STAR for Research Synthesis

```
[C] Context: I'm preparing the introduction section for a manuscript 
on PLA/graphene nanocomposites being submitted to Polymer journal. 
The field is crowded with incremental studies, but most fail to 
address the scalability challenges of graphene dispersion. Our work 
introduces a novel in-situ reduction approach during electrospinning 
that achieves uniform dispersion at industrial-relevant concentrations 
(>5 wt%). Reviewers will be experts in polymer nanocomposites. The 
introduction needs to establish the research gap that justifies our 
study while acknowledging prior work comprehensively.

[O] Objective: Create a literature review synthesis for the 
introduction (approximately 1000 words) that: (1) establishes the 
promise of PLA/graphene composites, (2) identifies the critical 
challenge of graphene dispersion at high loadings, (3) reviews 
existing approaches and their limitations, (4) sets up our in-situ 
reduction approach as the logical next step.

[S] Style: Academic, suitable for peer-reviewed journal. Follow 
Polymer journal's convention of critical synthesis rather than 
exhaustive listing. Use topic sentences to guide reader through 
logical argument. Balance breadth (covering field) with depth 
(analysing key studies). Integrate citations naturally into prose 
rather than citation-heavy listing.

[T] Tone: Authoritative but respectful of prior work. Identify gaps 
without dismissing others' contributions. Build logical case for 
our approach without over-selling. Objective analysis of field state.

[A] Audience: Polymer scientists and materials engineers with 
expertise in nanocomposites. Assume familiarity with electrospinning 
and graphene chemistry. No need to define basic terms (PLA, 
graphene oxide, in-situ reduction), but explain domain-specific 
methods. Reviewers will fact-check citations—accuracy critical.

[R] Response: 4-paragraph structure (approximately 250 words each):

Paragraph 1: Promise of PLA/graphene
- Mechanical property enhancement potential
- Sustainability advantages
- Application opportunities

Paragraph 2: The dispersion challenge
- Aggregation at high loadings
- Impact on properties
- Why this limits commercialisation

Paragraph 3: Existing approaches and limitations
- Ex-situ methods (sonication, surfactants)
- In-situ polymerisation approaches
- Critical analysis of each

Paragraph 4: Gap and our approach
- What's missing: scalable in-situ method
- Preview our solution (without methods details)
- Research questions

Cite 30-40 key papers, prioritising recent (<5 years) and 
high-impact journals (Polymer, Composites A, Carbon). Mark citation 
format as [Author Year] for now.
```

---

## Combining AUTOMAT and CO-STAR

For complex tasks, you can **use both frameworks sequentially**:

### Step 1: Use CO-STAR for narrative/synthesis
Generate the prose, interpretation, or strategic content

### Step 2: Use AUTOMAT for data extraction/formatting
Extract structured data to support the narrative

**Example workflow:**

1. **CO-STAR prompt:** "Write executive summary of our sustainability advantage"
2. **Review output:** Identify where specific data would strengthen argument
3. **AUTOMAT prompt:** "Extract lifecycle carbon footprint data from these 5 papers in a comparison table"
4. **Integrate:** Insert table into executive summary

---

## Exercise: CO-STAR for Strategic Communication

!!! question "Challenge"
    **Scenario:** AmaDema's R&D Director asked you to write a brief 
    (1-page) internal memo explaining why the team should adopt AI 
    tools for literature review, addressing common concerns about 
    accuracy and IP security.
    
    **Your task:** Construct a complete CO-STAR prompt for this task.
    
    **Consider:**
    - What context does the R&D Director need?
    - What's your objective beyond "explain AI tools"?
    - What style/tone will be persuasive for scientists?
    - How should you structure the response?
    
    **Test in sandbox** and evaluate whether output would be 
    convincing to your colleagues.

---

## Common Mistakes to Avoid

### ❌ Mistake 1: Context Overload

**Bad:**
```
Context: [3000 words of background]
```

**Good:**
```
Context: [200 words of essential background, focused on what's 
necessary for this specific task]
```

**Rule:** Include context relevant to *this output*, not your entire company history.

---

### ❌ Mistake 2: Vague Objective

**Bad:**
```
Objective: Write something good about our materials
```

**Good:**
```
Objective: Position our non-oxide ceramics as the sustainable 
alternative that justifies 20% price premium by emphasising 
lifecycle cost savings and regulatory advantages
```

---

### ❌ Mistake 3: Style/Tone Confusion

**Bad:**
```
Style and Tone: Professional
```

**Good:**
```
Style: Academic synthesis with critical analysis (Polymer journal 
conventions)
Tone: Authoritative but respectful of prior work; objective analysis 
rather than promotional
```

---

**Next:** [Responsible AI & Risk Management](responsible-ai.md) – Protect your IP whilst leveraging AI tools →
