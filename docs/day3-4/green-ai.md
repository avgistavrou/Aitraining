# Green AI Practices

!!! warning "The Environmental Cost of AI"
    **Every query you make has an environmental footprint.**
    
    - 💧 ChatGPT uses ~0.5 litres of fresh water per 20-50 prompts
    - 🔥 Inference emissions can exceed training emissions within weeks
    - ⚡ Data centres consume massive energy, ~40% for cooling alone
    - 🌍 2/3 of new US data centres are in water-scarce areas

Your choices as a user directly impact this consumption.

---

## The Full Lifecycle Cost

AI's environmental impact extends far beyond training:

### 1. Raw Material Extraction

Manufacturing GPUs and processors requires:
- Rare earth minerals (mining impact)
- Water-intensive semiconductor fabrication
- Energy-intensive component production

---

### 2. Training (One-Time Cost)

**Example: GPT-3 Training**
- **CO₂ emissions:** 85,000 kg (equivalent to 112 cars for a year)
- **Energy:** ~1,287 MWh
- **Water:** Thousands of litres (indirect, via data centre cooling)

**But:** Training happens once. Inference (usage) is the ongoing cost.

---

### 3. Inference (Ongoing Cost)

**This is where users have impact.**

Every time you query an LLM:
- Servers process millions of operations
- Cooling systems activate
- Fresh water is consumed
- Carbon is emitted

**Scale:** Popular models serve billions of queries. Your individual queries add up.

---

### 4. Data Centre Operations

**Cooling requirements:**
- ~40% of data centre energy goes to cooling
- Water-cooled systems consume litres per hour
- Air cooling increases electricity demand

**Location matters:**
- Many data centres in water-scarce regions (e.g., Arizona, Nevada)
- Competes with agricultural and municipal water use

---

### 5. End-of-Life

- Hardware disposal and e-waste
- Component recycling challenges
- Obsolescence cycles (rapid hardware upgrades)

---

## Measuring Your Impact

### Estimating Carbon Footprint

**Rough calculations:**

| Query Type | Tokens | Energy (kWh) | CO₂ (g) | Water (mL) |
|------------|--------|--------------|---------|------------|
| Simple question | ~100 | 0.001 | 0.5 | 10 |
| Complex prompt | ~500 | 0.005 | 2.5 | 50 |
| Multi-turn conversation (10 turns) | ~2000 | 0.02 | 10 | 200 |
| Full document processing | ~10,000 | 0.1 | 50 | 1000 |

**Annual impact for typical researcher:**
- 100 queries/week
- ~5,000 queries/year
- **~125 kg CO₂/year** (equivalent to 800 km of driving)
- **~250 litres of water/year**

---

## Green AI Strategies

### Strategy 1: Think Before You Prompt

**The Problem:** Rapid-fire, unplanned queries waste computational resources.

**The Solution:** **Plan your query before hitting enter.**

#### Bad Practice: Stream-of-Consciousness Querying

```
[Query 1] "What is PLA?"
[Query 2] "Ok, what about graphene?"
[Query 3] "How do they combine?"
[Query 4] "What are the properties?"
[Query 5] "What synthesis methods exist?"
[Query 6] "Which is best?"
```

**Total:** 6 queries, ~3000 tokens, ~15 mL water, ~7.5 g CO₂

---

#### Good Practice: Planned, Batched Query

```
[Query 1] "Explain PLA/graphene nanocomposites including: 
(1) materials overview, (2) synthesis methods, (3) key properties, 
(4) advantages/disadvantages of each synthesis approach. 
Assume materials science background."
```

**Total:** 1 query, ~500 tokens, ~50 mL water, ~2.5 g CO₂

**Savings:** 83% reduction in environmental impact

---

### Strategy 2: Batch Similar Queries

**The Problem:** Processing items one-by-one multiplies overhead.

**The Solution:** **Batch similar tasks into single queries.**

#### Example: Literature Review

**Inefficient:**
```
"Summarise Paper 1 about PLA synthesis"
"Summarise Paper 2 about PLA synthesis"
"Summarise Paper 3 about PLA synthesis"
[Repeat 20 times...]
```

