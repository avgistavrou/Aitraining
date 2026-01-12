# Environmental Impact: Data and Context

Understanding the environmental cost of AI requires looking at data, regional impacts, and comparative context.

---

## The Water Crisis

### Why AI Uses So Much Water

**Direct consumption (evaporative cooling):**
- Data centres use evaporation to dissipate heat
- Water absorbs heat and evaporates (phase change)
- Most efficient cooling method but consumes water
- Water is **not recycled** — it's lost to atmosphere

**Typical rates:**
- 1-3 litres per kWh of computation (water-cooled systems)
- For AI query (~0.005 kWh): ~10 mL

---

### Regional Impacts

#### Case Study: Arizona Data Centres

**Context:**
- Arizona: Severe water stress (Colorado River crisis)
- Agricultural water restrictions increasing
- Phoenix area: Multiple large data centres

**Impact:**
- One large data centre: 50-100 million litres/year
- Equivalent to: 500-1000 households' annual water use
- Competes with agriculture, municipal use

**AI contribution:**
- AI workloads: 30-50% of data centre compute
- Proportional water share: 15-50 million litres/year per centre

---

#### Case Study: Ireland's Data Centre Boom

**Context:**
- Ireland: Tech hub (Google, Amazon, Microsoft data centres)
- Renewable energy (wind) attractive for tech companies
- Water resources historically abundant

**Problem:**
- Data centres now use ~18% of Ireland's electricity
- Growing concern about grid strain
- Water usage increasing during drier summers

**AI impact:**
- Large language models driving data centre expansion
- Local communities questioning sustainability

---

### Water Footprint Comparison

**Put AI water use in context:**

| Activity | Water Consumed | Equivalent AI Usage |
|----------|----------------|---------------------|
| 5-minute shower | 40 litres | 4,000 complex AI queries |
| Load of laundry | 50 litres | 5,000 complex AI queries |
| Growing 1 kg beef | 15,000 litres | 1.5 million complex AI queries |
| Manufacturing one smartphone | 13,000 litres | 1.3 million complex AI queries |

**Perspective:**
- AI water use is real but smaller than many activities
- **However:** AI is growing exponentially while others are relatively stable
- Compound growth is the concern, not current absolute numbers

---

## The Carbon Footprint

### Electricity Generation Mix Matters

**Your AI query's carbon footprint depends on where servers are located:**

| Data Centre Location | Grid Mix | CO₂ per kWh | Your Query (0.005 kWh) |
|---------------------|----------|-------------|------------------------|
| Iceland | ~100% renewable (geothermal, hydro) | 10 g | 0.05 g CO₂ |
| Norway | ~98% renewable (hydro) | 20 g | 0.1 g CO₂ |
| France | ~70% nuclear, 20% renewable | 60 g | 0.3 g CO₂ |
| US (average) | ~60% fossil fuels | 400 g | 2 g CO₂ |
| Poland | ~75% coal | 700 g | 3.5 g CO₂ |
| Australia | ~70% coal | 600 g | 3 g CO₂ |

**Implication:** Same query, 70× difference in carbon impact depending on data centre location.

---

### Provider Commitments

#### Major AI Provider Sustainability

| Provider | Primary Regions | Renewable Commitment | 2024 Status |
|----------|----------------|---------------------|-------------|
| **Google (Gemini)** | US, Europe, Asia | Carbon-neutral since 2007; 24/7 carbon-free goal by 2030 | ~64% carbon-free energy globally |
| **Microsoft (Copilot, Azure OpenAI)** | Global | Carbon negative by 2030 | ~70% renewable energy |
| **OpenAI (ChatGPT)** | US (primarily) | Uses Azure infrastructure | Indirect via Microsoft's commitments |
| **Anthropic (Claude)** | US | Uses AWS/GCP infrastructure | Indirect via cloud provider commitments |
| **Meta (Llama)** | US, Europe | 100% renewable by 2020 | Achieved for data centres |

**Your choice of provider has measurable carbon impact.**

---

### Carbon Footprint Comparison

**Put AI carbon emissions in context:**

| Activity | CO₂ Emissions | Equivalent AI Usage |
|----------|---------------|---------------------|
| 1 km driving (petrol car) | 150 g | 60 complex AI queries |
| London to Paris flight (return) | 250 kg | 100,000 complex AI queries |
| UK person, annual average | 5,500 kg | 2.2 million complex AI queries |
| Producing 1 kg beef | 27 kg | 10,800 complex AI queries |
| Manufacturing one laptop | 200 kg | 80,000 complex AI queries |

**Perspective:**
- Individual AI use is small compared to travel, diet, manufacturing
- **But:** It's an *additional* footprint, not a replacement
- Efficiency matters because AI use is growing rapidly

---

## The Full Cost Comparison

### Training vs. Inference vs. Hardware

**Example: Llama 3.3 70B Model Lifecycle**

#### Training (One-Time)

- **CO₂:** ~10,000 kg (estimated)
- **Energy:** ~20,000 kWh
- **Water:** ~20,000 litres (indirect, cooling during training)

#### Hardware Manufacturing (Per GPU Cluster)

- **GPUs:** 128 × H100 (~64,000 kg CO₂ embodied emissions)
- **Servers, networking:** ~20,000 kg CO₂
- **Total hardware:** ~84,000 kg CO₂

#### Inference (Ongoing)

- **1 billion queries** (typical for popular model in first year)
- **2.5 g CO₂ per query** (average)
- **Total:** 2,500,000 kg CO₂ in year 1

---

**Lifecycle Breakdown:**

