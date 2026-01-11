# What are LLMs?

!!! note "Key Takeaways"
    - LLMs are mathematical models of language that map similar words to nearby positions in a conceptual space
    - They predict which words are most likely to follow a given input (prompt) based on patterns learned from vast amounts of text
    - They work by **pattern matching**, not true understanding—they are not infallible sources of truth
    - Always verify important information from authoritative sources
    - Be aware of bias in AI outputs and actively check for it

## Natural Language Processing

Natural Language Processing (NLP) is the foundational technology that enables Large Language Models to understand and generate human language. Natural language is inherently **ambiguous and contextual**.

Consider the sentence:

> "I saw the man with the telescope."

This could mean:

- You used a telescope to see the man
- You saw a man who was carrying a telescope

At its core, NLP transforms words, phrases, and sentences into numerical representations called **embeddings**—high-dimensional vectors that capture semantic meaning and relationships between linguistic elements.

### Embedding Spaces

These embedding spaces are constructed so that words or phrases with similar meanings are positioned closer together in the vector space, while semantically different concepts are farther apart.

For example:
- "king" and "man" would be nearby vectors
- "queen" and "woman" would be nearby vectors
- "man" and "woman" would be distant from each other

This mathematical representation allows complex reasoning about text by manipulating these vectors through neural network operations.

## The Large Language Model Revolution

Large Language Models represented a paradigm shift in learning language patterns from the Internet, books, and other vast text sources. Built on [transformer architecture](https://en.wikipedia.org/wiki/Transformer_(deep_learning_architecture)), LLMs focus on relevant parts of the input when processing words (tokens) or phrases, enabling understanding of long-range dependencies that earlier models missed.

### Tokenisation

Let's assume we want to embed the words of this sentence:

> "The Jean Golding Institute is a central hub for data science and data-intensive research at the University of Bristol."

The LLM will break the sentence into **tokens** of one or fewer words and assign each a numeric identifier. A rule of thumb: **one token ≈ 4 characters** for common English text.

Try it yourself: [OpenAI Tokenizer](https://platform.openai.com/tokenizer)

Each token has a mapping in the embedding space of the LLM model.

### What Makes LLMs "Large"?

The training scale is what makes LLMs "large"—exposure to hundreds of billions of words from diverse sources allows them to internalise:

- Grammar and vocabulary
- World knowledge
- Reasoning patterns

The training process is elegantly simple: **models learn by predicting the next word in sequences**, adjusting internal parameters based on prediction errors. This forces development of sophisticated internal representations of language and knowledge.

## What Can LLMs Do?

LLMs fundamentally change how we approach NLP tasks. Instead of building specialised systems for each application, a single LLM can handle multiple tasks through different prompting strategies.

### Core Capabilities

**For Materials Scientists:**

✅ **Writing assistance**: Drafting technical reports, synthesis protocols, grant applications  
✅ **Summarisation**: Condensing literature reviews into key findings  
✅ **Translation**: Converting technical documents between languages  
✅ **Question answering**: Retrieving information from knowledge domains  
✅ **Code generation**: Writing Python scripts for data analysis  
✅ **Creative tasks**: Brainstorming experimental designs, naming compounds

### What LLMs Cannot Do (Reliably)

❌ **Mathematical precision**: They approximate, don't calculate  
❌ **Real-time information**: Training data has a cutoff date  
❌ **Access private data**: They don't know your internal databases  
❌ **Understand context you don't provide**: No memory between sessions  
❌ **Guarantee factual accuracy**: Hallucinations are inherent

## The Pattern Matching Problem

**Critical insight:** LLMs work by pattern matching, not understanding.

If you ask:

> "What is the tensile strength of Ti₆Al₄V at 400°C?"

The model doesn't "know" this—it predicts plausible text based on patterns in its training data. It might:

- Provide a correct value (if present in training data)
- Interpolate from related materials
- **Hallucinate a plausible-sounding but incorrect number**

**For scientific work:** Always verify critical data against primary sources.

---

## Exercise: Identifying LLM Limitations

!!! question "Challenge"
    Access the sandbox environment and ask the model:
    
    ```
    What is the exact melting point of the polymer PLA synthesised 
    with 2% D-lactide at a pressure of 150 kPa?
    ```
    
    **Questions:**
    
    1. Does the model provide a specific answer?
    2. How confident does it sound?
    3. Can you verify this information?
    4. What would be a better way to phrase this query?

**Key learning:** Specificity in prompts can lead to confident-sounding but fabricated answers. Learn to recognise this pattern.

---

**Next:** [LLM Tools](llm-tools.md) – Explore the AI tools available for your work →
