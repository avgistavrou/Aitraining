# NLMs vs LLMs: Choosing the Right Tool

Understanding the difference between Natural Language Models (NLMs) and Large Language Models (LLMs) is crucial for efficient, sustainable AI use.

---

## The Core Difference

### Natural Language Models (NLMs)

**Purpose:** Specific, well-defined language tasks

**Architecture:** Encoder-based transformers (e.g., BERT)

**Size:** 100M - 350M parameters (typically)

**Training:** Focused on understanding and classification

**Analogy:** A specialized craftsman—expert at one thing

---

### Large Language Models (LLMs)

**Purpose:** General-purpose text generation and reasoning

**Architecture:** Decoder-based transformers (e.g., GPT)

**Size:** 8B - 405B+ parameters

**Training:** Predict next tokens across diverse domains

**Analogy:** A polymath—capable of many things, but resource-intensive

---

## Technical Comparison

| Aspect | NLMs (BERT-based) | LLMs (GPT-based) |
|--------|-------------------|------------------|
| **Primary function** | Understanding | Generation |
| **Common tasks** | Classification, extraction | Writing, reasoning, creativity |
| **Speed** | Fast (milliseconds) | Slower (seconds) |
| **Energy per query** | Low (~0.001 kWh) | High (~0.01-0.1 kWh) |
| **Context window** | 512 tokens typical | 4K-128K tokens |
| **Cost** | Very low | Moderate to high |
| **When to use** | Repetitive, structured tasks | Complex, creative tasks |

---

## NLMs: When and How to Use

### Ideal Use Cases

✅ **Keyword extraction** from papers  
✅ **Document classification** (categorise by topic)  
✅ **Named entity recognition** (find chemical names, compounds)  
✅ **Sentiment analysis** (positive/negative assessment)  
✅ **Simple Q&A** (fact retrieval from known corpus)  
✅ **Search and filtering** in databases

### Materials Science Applications

#### Application 1: Paper Screening

**Task:** Screen 500 papers to find those discussing "electrospinning"

**Why NLM:**
- Simple keyword/topic matching
- No creative generation needed
- High speed required (batch process 500 papers)
- Low energy footprint

**Tool:** BERT-based classifier

**Efficiency:** Process 500 papers in ~30 seconds vs. 25+ minutes with LLM

---

#### Application 2: Chemical Entity Extraction

**Task:** Extract all chemical compound names from 50 synthesis protocols

**Why NLM:**
- Named entity recognition (specific task)
- Structured output (list of entities)
- Repetitive pattern matching
- High accuracy for known patterns

**Tool:** ChemBERT or BioBERT (domain-specific NLMs)

**Efficiency:** 10× faster than LLM, same accuracy

---

#### Application 3: Patent Classification

**Task:** Classify 200 patents into categories (polymers, ceramics, composites, coatings)

**Why NLM:**
- Well-defined classification task
- Training data available (historical classifications)
- Fast batch processing needed
- No nuanced interpretation required

**Tool:** Fine-tuned BERT classifier

**Efficiency:** 50× lower energy cost than LLM

---

### Popular NLM Models

| Model | Parameters | Specialisation | Best For |
|-------|------------|----------------|----------|
| **BERT** | 110M-340M | General text understanding | Document classification, Q&A |
| **RoBERTa** | 125M-355M | Improved BERT | Better accuracy on classification |
| **DistilBERT** | 66M | Fast, lightweight BERT | Speed-critical applications |
| **SciBERT** | 110M | Scientific text | Papers, patents, technical docs |
| **BioBERT** | 110M | Biomedical text | Biology, chemistry, medicine |
| **ChemBERT** | 110M | Chemistry | Chemical entities, reactions |

---

## LLMs: When and How to Use

### Ideal Use Cases

✅ **Complex reasoning** requiring multiple steps  
✅ **Creative content generation** (novel text)  
✅ **Synthesis and interpretation** (not just extraction)  
✅ **Code generation** (Python scripts, analysis pipelines)  
✅ **Strategic analysis** (comparing approaches, recommendations)  
✅ **Conversational learning** (asking "why" questions)

