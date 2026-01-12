# Day 3 Overview: Technical Understanding

**Duration:** 1.5 hours  
**Focus:** Understanding how LLMs work and their environmental impact

---

## Learning Objectives

By the end of Day 3, you will:

✅ **Understand** the technical difference between NLMs and LLMs  
✅ **Choose** the right tool for specific tasks  
✅ **Recognize** the environmental cost of AI usage  
✅ **Apply** green AI principles to your workflows  
✅ **Calculate** your carbon footprint and identify reductions

---

## Session Structure

### Part 1: NLMs vs. LLMs (30 minutes)

**Technical Foundations** (10 min)
- Encoder vs. decoder architectures
- Parameter sizes and computational costs
- Speed and energy comparisons

**Tool Selection Framework** (10 min)
- When to use NLMs (extraction, classification)
- When to use LLMs (generation, reasoning)
- Hybrid approaches

**Hands-On Practice** (10 min)
- Tool selection exercise
- Compare efficiency in sandbox

---

### Part 2: Green AI Introduction (30 minutes)

**The Environmental Cost** (15 min)
- Full lifecycle: extraction → training → inference → disposal
- Water consumption (cooling data centers)
- Carbon emissions (electricity)
- Your individual impact

**Measurement and Awareness** (15 min)
- Calculating carbon footprint
- Estimating water usage
- Understanding scale and context

---

### Part 3: Green AI Strategies (30 minutes)

**Optimization Techniques** (20 min)
- Think before you prompt
- Batch similar queries
- Cache and reuse outputs
- Use smaller models
- Leverage templates

**Practical Workshop** (10 min)
- Calculate your current footprint
- Identify 3 optimizations
- Recalculate with improvements

---

## Key Concepts

### 1. NLMs = Specialized Tools

**Best for:**
- Document classification
- Keyword extraction
- Entity recognition
- Simple Q&A

**Advantages:**
- 100× faster than LLMs
- 100× less energy
- Lower cost

**When to use:** Structured, repetitive tasks

---

### 2. LLMs = General-Purpose Engines

**Best for:**
- Text generation
- Complex reasoning
- Synthesis and interpretation
- Code generation

**Disadvantages:**
- Slower (seconds vs. milliseconds)
- Higher energy (0.01-0.1 kWh vs. 0.001 kWh)
- Higher cost

**When to use:** Tasks requiring creativity or deep reasoning

---

### 3. The Environmental Reality

**Every AI query requires:**
- Millions of computational operations
- Server cooling (water consumption)
- Electricity (carbon emissions)

**Scale matters:**
- Your individual query: ~10 mL water, ~2.5 g CO₂
- Your annual usage: ~250 L water, ~125 kg CO₂
- Global AI usage: Massive environmental impact

---

### 4. Green AI is Not Optional

**As professionals, we must:**
- Understand the environmental cost
- Optimize our usage
- Choose tools responsibly
- Advocate for sustainable practices

**It's OK to:**
- Limit AI use based on environmental concerns
- Choose manual methods when AI benefit is marginal
- Question whether AI is necessary

---

## Today's Exercises

You'll practice with:

1. **Tool Selection Challenge**
   - Given 10 scenarios, choose NLM or LLM
   - Justify your choices
   - Calculate efficiency gains

2. **Carbon Footprint Calculation**
   - Estimate your current AI usage
   - Calculate annual CO₂ and water consumption
   - Identify optimization opportunities

3. **Green Optimization Challenge**
   - Refactor inefficient prompt chain
   - Reduce from 12 queries to 1-2
   - Maintain quality whilst cutting 80-90% of environmental impact

4. **Template Creation**
   - Build reusable prompt templates
   - Measure efficiency gains
   - Share with team

---

## What You'll Build Today

### Template Library (Specialized)

Add environmental-focused templates:
- Batched query template
- Cached knowledge base structure
- Model selection decision tree
- Footprint calculation worksheet

### Real Impact

**Before optimization:**
- 100 queries/week
- ~250 L water/year
- ~125 kg CO₂/year

**After Day 3 optimization:**
- 30-50 queries/week (50-70% reduction)
- ~75-125 L water/year
- ~37-62 kg CO₂/year

**Same quality, half the environmental cost.**

---

## Key Distinctions

### Training vs. Inference

**Training:** One-time cost to create the model
- GPT-3 training: 85,000 kg CO₂
- Happens once (developers' responsibility)

**Inference:** Ongoing cost every time you use the model
- Your query: ~2.5 g CO₂
- Happens billions of times (users' responsibility)
- **This is where YOU have impact**

---

### Absolute vs. Relative Impact

**Absolute impact:** Your AI usage has environmental cost

**Relative impact:** Compared to what alternative?

**Example:**
- Manual literature review: 40 hours of work
- AI-assisted literature review: 2 hours + 50 queries
- Net benefit: 38 hours saved, enabling higher-value work
- **But:** Still should optimize those 50 queries

---

## Common Questions

### "Is my individual usage really significant?"

**Yes and no:**

**No:** Your 100 queries/week = ~3 kg CO₂/month (small in absolute terms)

**Yes:** 
- Collective impact matters (billions of users)
- Habits compound over time
- Professional responsibility to model best practices
- Every optimization multiplies across team

---

### "Should I stop using AI entirely?"

**Not necessarily:**

**Consider:**
- **High-value tasks:** AI enabling breakthrough research → Justified
- **Low-value tasks:** AI for trivial convenience → Reconsider
- **Optimized usage:** 50 smart queries > 200 wasteful queries

**It's about conscious, responsible use, not abstinence.**

---

### "How do I know if I'm being efficient?"

**Ask yourself:**

1. **Could I batch this?** (Process 5 items at once instead of 5 separate queries)
2. **Have I already generated this?** (Cache and reuse)
3. **Is this the right tool?** (NLM vs. LLM)
4. **Is AI necessary?** (Sometimes manual is better)

**If "yes" to any, optimize before querying.**

---

## Technical Deep Dive Preview

### Why LLMs Use So Much Energy

**Simplified explanation:**

1. **Billions of parameters:** Each query activates billions of calculations
2. **Matrix multiplications:** Computationally intensive operations
3. **Large context windows:** Processing thousands of tokens requires massive memory
4. **Data center overhead:** Cooling, networking, redundancy
5. **24/7 availability:** Always-on infrastructure

**This is why model size matters:**
- Llama 8B: 8 billion parameters
- Llama 70B: 70 billion parameters (~9× more energy)
- GPT-4: 1.76 trillion parameters (~20× more energy than Llama 70B)

---

## Pre-Work Review

**Build on Day 1 & 2:**
- Day 1: Learned frameworks (AUTOMAT, conversational)
- Day 2: Mastered context (explicit specification)
- Day 3: Understand tools and environmental impact

**Next step:** Combine all three for maximum efficiency

---

## Looking Ahead

**Day 4** will complete the training:
- Advanced optimization strategies
- Advanced conversational learning
- Ethics, bias, and fairness
- Final integration and certification

---

## Success Criteria

**You're ready for Day 4 when you can:**

✅ Explain NLM vs. LLM trade-offs  
✅ Choose appropriate tool for given task  
✅ Calculate environmental footprint of AI usage  
✅ Identify 3+ optimization strategies  
✅ Apply green AI principles to your workflows

---

## Let's Begin!

**Ready to understand the technology and minimize your impact?**

**Next:** [NLMs vs. LLMs](nlms-vs-llms.md) →
