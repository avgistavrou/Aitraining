# Context Matters

!!! note "Key Takeaways"
    - **Context is everything:** All information you provide helps LLMs understand your request (role, purpose, audience, requirements)
    - **Be specific, not vague:** Clear context gets relevant responses; vague prompts get generic ones
    - **Refine iteratively:** Start basic, review output, add details, repeat until satisfied
    - **Never share sensitive data:** No personal records, unpublished research, or confidential information

## Why Context Matters for LLMs

**Context** is everything you provide to an LLM to help it understand your request and generate appropriate responses during your chatbot session.

Without proper context, LLMs often produce generic, inaccurate, or inappropriate outputs.

### The Core Problem

LLMs have **no memory** between separate sessions. They have no inherent knowledge about:

- Who you are
- Your organisation's policies
- The purpose of your request
- Your audience
- Technical constraints

Large Language Models work by navigating through vast **embedding spaces**—multidimensional representations of knowledge and concepts. 

**Vague or poorly defined context** → model explores irrelevant areas → generic/off-target responses  
**Well-crafted context** → precise navigation instructions → relevant, targeted outputs

---

## Poor vs. Better Context

### ❌ Poor Context Example

```
Write me a report about productivity
```

**Problems:**
- No audience specified
- No length guidance
- No context about purpose
- No domain focus

**Result:** Generic business report that could apply to any industry.

---

### ✅ Better Context Example

```
I am a senior R&D manager at AmaDema, a nanotechnology company 
specialising in non-oxide ceramics. I need to write a 2-page 
executive summary about remote work productivity for our R&D 
department heads, focusing on evidence-based strategies specific 
to laboratory-based research teams, including practical 
implementation steps for hybrid lab schedules.
```

**Improvements:**
- ✓ Role identified (senior R&D manager)
- ✓ Organisation context (nanotechnology, non-oxide ceramics)
- ✓ Length specified (2 pages)
- ✓ Audience defined (R&D department heads)
- ✓ Domain focus (laboratory-based research)
- ✓ Output requirements (evidence-based, practical steps)

**Result:** Targeted, relevant content suitable for your specific needs.

---

## Types of Context

### 1. Explicit Context

Information you **directly provide** to the LLM:

- Your role and organisation
- The purpose of the task
- Target audience
- Output format (length, structure, tone)
- Specific constraints

### 2. Implicit Context

Assumptions the LLM **makes** based on your prompt:

- Cultural assumptions (Western vs. global perspective)
- Educational level expectations
- Language formality
- Technical depth

### Making Implicit Context Explicit

**Instead of assuming** the LLM will understand your context, **state it clearly**.

!!! example "Example Transformation"
    
    **Vague (relies on implicit context):**
    ```
    Help me write a proposal on sustainable materials
    ```
    
    **Explicit (states all relevant context):**
    ```
    I'm a researcher at AmaDema, a nanomaterial company. Help me 
    write a 3-page research funding proposal targeting EPSRC for a 
    project on sustainable non-oxide ceramic materials in 
    engineering applications. The audience is technical reviewers 
    with expertise in materials science. Include: research gap, 
    methodology, expected outcomes, and alignment with UK net-zero 
    goals.
    ```

---

## Never Share Sensitive Data

!!! danger "Red List – Never Share These"
    🚫 **Personal data:** Student records, staff information, health data  
    🚫 **Confidential research:** Unpublished findings, grant applications under review  
    🚫 **Commercial sensitive:** Partnership agreements, financial information, exact synthesis ratios  
    🚫 **Legal privileged:** Legal advice, disciplinary proceedings  
    🚫 **Security sensitive:** Passwords, system configurations, access credentials  
    🚫 **Intellectual property:** Unpublished molecular structures, novel formulations, proprietary processes

### Why This Matters

While LLMs have **no memory** between separate chat sessions and don't retain information from previous conversations, the data you share **within each individual session** may still be:

- Stored by the service provider
- Used for training future models (depending on terms)
- Subject to different legal jurisdictions
- Potentially accessed by third parties

**Always follow AmaDema's data protection policies** when sharing any information.

---

## Working Within Context Limits

LLMs have **context windows**—limits on how much text they can process at once or over different iterations.

| Model | Approximate Context Window |
|-------|---------------------------|
| GPT-4 | ~8,000-32,000 tokens |
| Claude 3 | ~200,000 tokens |
| Llama 3.3 8B | ~128,000 tokens |

**Rule of thumb:** 1 token ≈ 4 characters

### Strategies to Overcome Limits

✅ **Summarise lengthy background** information and prioritise the most important context  
✅ **Break complex tasks** into smaller parts  
✅ **Use previous outputs** as context for follow-up requests  
✅ **Extract only relevant sections** from long documents

---

## Iterative Context Building

You won't always get what you want on the first attempt. A useful strategy is to **start with basic context and refine**:

### The Refinement Loop

1. **Initial request:** Provide core context
2. **Review output:** Identify what's missing or wrong
3. **Refine context:** Add specific details or corrections
4. **Iterate:** Repeat until satisfactory

!!! example "Iterative Refinement in Action"
    
    **Round 1:**
    ```
    Summarise the key findings from this polymer synthesis paper.
    ```
    *Output: Generic summary of paper structure*
    
    **Round 2:**
    ```
    Focus specifically on the tensile strength results for PLA/PCL 
    blends at different ratios. I need this for a technical review.
    ```
    *Output: Focused on tensile data, but missing statistical significance*
    
    **Round 3:**
    ```
    Include the statistical significance (p-values) for each blend 
    ratio and highlight which formulations showed >20% improvement 
    over pure PLA.
    ```
    *Output: Precise, relevant summary with quantitative comparisons*

---

## Exercise: Context Writing

!!! question "Challenge"
    Transform this vague prompt into an effective, contextualised request:
    
    **Vague prompt:**
    ```
    Write about nanotechnology applications
    ```
    
    **Your task:**
    
    1. Add explicit context (role, audience, purpose)
    2. Define output requirements (length, format, depth)
    3. Specify constraints (focus areas, excluded topics)
    4. Test both versions in the sandbox
    5. Compare the quality difference

**What to include:**

- Your role at AmaDema
- The intended audience
- Specific application area (e.g., biomedical, aerospace, energy)
- Length and format
- Any required sections

---

**Next:** [Prompting Frameworks](../day1-2/overview.md) – Learn structured approaches to prompt engineering →
