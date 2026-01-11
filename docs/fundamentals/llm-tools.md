# LLM Tools

Large Language Models have been rapidly introduced to workplace environments since ChatGPT's breakthrough launch in late 2022. The landscape is quickly evolving, with major tech companies and AI startups releasing increasingly sophisticated models tailored for different use cases.

When selecting an LLM, consider:

- Data privacy policies
- Integration capabilities
- Cost structure
- Specific feature sets

## Available Tools

### Microsoft Copilot

**Website:** [copilot.microsoft.com](https://copilot.microsoft.com)  
**First Release:** March 2023

**Strengths:**
- Deep integration with Microsoft Office suite
- Enterprise data protection options
- Familiar interface for Office users

**Best for:** Document creation, email assistance, Office workflows, enterprise productivity

**Considerations:** Enterprise versions offer better data protection; requires Microsoft 365 subscription

---

### ChatGPT (OpenAI)

**Website:** [chat.openai.com](https://chat.openai.com)  
**First Release:** November 2022

**Strengths:**
- Conversational and intuitive
- Excellent for general tasks
- Strong coding assistance (Python, R, etc.)

**Best for:** Writing assistance, brainstorming, general Q&A, code generation

**Considerations:** Data usage policies vary by version; enterprise versions available

---

### Claude (Anthropic)

**Website:** [claude.ai](https://claude.ai)  
**First Release:** March 2023

**Strengths:**
- "Helpful, harmless, honest" approach
- Excellent for analysis and reasoning
- Large context window (200K+ tokens)

**Best for:** Analysis, research assistance, ethical reasoning, document processing

**Considerations:** Strong focus on safety and accuracy; handles long documents well

---

### Google Gemini

**Website:** [gemini.google.com](https://gemini.google.com)  
**First Release:** December 2023

**Strengths:**
- Multimodal capabilities (text, images, code)
- Integration with Google Workspace
- Multiple model sizes available

**Best for:** Research, document analysis, creative tasks, Google ecosystem integration

**Considerations:** Various models (Nano, Pro, Ultra) with different capabilities

---

### Google NotebookLM

**Website:** [notebooklm.google.com](https://notebooklm.google.com)  
**First Release:** July 2023

**Strengths:**
- Document-grounded AI (works with your sources)
- Creates podcast-style audio summaries
- Source-based research

**Best for:** Research analysis, document synthesis, creating audio overviews, literature review

**Considerations:** Works exclusively with your uploaded sources; Plus version offers higher usage limits

---

### Meta Llama

**Website:** [llama.meta.com](https://llama.meta.com)  
**First Release:** February 2023

**Strengths:**
- **Open-source** and customisable
- Strong performance across tasks
- Can be run locally (air-gapped)

**Best for:** Custom applications, on-premise deployment, research, sensitive data processing

**Considerations:** Requires technical expertise; various sizes available (8B to 405B parameters)

**Why we use this for the workshop:** Complete data privacy—your prompts never leave the room.

---

## Comparison Table

| Tool | Data Privacy | Cost | Materials Science Use |
|------|-------------|------|----------------------|
| **Microsoft Copilot** | Enterprise options | £££ | Literature synthesis, Office integration |
| **ChatGPT** | Enterprise options | ££ | Protocol writing, code generation |
| **Claude** | Strong protections | ££ | Analysis, research, long documents |
| **Gemini** | Google infrastructure | ££ | Multimodal (images + text) |
| **NotebookLM** | Source-based | £ | Literature review, audio summaries |
| **Llama (local)** | **Complete** | Free* | **All sensitive R&D work** |

*Free to use, but requires hardware investment

---

## Proper Attribution

!!! warning "Transparency Requirement"
    When AI tools significantly contribute to your work, proper attribution is essential for maintaining transparency and ethical standards.

**Example Attribution:**

> "Initial drafts of this literature review were developed with assistance from Claude (Sonnet 4). All sources were independently verified, analysis was conducted by the author, and conclusions represent the author's professional judgment."

### When to Attribute

**Always attribute if AI:**
- Drafted significant portions of text
- Generated data analysis code
- Structured arguments or frameworks
- Created figures or visualisations

**No attribution needed for:**
- Spell-checking and grammar corrections
- Simple formatting assistance
- Single-sentence rephrasing

---

## Tool Selection Framework

For your daily work at AmaDema, use this decision tree:

```
Is the data sensitive or unpublished?
├─ YES → Use local Llama sandbox (air-gapped)
└─ NO → Is it a long document (>10 pages)?
    ├─ YES → Use Claude or NotebookLM
    └─ NO → Is it Office-based work?
        ├─ YES → Use Microsoft Copilot
        └─ NO → Use ChatGPT or Gemini
```

---

**Next:** [Context Matters](context-matters.md) – Learn why context is everything in prompt engineering →