### Materials Science Applications

#### Application 1: Literature Synthesis

**Task:** Synthesise key findings from 15 papers on PLA degradation, identifying trends and gaps

**Why LLM:**
- Requires interpretation, not just extraction
- Needs to identify relationships between studies
- Must generate novel synthesis (not present in any single paper)
- Requires nuanced comparison

**Tool:** Llama 3.3 70B or GPT-4

**Output:** Narrative synthesis with trend analysis

---

#### Application 2: Experimental Design Brainstorming

**Task:** Propose 5 novel approaches to improve graphene dispersion in PLA electrospinning

**Why LLM:**
- Creative generation (new ideas)
- Requires understanding of multiple domains (polymers, nanomaterials, processing)
- Must evaluate trade-offs
- Needs to combine concepts in novel ways

**Tool:** GPT-4 or Claude

**Output:** Innovative experimental strategies

---

#### Application 3: Protocol Conversion

**Task:** Convert informal lab notes into standardised ISO-format synthesis protocol

**Why LLM:**
- Requires understanding context and intent
- Must generate properly structured text
- Needs to infer missing information appropriately
- Formatting complexity

**Tool:** Llama 3.3 8B (sufficient for this task)

**Output:** Formatted, professional protocol

---

### LLM Model Sizes: When to Use Each

| Size | Parameters | Speed | Best For | Materials Science Example |
|------|------------|-------|----------|--------------------------|
| **Small** | 7-8B | Fast | Routine tasks, formatting | Protocol formatting, simple summaries |
| **Medium** | 30-70B | Moderate | Complex analysis | Literature synthesis, data interpretation |
| **Large** | 175B+ | Slow | Critical reasoning, novelty | Patent strategy, research proposals |

**Rule:** **Use the smallest model that meets your quality threshold.**

---

## Decision Framework

### Step 1: Define Your Task

Ask:
- Is the output **predetermined** (extracting existing info) or **creative** (generating new text)?
- Is it **simple pattern matching** or **complex reasoning**?
- Do I need **speed** or **depth**?

---

### Step 2: Apply the Decision Tree

```
What's the nature of your task?

├─ EXTRACTING existing information
│   ├─ Simple patterns (keywords, categories)
│   │   └─> Use NLM (BERT family)
│   │       Examples: Paper screening, entity extraction
│   │
│   └─ Complex extraction requiring context
│       └─> Use small LLM (Llama 3.3 8B)
│           Examples: Protocol formatting, simple summaries
│
└─ GENERATING new content
    ├─ Routine, templated generation
    │   └─> Use small LLM (Llama 3.3 8B)
    │       Examples: Email drafts, format conversion
    │
    └─ Complex reasoning or creativity
        ├─ Important but not critical
        │   └─> Use medium LLM (Llama 3.3 70B)
        │       Examples: Literature synthesis, data analysis
        │
        └─ Mission-critical or high-stakes
            └─> Use large LLM (GPT-4, Claude Opus)
                Examples: Patent strategy, research proposals
```

---

## Case Studies: Right and Wrong Tool Selection

### Case Study 1: Paper Screening ✅ Done Right

**Task:** Find all papers mentioning "non-oxide ceramics" in a database of 10,000 papers

**Wrong approach:** Use ChatGPT, paste abstracts one by one  
**Time:** 50+ hours  
**Cost:** High API fees  
**Energy:** Massive  

**Right approach:** Use SciBERT keyword classifier  
**Time:** 5 minutes  
**Cost:** Negligible (local)  
**Energy:** Minimal  

**Lesson:** For simple pattern matching, NLMs are 600× more efficient.

---

### Case Study 2: Literature Synthesis ✅ Done Right

**Task:** Write introduction for manuscript synthesising 20 papers on PLA/graphene composites

