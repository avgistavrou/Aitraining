# Day 3 Overview: Understanding AI Under the Hood

**Focus:** How AI actually works: from words to predictions

---

## Learning Objectives

By the end of Day 3, you will:

1. **Understand** how computers turn words into mathematical coordinates (embeddings)  
2. **Recognize** why "Large" matters in LLMs (scale and attention mechanisms)  
3. **Explain** why AI hallucinates fake papers and non-existent data  
4. **Navigate** the difference between truth and probability in AI outputs

---

## Why This Session Matters

As engineers, you trust tools you understand. You've been using AI, but to **trust it responsibly**, you need to look under the hood.

!!! success "Core Insight"
    AI doesn't "know" things. It predicts patterns in mathematical space.
    
    Understanding this changes how you use it—from blind trust to informed application.

---

## Session Structure

### Part 1: NLM Foundations

**How Words Become Coordinates**

- Tokenization: Breaking text into unit cells
- Embeddings: The mathematical map of meaning
- Semantic space: Words as points in multidimensional space
- Why "Steel" and "Iron" are close neighbors

**Key Analogy:** Just like materials occupy positions in property space (density, strength, conductivity), words occupy positions in semantic space.

---

### Part 2: The "Large" in LLM 

**Scaling Up & Understanding Context**

- The context problem: "Lead" the metal vs "lead" investigator
- Attention mechanism: Dynamic weighting system
- Why "Large" = billions of parameters
- From pattern matching to probability engines

**Key Analogy:** Attention is like a dynamic weighting system in composite design—adjusting importance based on surrounding elements.

---

### Part 3: Truth vs. Probability

**Why Models Hallucinate & How to Ground Them**

- The "Stochastic Parrot" problem
- Why AI fabricates plausible-sounding citations
- The difference between pattern completion and fact retrieval
- Grounding techniques: RAG, temperature control, chain-of-thought

**Key Principle:** AI prioritizes plausibility over veracity—your job is to ground it in reality.

---

## What You'll Gain Today

### Technical Understanding

- **Demystification**: See through the "AI magic" to understand the mechanism
- **Critical evaluation**: Know when to trust vs verify AI outputs
- **Better prompts**: Understand why certain instructions work better than others

### Practical Skills

- **Hallucination detection**: Spot fabricated data and citations
- **Grounding techniques**: Force AI to stick to actual sources
- **Temperature control**: Adjust creativity vs certainty
- **RAG implementation**: Ground AI in your documents

---

## Engineering Perspective

Throughout this session, we'll use **materials science thinking** to understand AI:

| Materials Concept | AI Equivalent |
|-------------------|---------------|
| Property space (density, strength) | Semantic space (word meanings) |
| Phase diagrams | Probability distributions |
| Crystal lattice unit cells | Tokens |
| Composite weighting | Attention mechanism |
| Quality control | Verification protocols |

**You already have the mental models,we're just mapping them to AI.**


---

## Success Criteria

**You're ready for Day 4 when you can:**

1. Explain to a colleague how AI turns words into coordinates  
2. Describe why context matters using the attention mechanism  
3. Predict when AI is likely to hallucinate  
4. Apply at least 2 grounding techniques to prevent fabrication  
5. Recognize the difference between plausibility and accuracy


## Let's Begin!

**Ready to understand what's really happening when you type a prompt?**

**Next:** [NLM Foundations](nlm-foundations.md): How words become coordinates →
