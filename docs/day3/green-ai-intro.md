# Green AI: Introduction

!!! warning "The Environmental Cost of AI"
    **Every query you make has an environmental footprint.**
    
    - 💧 ChatGPT uses ~0.5 litres of fresh water per 20-50 prompts
    - 🔥 Inference emissions can exceed training emissions within weeks
    - ⚡ Data centres consume massive energy, ~40% for cooling alone
    - 🌍 2/3 of new US data centres are in water-scarce areas

Your choices as a user directly impact this consumption.

---

## Why Green AI Matters

### The Scale Problem

**Individual perspective:** "My 100 queries/week seems insignificant"

**Global perspective:** 
- ChatGPT serves ~100 million weekly active users
- If each makes 50 queries/week → 5 billion queries/week
- 5 billion × 10 mL water = 50 million litres/week
- 5 billion × 2.5 g CO₂ = 12,500,000 kg CO₂/week

**Your contribution matters in aggregate.**

---

### The Responsibility Question

**Who is responsible for AI's environmental impact?**

1. **Model developers:** Training efficiency, model optimization
2. **Infrastructure providers:** Renewable energy, cooling efficiency
3. **End users (YOU):** Query efficiency, tool selection, batching

**All three share responsibility.** You control #3.

---

## The Full Lifecycle Cost

AI's environmental impact extends far beyond training.

### 1. Raw Material Extraction

Manufacturing GPUs and processors requires:
- **Rare earth minerals:** Mining with significant environmental disruption
- **Water-intensive fabrication:** Semiconductor plants use millions of litres daily
- **Energy-intensive production:** Component manufacturing generates substantial CO₂

**Example:** One NVIDIA H100 GPU (used in AI data centres) requires:
- Rare earth elements (neodymium, dysprosium, praseodymium)
- ~2000 L of water (fabrication process)
- ~500 kg CO₂ equivalent (manufacturing emissions)

---

### 2. Training (One-Time Cost)

**Example: GPT-3 Training**
- **CO₂ emissions:** 85,000 kg (equivalent to 112 cars for a year)
- **Energy:** ~1,287 MWh (average UK home uses 3.5 MWh/year)
- **Water:** Thousands of litres (indirect, via data centre cooling)
- **Time:** Weeks to months of continuous computation

**Important:** Training happens once. The model is then reused billions of times.

---

### 3. Inference (Ongoing Cost)

**This is where users have the most impact.**

Every time you query an LLM:
- Servers process millions of operations
- Cooling systems activate (consuming water)
- Electricity is consumed (generating CO₂)

**Scale:** Popular models serve billions of queries daily. Inference costs can exceed training costs within months of deployment.

---

### 4. Data Centre Operations

**Energy consumption:**
- Servers: ~60% of total data centre energy
- Cooling: ~40% of total data centre energy
- Other infrastructure: Networking, lighting, backup systems

**Cooling methods:**
- **Water-cooled:** 10-50 litres/hour per rack (higher efficiency)
- **Air-cooled:** Lower water but 20-30% more electricity

**Location matters:**
- Many data centres built in water-scarce regions (cheap electricity, tax incentives)
- Competes with agricultural and municipal water use
- Examples: Arizona, Nevada, parts of Texas

---

### 5. End-of-Life

- **Hardware disposal:** E-waste from obsolete servers
- **Component recycling:** Difficult to extract rare earths economically
- **Obsolescence cycles:** AI hardware upgrades every 3-5 years (shorter than typical server lifespan)

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

**Assumptions:**
- Average grid electricity: ~500 g CO₂/kWh (varies by region)
- Data centre efficiency: PUE = 1.5 (1.5 kWh consumed per 1 kWh of computation)
- Water usage: ~10 mL per 1000 tokens (cooling)

---

### Annual Impact for Typical Researcher

**Usage pattern:**
- 100 queries/week
- Average 500 tokens per query
- 52 weeks/year

**Annual footprint:**
- **Queries:** ~5,200/year
- **Tokens:** ~2,600,000/year
- **Energy:** ~13 kWh/year
- **CO₂:** ~125 kg/year (equivalent to 800 km of driving)
- **Water:** ~250 litres/year

---

### Contextualizing the Numbers

**Is 125 kg CO₂/year significant?**

**Perspective 1 (Absolute):**
- UK average per capita: ~5,500 kg CO₂/year
- Your AI use: ~2.3% of average UK footprint
- "Small but not negligible"

**Perspective 2 (Marginal):**
- London to New York return flight: ~1,600 kg CO₂
- One year of AI use: ~8% of one transatlantic flight
- "Relatively small compared to travel"

**Perspective 3 (Cumulative):**
- 1,000 researchers with similar usage: 125,000 kg CO₂/year
- Equivalent to 803 transatlantic flights
- "Adds up at organizational scale"

**Perspective 4 (Opportunity):**
- AI enables research that wouldn't happen otherwise
- Net impact depends on research outcomes
- "Justified if enabling high-value work"

---

## Where the Water Goes

**Data centre water usage:**

### Direct Water Consumption (Evaporative Cooling)