**Efficient:**
```
"Summarise the following 20 papers on PLA synthesis. For each, 
extract: (1) synthesis method, (2) key parameters, (3) main findings. 
Output as markdown table with columns: [Author Year, Method, 
Parameters, Findings]

Papers:
1. [Title, DOI]
2. [Title, DOI]
...
20. [Title, DOI]"
```

**Savings:** ~80% reduction (overhead consolidated)

---

### Strategy 3: Cache and Reuse Outputs

**The Problem:** Re-generating identical or similar content.

**The Solution:** **Save outputs for reuse.**

#### Scenario: Monthly Literature Reviews

**Inefficient:**
```
Month 1: Query AI for full literature review (100 papers)
Month 2: Query AI for full literature review (100 papers + 10 new)
Month 3: Query AI for full literature review (110 papers + 8 new)
```

**Each month:** Regenerating summaries of papers you've already processed.

---

**Efficient:**
```
Month 1: Query AI for full review (100 papers) → Save output
Month 2: Query AI ONLY for 10 new papers → Append to saved output
Month 3: Query AI ONLY for 8 new papers → Append to saved output
```

**Savings:** 90% reduction in computational cost after first month

---

#### Implementation

**Create a knowledge base:**
- Store AI-generated summaries in structured format
- Tag by topic, date, keywords
- Only process genuinely new content
- Update existing entries only when new data emerges

---

### Strategy 4: Use Smaller Models

**The Problem:** Using GPT-4 for tasks that Llama 8B can handle.

**The Solution:** **Match model size to task complexity.**

#### Model Selection Framework

| Task Complexity | Model | Example |
|----------------|-------|---------|
| Simple formatting | Llama 3.3 8B | Convert lab notes to template |
| Routine analysis | Llama 3.3 70B | Literature summary |
| Complex reasoning | GPT-4 / Claude Opus | Patent strategy, research proposals |

**Energy comparison:**
- Llama 8B: 1× energy
- Llama 70B: ~5× energy
- GPT-4: ~20× energy

**Savings from right-sizing:** 80-95% reduction for appropriate tasks

---

### Strategy 5: Optimize Prompt Efficiency

**The Problem:** Verbose, inefficient prompts waste tokens.

**The Solution:** **Engineer concise prompts that get results in one attempt.**

#### Before Optimization

```
Prompt: "Hi! I was wondering if you could help me with something. 
I'm working on a project involving polymers, specifically PLA, and 
I've been reading about how people add nanofillers to improve the 
properties. I've seen graphene mentioned a lot. Could you maybe tell 
me about what kinds of properties get better when you add graphene 
to PLA? Like, does it make it stronger? And also, I'm curious about 
how much graphene you typically add. Is it a lot or just a little bit?"
```

**Problems:**
- Conversational filler ("Hi!", "I was wondering")
- Unfocused rambling
- Multiple vague questions
- Requires clarification rounds

**Estimated:** 3-4 iterations to get useful output

---

#### After Optimization

```
Prompt: "Quantitative effects of graphene loading (1-10 wt%) on PLA 
nanocomposite properties: tensile strength, Young's modulus, 
elongation at break. Cite typical values from literature. Table format."
```

**Improvements:**
- Direct task specification
- Quantitative scope defined
- Output format specified
- One iteration to useful output

**Savings:** 70% fewer tokens, 75% fewer iterations

---

### Strategy 6: Leverage Templates

**The Problem:** Recreating prompts for recurring tasks.

**The Solution:** **Create reusable prompt templates.**

#### Template Example: Protocol Formatting

**Template:**
```
Act as a Laboratory Documentation Specialist.

Task: Convert the following lab notebook entry into ISO-compliant 
synthesis protocol format.

Output format:
1. Materials (with CAS numbers, suppliers, purity)
2. Equipment (with model numbers)
3. Procedure (numbered steps, with times and temperatures)
4. Safety considerations
5. Expected outcomes

Constraints:
- If information is missing, mark as [TO BE DETERMINED]
- Do not speculate on values
- Use SI units throughout

Lab notebook entry:
[PASTE ENTRY HERE]
```

**Usage:**
1. Save template
2. Only replace `[PASTE ENTRY HERE]` each time
3. Consistent, high-quality outputs
4. No prompt engineering overhead per use

**Savings:** 90% reduction in time and tokens for recurring tasks

---

### Strategy 7: Implement Local Models for Sensitive/Repetitive Work

**The Problem:** Cloud-based models have both environmental and security costs.