**Wrong approach:** Use BERT to extract sentences from each paper  
**Result:** Disjointed list of facts, no narrative flow, no interpretation  

**Right approach:** Use Llama 3.3 70B with CO-STAR prompt  
**Result:** Coherent narrative identifying trends, gaps, and logical progression  

**Lesson:** For synthesis requiring interpretation, LLMs are necessary.

---

### Case Study 3: Hybrid Approach ✅ Done Right

**Task:** Analyse 100 patents to identify competitors' synthesis approaches, then write strategic report

**Step 1 (NLM):** SciBERT classifies patents by synthesis method (electrospinning, CVD, sol-gel, etc.)  
**Step 2 (NLM):** Extract key parameters from each category  
**Step 3 (LLM):** Llama 3.3 70B synthesises findings, identifies competitive gaps, recommends strategy  

**Lesson:** Combine tools—use NLMs for data processing, LLMs for analysis.

---

## Practical Implementation

### How to Access NLMs

#### Option 1: Hugging Face Transformers (Recommended)

```python
from transformers import pipeline

# Load pre-trained classifier
classifier = pipeline("text-classification", 
                     model="allenai/scibert_scivocab_uncased")

# Classify document
result = classifier("This paper discusses electrospinning of PLA...")
print(result)  # {'label': 'MATERIALS', 'score': 0.94}
```

**Advantages:**
- Free and open-source
- Runs locally (no data sharing)
- Fast inference
- Many pre-trained models available

---

#### Option 2: spaCy (For Entity Extraction)

```python
import spacy

# Load scientific NER model
nlp = spacy.load("en_core_sci_sm")

# Extract entities
doc = nlp("Polyethylene glycol was mixed with graphene oxide...")
for ent in doc.ents:
    print(f"{ent.text}: {ent.label_}")

# Output:
# Polyethylene glycol: CHEMICAL
# graphene oxide: CHEMICAL
```

---

### How to Access LLMs

**For sensitive work:** Use local sandbox (Ollama + Llama 3.3)  
**For non-sensitive work:** ChatGPT, Claude, Copilot (with proper precautions)

---

## Energy and Cost Comparison

### Real-World Scenario

**Task:** Process 1000 synthesis protocols to extract precursor materials

#### Approach A: Use GPT-4 (LLM)

- **Time:** ~2 hours (API rate limits)
- **Cost:** ~$50 (API fees)
- **Energy:** ~1 kWh
- **Water:** ~10 litres

#### Approach B: Use SciBERT (NLM)

- **Time:** ~5 minutes (local processing)
- **Cost:** $0 (local)
- **Energy:** ~0.01 kWh
- **Water:** ~0.1 litres

**Savings:** 100× reduction in energy, water, cost, and time.

---

## Exercise: Tool Selection

For each task, identify the most appropriate tool:

### Task 1

"Classify 500 papers into 5 categories: polymers, ceramics, composites, metals, coatings"

**Best tool:** ___________  
**Reasoning:** ___________

---

### Task 2

"Write a 2-page strategic analysis of competitive landscape based on 50 patents"

**Best tool:** ___________  
**Reasoning:** ___________

---

### Task 3

"Extract all temperature values mentioned in 100 synthesis protocols"

**Best tool:** ___________  
**Reasoning:** ___________

---

### Task 4

"Generate 10 novel experimental designs for improving fiber strength"

**Best tool:** ___________  
**Reasoning:** ___________

---

### Task 5

"Convert 20 handwritten lab notes into standardised digital format"

**Best tool:** ___________  
**Reasoning:** ___________

---

## Key Takeaways

!!! success "Remember"
    - **NLMs** for extraction, classification, structured tasks
    - **LLMs** for generation, reasoning, synthesis
    - **Use the smallest model** that meets your quality needs
    - **Hybrid approaches** combine efficiency with capability
    - **Environmental impact** should influence tool selection

---

**Next:** [Green AI Practices](green-ai.md) – Minimise your AI carbon footprint →