- Water evaporates in cooling towers
- Carries away heat from servers
- **Not recovered:** Water is consumed, not recycled
- Typical rate: 1-3 litres/kWh for evaporative cooling

### Indirect Water Consumption (Electricity Generation)

- Thermal power plants (coal, gas, nuclear) use water for cooling
- ~2 litres of water per kWh of electricity (global average)
- If data centre powered by thermal plants, this adds to footprint

### Regional Impact

**Water-scarce regions:**
- Arizona (Phoenix area): Major data centre hub, severe water stress
- Nevada (Reno area): Tax incentives attracting data centres, limited water
- Texas (West Texas): Cheap electricity, water scarcity

**Consequence:** AI water consumption competes with:
- Agriculture (irrigation)
- Municipal use (drinking water)
- Environmental flows (rivers, ecosystems)

---

## Carbon vs. Water Trade-offs

**Not all data centres are equal:**

### Scenario A: Renewable Energy, Water-Cooled

- **Pros:** Low carbon (solar/wind), high cooling efficiency
- **Cons:** High water consumption
- **Best for:** Regions with abundant water, renewable energy

### Scenario B: Grid Electricity, Air-Cooled

- **Pros:** Low water consumption
- **Cons:** Higher carbon (fossil fuels), less efficient cooling
- **Best for:** Water-scarce regions with cleaner grids

### Scenario C: Renewable Energy, Air-Cooled

- **Pros:** Low carbon, low water
- **Cons:** Requires favourable climate (cooler regions), higher capital cost
- **Best for:** Northern Europe, Canada (cold climates)

**Your choice of AI provider indirectly affects this trade-off.**

---

## The Training vs. Inference Misconception

**Common belief:** "Training is the big problem, my usage doesn't matter"

**Reality:** 

### Training (One-Time)

- GPT-3 training: ~85,000 kg CO₂
- Happens once (already done)
- Amortized across billions of uses

### Inference (Ongoing)

- Each query: ~2.5 g CO₂
- Billions of queries daily
- **Cumulative inference can exceed training cost within 6-12 months of deployment**

**Example:**
- GPT-3 training: 85,000 kg CO₂
- If GPT-3 serves 1 billion queries/day at 2.5 g CO₂ each:
  - Daily inference: 2,500,000 kg CO₂
  - Training equivalent exceeded in **34 days**

**Conclusion:** User behavior (inference efficiency) is MORE important than training efficiency for widely-used models.

---

## Why This Matters for Materials Scientists

### Professional Responsibility

As scientists, we:
- Value evidence-based decision-making
- Understand environmental systems
- Recognize unintended consequences
- Have responsibility to model best practices

**Ignoring AI's environmental cost would be inconsistent with scientific values.**

---

### Organizational Impact

**AmaDema's AI usage:**
- 25 employees
- If each uses AI like "typical researcher" (100 queries/week)
- Annual footprint: 3,125 kg CO₂, 6,250 L water

**With optimization (Day 4 strategies):**
- 50% reduction achievable
- Annual savings: 1,562 kg CO₂, 3,125 L water
- **Equivalent to:** 10 return flights London-Paris eliminated

---

### Leading by Example

**Your industry peers are watching:**
- Materials science community increasingly aware of sustainability
- Green chemistry principles emphasize efficiency
- AI usage practices will be scrutinized

**Early adoption of green AI:**
- Demonstrates thought leadership
- Builds credibility for AmaDema's sustainability claims
- Competitive advantage (ESG-conscious investors)

---

## The Ethical Dimension

### Resource Justice

**Question:** Is it ethical to consume scarce water for AI queries in regions experiencing drought?

**Consider:**
- Phoenix data centre using 50 million litres/year
- Local farmers facing water restrictions
- Your AI query contributes (microscopically but measurably)

**Not saying "don't use AI"** — but "use it consciously and efficiently."

---

### Climate Responsibility

**Question:** Can we justify AI's carbon footprint given climate crisis?

**Framework for evaluation:**

1. **Necessity:** Is this AI use necessary or convenient?
2. **Alternatives:** Could manual methods achieve similar outcome?
3. **Efficiency:** Am I using the most efficient approach?
4. **Value:** Does the output justify the environmental cost?

**High-value use cases:** Research breakthroughs, life-saving applications, major efficiency gains  
**Low-value use cases:** Trivial convenience, replacing simple tasks, redundant queries

---

## Moving Forward

**Today (Day 3), you'll learn:**
- How to measure your footprint (quantify impact)
- Basic optimization strategies (immediate wins)

**Tomorrow (Day 4), you'll master:**
- Advanced optimization techniques (systematic efficiency)
- Integrating green AI into workflows (habit formation)
- Organizational best practices (team-wide impact)

---

## Key Takeaways

!!! success "Remember"
    - **Training is one-time, inference is ongoing** — your usage matters more
    - **Individual queries seem small** — but aggregate impact is significant
    - **Water consumption often overlooked** — it's as important as carbon
    - **Green AI is professional responsibility** — not optional for scientists
    - **Optimization doesn't sacrifice quality** — you can have both

---

**Next:** [Environmental Impact Deep Dive](environmental-impact.md) →