**The Solution:** **Run models locally for appropriate tasks.**

#### When to Use Local Models

✅ **Sensitive data** (Red List items)  
✅ **Highly repetitive tasks** (processing thousands of items)  
✅ **Offline environments** (field work, secure facilities)  
✅ **Cost-sensitive applications** (high-volume processing)

#### Environmental Benefits

**Cloud inference (per query):**
- Energy: Model computation + data centre overhead + cooling
- Water: Data centre cooling systems
- Carbon: Grid electricity (often non-renewable)

**Local inference (per query):**
- Energy: Model computation only (your laptop)
- Water: Minimal (your device cooling)
- Carbon: Your local grid (potentially renewable)

**Savings:** 30-70% reduction depending on local energy source

---

### Strategy 8: Choose Green Providers

**The Problem:** Not all AI providers are equal environmentally.

**The Solution:** **Prioritise providers using renewable energy.**

#### Provider Comparison

| Provider | Renewable Energy Commitment | Notes |
|----------|----------------------------|-------|
| **Google (Gemini)** | High (carbon-neutral since 2007) | 24/7 carbon-free energy goal by 2030 |
| **Microsoft (Copilot)** | High (carbon negative by 2030) | Investing in renewable data centres |
| **OpenAI (ChatGPT)** | Moderate | Uses Azure infrastructure |
| **Anthropic (Claude)** | Moderate | Uses cloud providers with green commitments |
| **Local (Llama)** | **Depends on your grid** | Best if you have renewable energy access |

**Your choice matters:** If your organisation has renewable energy, local models are most sustainable.

---

## Quantization and Distillation

### Advanced Optimization Techniques

#### Quantization

**What it is:** Running models at lower numerical precision

**How it works:**
- Standard: 16-bit or 32-bit floating point
- Quantized: 8-bit or 4-bit integer precision

**Benefits:**
- 2-4× faster inference
- 50-75% less memory
- 40-60% less energy

**Trade-off:** Slight accuracy reduction (typically <2% for well-quantized models)

**When to use:** Production deployment of local models for routine tasks

---

#### Distillation

**What it is:** Training a small model using a large model as teacher

**How it works:**
1. Large model (e.g., GPT-4) generates responses to 1000 examples
2. Small model (e.g., Llama 8B) is fine-tuned on these responses
3. Small model learns to mimic large model's behaviour for specific domain

**Benefits:**
- 10-100× faster inference
- 80-95% less energy per query
- Maintains quality for domain-specific tasks

**Best for:** Highly repetitive, domain-specific tasks (e.g., weekly literature reviews on same topic)

---

## The Green Optimization Challenge

!!! question "Challenge: Refactor for Efficiency"
    
    **Given:** Your colleague's inefficient prompt chain (below)
    
    **Task:** Refactor into minimum queries whilst maintaining quality
    
    **Scoring:**
    - Functionality (20 pts): Does it work?
    - Efficiency (30 pts): How many queries?
    - Quality (30 pts): Output comparable to original?
    - Innovation (20 pts): Creative optimisation approaches?

### The Inefficient Chain

Your colleague wants to understand PLA/graphene electrospinning for a new project:

```
Query 1: "What is polylactic acid?"
[Reads response]

Query 2: "What are the properties of PLA?"
[Reads response]

Query 3: "What is graphene?"
[Reads response]

Query 4: "What is graphene oxide?"
[Reads response]

Query 5: "How do graphene and graphene oxide differ?"
[Reads response]

Query 6: "What is electrospinning?"
[Reads response]

Query 7: "How does electrospinning work for polymers?"
[Reads response]

Query 8: "Can you add nanofillers during electrospinning?"
[Reads response]

Query 9: "What are the challenges of dispersing graphene in PLA?"
[Reads response]

Query 10: "What are typical electrospinning parameters for PLA?"
[Reads response]

Query 11: "How does graphene content affect fiber properties?"
[Reads response]

Query 12: "What are best practices for PLA/graphene electrospinning?"
[Final answer]
```

**Total:** 12 queries, ~6000 tokens, ~300 mL water, ~30 g CO₂  
**Time:** 15-20 minutes (with reading between queries)

---

### Your Optimised Solution

**Construct:** 1-2 prompts that achieve the same learning outcome

