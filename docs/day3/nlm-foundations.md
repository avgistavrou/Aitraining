# NLM Foundations: How Words Become Coordinates
**Core Concept:** Computers turn words into mathematical coordinates, just like materials occupy positions in property space

---

## The Core Problem

Computers can't read words like "steel" or "polymer." They need numbers.

**Solution:** Convert every word into a vector—a list of numbers that represents its meaning mathematically.

This is what **Neural Language Models (NLMs)** do.

---

## The Materials Science Analogy

### You Already Know This Concept

As materials engineers, you describe materials with **properties**:

| Material | Density (g/cm³) | Tensile Strength (MPa) | Thermal Conductivity (W/m·K) |
|----------|----------------|------------------------|------------------------------|
| Steel | 7.85 | 400-550 | 50 |
| Aluminium | 2.70 | 47-70 | 237 |
| Titanium | 4.51 | 293 | 22 |
| PTFE  | 2.1–2.2 | 13–30 | 0.25 |

Each material is a **point in property space**. Plot these three properties, and each material occupies a specific 3D coordinate.

**Materials with similar properties cluster together** in this space.

---

### AI Does the Same Thing with Words

Each word gets assigned a **vector** (list of numbers) representing its meaning:

```
'Steel'    → [0.12, -0.98, 0.45, 0.31, -0.22, ...]  (768 numbers)
'Iron'     → [0.15, -0.95, 0.42, 0.29, -0.25, ...]  (768 numbers)
'Polymer'  → [-0.45, 0.23, -0.67, 0.88, 0.12, ...]  (768 numbers)
'Banana'   → [0.88, 0.34, -0.12, -0.95, 0.67, ...]  (768 numbers)
```

**Words with similar meanings have similar vectors** → they're close together in this mathematical space.

---

## Three Steps: From Text to Math

### Step 1: Tokenization

Just like breaking a crystal lattice into unit cells, AI breaks text into **tokens**.

**Example sentence:**
> "Electrospinning PLA nanofibers requires voltage control."

**Tokenized:**
```
["Electro", "spinning", " PLA", " nan", "of", "ibers", " requires", 
" voltage", " control", "."]
```

**Rule of thumb:** ~1 token = 4 characters for English text

**Why tokens, not words?** 
- Handles technical terms (electrospinning → Electro + spinning)
- Deals with rare words
- More efficient mathematically

---

### Step 2: Embeddings (The Map of Meaning)

Each token is converted to an **embedding**: a vector in high-dimensional space.

**Real example from a model:**

```
Token: "Metal"
Embedding: [0.124, -0.981, 0.453, -0.228, 0.765, ..., -0.334]
           └─────────────── 768 dimensions ────────────────┘
```

**Think of it as:** The embedding is the "coordinate" of the word in meaning-space, just like (7.85, 450, 50) is the coordinate of steel in property-space.

---

### Step 3: Semantic Space (The Map Itself)

In this mathematical space:

**Similar meanings = Close neighbors**

```
Property Space Example:
Steel and Iron → Close together (both metals, similar properties)
Steel and Banana → Far apart (completely different)

Semantic Space Example:
'Steel' and 'Iron' → Close coordinates (both metals)
'Steel' and 'Banana' → Distant coordinates (unrelated)
```

---

## Visualizing the Semantic Space

