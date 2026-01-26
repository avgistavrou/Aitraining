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

### What Do These 768 Numbers Mean?

!!! info "The Key Question"
    Unlike your materials property table where each dimension has a clear meaning (density, strength, conductivity), **the 768 dimensions in word embeddings are learned abstract features**.

**Short answer:** Each dimension is a **learned pattern** discovered during training—NOT a pre-defined property.

#### The Critical Difference:

**Materials Property Space (Clear Meanings):**
```
Dimension 1 = Density (g/cm³)
Dimension 2 = Tensile Strength (MPa)
Dimension 3 = Thermal Conductivity (W/m·K)
```

**Word Embedding Space (Abstract Patterns):**
```
Dimension 1 = ??? (some abstract pattern learned from text)
Dimension 2 = ??? (another abstract pattern)
...
Dimension 768 = ??? (yet another abstract pattern)
```

#### Why 768?

That's just the **model architecture choice**. Different models use different dimensions:

- **BERT-base:** 768 dimensions
- **BERT-large:** 1024 dimensions
- **GPT-3:** 12,288 dimensions
- **llama3.2:3b:** 3,072 dimensions

More dimensions = more capacity to capture subtle meaning differences (but also more computational cost).

#### What Researchers Have Found:

Through analysis, some dimensions **roughly correspond** to linguistic patterns:

- "Noun-ness" vs "Verb-ness"
- "Positive" vs "Negative" sentiment
- "Singular" vs "Plural"
- "Past tense" vs "Present tense"

But **most dimensions are combinations** of multiple abstract patterns that humans can't easily interpret.

#### The PCA Analogy

Think of **Principal Component Analysis (PCA)** in materials science:

1. You measure 20 material properties
2. PCA finds new axes that capture most variation
3. PC1 might be "roughly metallic-ness" but it's a **combination** of density, conductivity, hardness...
4. You can't say "PC1 = this specific property"

**Word embeddings work the same way**—each dimension is a **learned combination** of patterns from billions of text examples.

#### Key Insight:

**The AI doesn't know "dimension 42 means metallicity."** It learned through training that certain dimension values cluster words that appear in similar contexts. The dimensions emerged naturally from the data, not from human definitions.

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

**Key distinction:** Tokenization ≠ Embedding quality

#### What Happens with Rare Terms?

**Scenario:** "Nanofibrillation" appears rarely in training data

**Tokenization:** May still be normal
```
"Nanofibrillation" → ["Nano", "fib", "rill", "ation"]
```
The tokenizer recognizes common morphemes, so splitting is reasonable even for rare terms.

**The Real Problem: Poor Embedding Quality**

When a term is rare in training data:

1. **Weak semantic position**
   - Its embedding hasn't been updated enough during training
   - Ends up in a less meaningful position in semantic space
   - Not well-connected to related concepts

2. **Poor relationships**
   - AI doesn't understand which concepts it's related to
   - May confuse it with phonetically similar words
   - Can't infer context well

3. **Unreliable behavior**
   - Generates incorrect contexts around it
   - May hallucinate relationships that don't exist
   - Struggles to answer questions about it accurately

#### Example:

**Common term:** "Polymer"
- Rich embedding (seen millions of times)
- Strong connections to: plastic, material, synthesis, properties
- AI handles it confidently

**Rare term:** "Nanofibrillation" 
- Weak embedding (seen hundreds of times)
- Unclear connections (maybe near "nano" and "fiber" but not well-integrated)
- AI may misunderstand or generate nonsense

**Solution:** When using rare technical terms, provide explicit context and definitions in your prompt rather than assuming the AI "knows" them.


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
    
    **3.** You type "electrospinning" and it splits into ["Electro", "spinning"]. What does this indicate?
    
    a) There's a spelling error  
    b) The AI doesn't understand the term  
    c) Normal tokenization of a compound word  
    d) The term is too technical for AI
    
    **4.** If a term splits into MANY tiny tokens (e.g., "eletrospining" → ["ele", "tr", "osp", "ining"]), what's the most likely cause?
    
    a) Normal compound word splitting  
    b) Spelling mistake or term not in tokenizer vocabulary  
    c) The term is too long  
    d) Random tokenization error
    
    **Answers:** 1-b, 2-b, 3-c, 4-b

---

**Next:** [The "Large" in LLM](llm-scaling-attention.md) – How scale and attention enable context understanding →