| Phase | One-Time Cost | Ongoing Cost (Year 1) | Ongoing Cost (Year 2) |
|-------|---------------|----------------------|----------------------|
| Hardware | 84,000 kg CO₂ | 0 | 0 |
| Training | 10,000 kg CO₂ | 0 | 0 |
| Inference | 0 | 2,500,000 kg CO₂ | 2,500,000 kg CO₂ |
| **Total** | **94,000 kg** | **2,500,000 kg** | **2,500,000 kg** |

**Inference is 26× larger than training+hardware in first year alone.**

---

## Scaling Effects

### Why AI's Environmental Impact is Growing Exponentially

**Three compounding factors:**

#### 1. Model Size Growth

- GPT-3 (2020): 175B parameters
- GPT-4 (2023): ~1.76T parameters (10× larger)
- Energy per query scales roughly with model size
- **10× model size = 10× energy per query**

#### 2. User Growth

- ChatGPT: 100 million users in 2 months (fastest growth ever)
- Gemini, Claude, Copilot: Hundreds of millions more
- **Exponential user adoption = exponential total impact**

#### 3. Use Frequency Growth

- Early adopters: ~10 queries/week
- Heavy users today: ~100-500 queries/week
- Frequency increasing as AI integrates into workflows
- **More queries per user = multiplier on user growth**

---

**Combined effect:**

| Year | Users | Queries/User/Week | Total Queries/Week | Energy (MWh/week) | CO₂ (tons/week) |
|------|-------|-------------------|-------------------|-------------------|-----------------|
| 2023 | 100M | 10 | 1B | 5,000 | 2,500 |
| 2024 | 300M | 30 | 9B | 45,000 | 22,500 |
| 2025 (proj.) | 1B | 50 | 50B | 250,000 | 125,000 |

**That's a 50× increase in 2 years.**

---

## Efficiency Improvements (The Good News)

### Hardware Advances

**GPU efficiency improving:**
- NVIDIA A100 (2020): 312 TFLOPS/W
- NVIDIA H100 (2022): 400 TFLOPS/W (~28% improvement)
- Next-gen (2025): ~600 TFLOPS/W projected

**Implication:** 2× efficiency improvement every 3-4 years

---

### Model Optimization

**Techniques reducing inference cost:**

- **Quantization:** 4-bit models run 4× faster with minimal quality loss
- **Distillation:** Smaller models trained to mimic larger ones (10× speedup)
- **Pruning:** Remove unnecessary parameters (30-50% reduction)
- **Efficient architectures:** New transformer variants reducing compute

**Example:** Llama 3.3 70B at 4-bit quantization:
- Quality: ~98% of full precision
- Speed: 4× faster
- Energy: 75% reduction

---

### Data Centre Efficiency

**PUE (Power Usage Effectiveness) improving:**
- 2010 average: 2.0 (2 kWh consumed per 1 kWh compute)
- 2024 average: 1.5 (1.5 kWh consumed per 1 kWh compute)
- Best data centres: 1.1-1.2

**Cooling innovations:**
- Liquid immersion cooling (submerge servers in dielectric fluid)
- Free cooling (use outdoor air when possible)
- AI-optimized cooling (Google's DeepMind reduces cooling energy by 40%)

---

## Net Impact Equation

**The question is not** "Does AI have environmental impact?" (it does)

**The question is** "Does AI's value exceed its environmental cost?"

### Framework for Evaluation

**For each AI use case, ask:**

1. **Necessity:** Is AI the only way to achieve this outcome?
2. **Efficiency:** Am I using the most efficient approach?
3. **Value:** What's the benefit (time saved, insights gained, errors prevented)?
4. **Alternatives:** What's the environmental cost of alternatives?

---

### Example Evaluation: Literature Review

**AI-assisted approach:**
- 50 queries to process 100 papers
- 2 hours of work
- Environmental cost: 0.25 kWh, 125 g CO₂, 2.5 L water

**Manual approach:**
- 0 AI queries
- 20 hours of work
- Environmental cost: Office energy for 18 extra hours (~9 kWh), 1800 g CO₂

**Net impact:**
- AI saves 18 hours
- AI reduces CO₂ by 1675 g (office energy saved exceeds AI cost)
- Trade-off: 2.5 L water consumed (no water in manual approach)

**Conclusion:** AI is more sustainable than manual in this case (if time saved enables higher-value work)

---

### Example Evaluation: Trivial Query

**AI query:**
- "What's a good restaurant near me?"
- 1 query
- Environmental cost: 0.005 kWh, 2.5 g CO₂, 50 mL water

**Alternative:**
- Google Maps search (non-AI)
- Environmental cost: ~0.0001 kWh, 0.05 g CO₂, negligible water

**Net impact:**
- AI costs 50× more than simple search
- Benefit is marginal (same result)

**Conclusion:** AI is wasteful for this use case

---

## Actionable Insights

**Based on this data, what should you do?**

### High-Level Principles

1. **Use AI for high-value tasks** where it enables work that wouldn't happen otherwise
2. **Optimize your usage** through batching, caching, model selection
3. **Track your footprint** to understand and reduce impact
4. **Advocate for green AI** at organizational level

### Specific Actions

**Today (Day 3):**
- Calculate your current footprint (Exercise 2)
- Identify your top 3 use cases (where is AI most valuable?)
- Spot wasteful queries (where can you use simpler tools?)

**Tomorrow (Day 4):**
- Implement optimization strategies (batching, templates, caching)
- Build sustainable workflows (habits that last)
- Create team-wide best practices

---

**Next:** [Day 3 Exercises](exercises.md) – Calculate your footprint and optimize →