**Hints:**
- What's the actual goal? (Understanding PLA/graphene electrospinning)
- What context can be provided upfront? (Assume materials science background)
- Can you batch all questions? (Comprehensive prompt)
- Should you use CO-STAR or AUTOMAT? (Learning vs. task)

**Test in sandbox** and compare:
- Quality of understanding
- Time to useful knowledge
- Token usage

---

## Real-World Impact: AmaDema Case Study

### Scenario: Weekly Literature Monitoring

**Task:** Stay current on PLA/graphene research (new papers each week)

#### Before Training (Inefficient)

**Approach:**
- Every Friday: Ask ChatGPT to "summarise recent research on PLA/graphene"
- 20-30 papers mentioned
- 5-10 follow-up queries for clarification
- Regenerates summaries of papers from previous weeks

**Weekly cost:**
- 10-15 queries
- ~8000 tokens
- ~400 mL water
- ~20 g CO₂

**Annual cost:**
- ~600 queries
- ~384,000 tokens
- ~19,200 mL water (19.2 litres)
- ~960 g CO₂

---

#### After Training (Optimised)

**Approach:**
1. **Month 1:** Comprehensive review of 100 key papers → Cache results
2. **Week 2+:** Only process papers published since last check
   - Use Google Scholar alerts for new papers (automated)
   - Process only new DOIs (typically 3-5 per week)
   - Batch all new papers in single query
   - Append to cached knowledge base

**Weekly cost:**
- 1-2 queries
- ~1000 tokens
- ~50 mL water
- ~2.5 g CO₂

**Annual cost:**
- ~75 queries
- ~48,000 tokens
- ~2,400 mL water (2.4 litres)
- ~120 g CO₂

---

#### Impact Summary

| Metric | Before | After | Reduction |
|--------|--------|-------|-----------|
| Queries/year | 600 | 75 | **87.5%** |
| Water usage | 19.2 L | 2.4 L | **87.5%** |
| CO₂ emissions | 960 g | 120 g | **87.5%** |
| Time spent | ~50 hours | ~6 hours | **88%** |

**Same quality outcome, 88% less environmental impact.**

---

## Ethical Considerations

### The Choice Not to Use AI

**It is valid and principled** to limit or avoid AI use based on environmental concerns.

**Alternative approaches:**
- Traditional literature reviews (manual)
- Collaborative knowledge sharing (team discussions)
- Structured databases (manual curation)
- Hybrid approaches (minimal AI, maximal human insight)

**When AI provides marginal benefit:** Consider whether environmental cost justifies use.

---

### Transparency in AI Use

**Be transparent** about AI usage and its environmental impact:

- Document AI use in research methods
- Report optimisation strategies
- Share templates and efficient approaches
- Advocate for green AI in your organisation

---

## Action Items for AmaDema

### Individual Level

- [ ] Audit your current AI usage (how many queries/week?)
- [ ] Identify recurring tasks suitable for templates
- [ ] Implement caching for literature reviews
- [ ] Use smallest model that meets quality threshold
- [ ] Batch queries wherever possible

---

### Team Level

- [ ] Create shared prompt template library
- [ ] Establish cached knowledge base for common topics
- [ ] Set guidelines for model selection
- [ ] Monitor and report token usage
- [ ] Share efficiency best practices

---

### Organisational Level

- [ ] Invest in local model infrastructure
- [ ] Prioritise renewable energy for servers
- [ ] Set carbon budget for AI usage
- [ ] Include environmental impact in AI training
- [ ] Recognise and reward green AI practices

---

## Exercise: Calculate Your Footprint

!!! question "Challenge"
    
    **Estimate your current AI carbon footprint:**
    
    1. How many AI queries do you make per week? _____
    2. Average tokens per query (simple=100, complex=500, document=2000)? _____
    3. Calculate annual impact:
       - Queries/year = Queries/week × 52
       - Tokens/year = Queries/year × Avg tokens
       - CO₂ = Tokens/year × 0.005 g/token
       - Water = Tokens/year × 0.1 mL/token
    
    **Now identify 3 optimizations** you can implement:
    
    1. _____________________
    2. _____________________
    3. _____________________
    
    **Recalculate with optimizations.** What's your % reduction?

---

**Next:** [Optimisation Strategies](optimisation.md) – Practical techniques for efficient prompting →