Imagine a 3D plot (reality is 768D, but we'll simplify):

```
                   Metals
                     •
            Steel •     • Iron
                 •       •
          Aluminium • Titanium
                   
                   
                              • Banana
                              • Apple
                             Fruits


     • Polymer
     • Plastic              
    Materials                
```

**Key insight:** The AI has learned these relationships from reading billions of words. It never "learned" chemistry—it learned that "Steel" and "Iron" appear in similar contexts across texts.

---

## Why This Matters for You

### 1. AI Doesn't "Understand", It Measures Similarity

When you ask: *"What's similar to steel?"*

AI doesn't think "metals with high strength." It finds words with vectors close to steel's vector in semantic space.

**Often correct** (Iron, Aluminium) because those words appear in similar contexts in training text.

**Sometimes wrong** if training data has biases or gaps.

---

### 2. Technical Terms May Have Poor Embeddings

If "electrospinning" appears rarely in training data, its embedding may be:
- Less precise
- Further from related concepts
- Less useful for reasoning

**Solution:** Use clear, well-established terminology in prompts when possible.


---

## Real Example: How AI "Knows" Relationships

You ask: *"What solvents dissolve PLA?"*

**What AI does:**
1. Finds embedding for "PLA"
2. Searches for embeddings near "dissolve" in the context of polymers
3. Returns words frequently appearing in that region: "DMF", "DCM", "chloroform"

**It's not chemistry knowledge,simply pattern matching in embedding space based on how often these words co-occur in training text.**

---

## Limitations of NLM-Only Approach

### Good For:
- **Classification**: Is this paper about polymers or ceramics?
- **Keyword extraction**: Find all chemical compound names
- **Similarity search**: Find documents similar to this one
- **Entity recognition**: Identify material names in text

### Bad For:
- **Generation**: Write a novel synthesis procedure (needs LLM)
- **Reasoning**: Compare trade-offs between methods (needs LLM)
- **Context-dependent tasks**: Disambiguate "lead" (needs attention)

**NLMs are the foundation—they create the map. LLMs build on this to navigate the map intelligently.**

---

## Interactive Analogy: Materials Property Space

**Question:** If I give you a material with properties (density: 4.5, strength: 900, conductivity: 22), what material is it closest to?

**Answer:** Titanium! You found the nearest neighbor in property space.

**AI does the same** with word embeddings in semantic space.

---

## The Tokenization Challenge

### Why "Electrospinning" Splits

```
"Electrospinning" → ["Electro", "spinning"]
```

**Reason:** Model has seen "electro" and "spinning" separately more often than "electrospinning" as a complete word.

**Impact:** Model might understand spinning + electrical concepts separately, then combine them.

**Your action:** When using technical terms, ensure they're well-defined in your prompt or the model may misinterpret.



## From NLM to LLM: What's Missing?

**NLMs give us:**
✅ Words as coordinates  
✅ Similarity measurements  
✅ Basic classification

**NLMs DON'T give us:**
❌ Context awareness ("lead" metal vs leadership)  
❌ Text generation (creating new sentences)  
❌ Reasoning (comparing approaches, evaluating trade-offs)

**That's where Large Language Models (LLMs) come in → Next section**

---

## Practical Takeaway

**When you type a prompt, the AI:**

1. **Tokenizes** your words (breaks into chunks)
2. **Embeds** each token (converts to coordinates)
3. **Operates** in mathematical space (not reading "English")

**Everything the AI does is vector math, not language understanding.**

This explains why:
- Synonyms work well (close vectors)
- Typos confuse it (creates wrong vectors)
- Technical jargon is hit-or-miss (depends on training data exposure)

---

## Quick Check: Do You Understand?

!!! question "Test Your Understanding"
    **1.** Why does AI place "Steel" and "Iron" close together in semantic space?
    
    a) It learned chemistry  
    b) They appear in similar contexts in training text  
    c) Both are short words  
    d) Random assignment
    
    **2.** What is a token?
    
    a) A word  
    b) A chunk of text (usually ~4 characters)  
    c) A number  
    d) A sentence
    
    **3.** If a technical term like "PLA/graphene nanocomposite" splits into many tokens, what does that suggest?
    
    a) The term is too complex for AI  
    b) The term appeared rarely in training data  
    c) There's a spelling error  
    d) AI doesn't know chemistry
    
    **Answers:** 1-b, 2-b, 3-b

---

**Next:** [The "Large" in LLM](llm-scaling-attention.md) – How scale and attention enable context understanding →
