# AmaDema AI Training - Comprehensive Quiz
**Test your knowledge across all four days of training**

---

## How to Use This Quiz

- **All questions:** Answer all questions before checking answers
- **Self-assessment:** Mark your responses and check against answer key at the end
- **Explanations:** Each answer includes an explanation to reinforce learning
- **Topics covered:** Prompt engineering frameworks, context, technical foundations, optimization, ethics

---

## Day 1: Foundations & AUTOMAT Framework

### Multiple Choice Questions

**Q1.** What does AUTOMAT stand for?

a) Audience, User Persona, Task, Output, Method, Assumptions, Tone  
b) Action, Task, Outcome, Measurement, Audience, Modalities, Tone  
c) Advanced Understanding Through Optimised Machine-Aided Techniques  
d) Algorithmic Testing and Optimisation for Machine Applications

---

**Q2.** When should you use the AUTOMAT framework?

a) For all AI tasks without exception  
b) For functional, structured tasks with clear input→output transformations  
c) Only for data extraction tasks  
d) For narrative, context-heavy strategic communication

---

**Q3.** What is the primary benefit of conversational learning with AI?

a) It saves time by getting quick answers without dialogue  
b) Asking "why" questions builds deeper understanding of underlying principles  
c) It makes the AI respond more politely to technical queries  
d) It reduces the total number of tokens used per task

---

**Q4.** According to the Red List protocol, which of these should NEVER be shared with cloud-based AI tools?

a) Published research papers available on CrossRef  
b) Proprietary synthesis recipes or unpublished experimental data  
c) General materials science questions found in textbooks  
d) Public domain technical specifications

---

**Q5.** In the AUTOMAT framework, what does the "**O - Output**" component specify?

a) The final decision made by the AI  
b) The exact format and structure required for results (e.g., Markdown table, JSON)  
c) The overall business objective of the project  
d) The file format for saving the prompt

---

### True/False Questions

**Q6.** TRUE or FALSE: Prompt engineering is primarily about using polite language to improve AI responses.

---

**Q7.** TRUE or FALSE: Providing a "User Persona" (U in AUTOMAT) helps prevent the AI from defaulting to a "helpful generalist" role.

---

**Q8.** TRUE or FALSE: The "Assumptions" (A in AUTOMAT) component is used to define constraints, such as what to exclude or how to handle missing data.

---

### Fill-in-the-Blank

**Q9.** The __________ component in AUTOMAT defines who will read the output, which directly influences the technical depth and terminology used.

---

**Q10.** Systematic prompt engineering can achieve __________% efficiency gains in scientific workflows by reducing the need for iterative refinement.

---

## Day 2: Context & CO-STAR Framework

### Multiple Choice Questions

**Q11.** Why is vague context problematic for LLMs in scientific tasks?

a) It increases the latency of the model response  
b) The model navigates the high-dimensional embedding space without clear constraints, leading to generic outputs  
c) AI models are programmed to ignore prompts with fewer than 50 words  
d) Vague context automatically triggers a safety refusal

---

**Q12.** What does the CO-STAR acronym represent?

a) Context, Objective, Structure, Tone, Analysis, Results  
b) Context, Objective, Style, Tone, Audience, Response  
c) Communication, Objectives, Strategy, Tone, Audience, Results  
d) Context, Output, Style, Task, Audience, Requirements

---

**Q13.** Which of these scenarios is best suited for the **CO-STAR** framework?

a) Extracting temperature values from 50 PDFs into a CSV table  
b) Writing a strategic investor pitch for non-oxide ceramic nanofibres  
c) Formatting a bibliography according to APA standards  
d) Converting a Python script to MATLAB

---

**Q14.** The "Five W's + H" framework for building context includes:

a) Who, What, When, Where, Why, How  
b) Which, What, When, Where, Why, How  
c) Who, What, Whether, Where, Why, How  
d) Who, What, When, Where, Whom, How

---

**Q15.** Which context "anti-pattern" involves assuming the AI already knows specific internal details about your project?

a) The Jargon Bomb  
b) The Assumption  
c) The Biography  
d) The Overload

---

**Q16.** In CO-STAR, how is "**Style**" distinct from "**Tone**"?

a) They are interchangeable terms for the same component  
b) Style is the writing approach (e.g., Academic, Journalistic), while Tone is the emotional quality (e.g., Confident, Cautious)  
c) Style refers to formatting, while Tone refers to word choice  
d) Tone is used for management, while Style is used for researchers

---

### True/False Questions

**Q17.** TRUE or FALSE: "Negative context" (specifying what NOT to do) is an effective strategy for preventing unwanted or toxic recommendations.

---

**Q18.** TRUE or FALSE: Hallucinations occur because AI models have a "bad memory" of the facts they learned during training.

---

**Q19.** TRUE or FALSE: The "Response" (R in CO-STAR) component should include the exact structure, such as specific paragraph counts or section headings.

---

### Fill-in-the-Blank

**Q20.** The "__________ Space Metaphor" describes how AI navigates billions of books in a library without a catalogue system.

---

**Q21.** When audience perspective significantly changes the required output, you should choose the __________ framework.

---

## Day 3: Technical Foundations & Hallucination Prevention

### Multiple Choice Questions

**Q22.** In a semantic space, why are "Steel" and "Iron" likely to have similar vectors?

a) The AI has an internal periodic table database  
b) They frequently appear in similar linguistic contexts in the training data  
c) The words have a similar number of characters  
d) They are both classified as "Metals" by a human supervisor during training

---

**Q23.** What is a "token" in the context of LLMs?

a) A complete word in any language  
b) A numerical ID representing a chunk of text (averaging ~4 characters)  
c) A security credential for accessing the sandbox  
d) A unit of measurement for model size

---

**Q24.** If the word "electrospinning" is split into ["Electro", "spinning"], what does this indicate?

a) The tokeniser has encountered a spelling mistake  
b) This is normal tokenisation for a compound word  
c) The AI does not understand the concept of electrospinning  
d) The word is too technical for the model's vocabulary

---

**Q25.** When a term splits into MANY tiny, non-meaningful tokens (e.g., "eletrospining" → ["ele", "tr", "osp", "ining"]), what is most likely happening?

a) Normal morphological splitting  
b) A spelling mistake or the term is outside the tokeniser's vocabulary  
c) The model is performing deep semantic analysis  
d) The model is trying to save memory

---

**Q26.** What is the primary function of the **Attention Mechanism**?

a) To increase the total number of parameters in the model  
b) To assign importance weights to different tokens in a sequence to capture context  
c) To retrieve facts from a pre-defined database  
d) To filter out biased training data

---

**Q27.** Why are LLMs prone to hallucinations regarding specific technical data?

a) They have intentional "creativity" settings that cannot be turned off  
b) They predict the most statistically probable next token based on patterns, not verified facts  
c) They are trained on intentionally incorrect data  
d) Their hardware occasionally suffers from "bit-flip" errors

---

**Q28.** In the sentence "The lead investigator supervised the lab," how does the model know "lead" is not a metal?

a) It checks a dictionary  
b) The attention mechanism focuses on "investigator" and "supervised" to disambiguate the meaning  
c) It assumes all technical papers are about researchers  
d) It doesn't; it always assumes the most common meaning

---

**Q29.** What is the mechanism behind AI-fabricated citations?

a) The AI is trying to convince the user it is correct  
b) It generates plausible-looking patterns (Author, Year, Journal) that match the statistical expectations of a citation  
c) It has access to a "fake papers" database  
d) It is confusing real papers with its own previous outputs

---

**Q30.** How does **Retrieval-Augmented Generation (RAG)** prevent hallucinations?

a) It makes the model larger and more intelligent  
b) It "grounds" the model's response in specific, retrieved documents provided in the prompt  
c) It retrains the model on your specific dataset in real-time  
d) It uses a second AI to check the first AI's work

---

**Q31.** When performing a factual data extraction task, what temperature setting is recommended?

a) 1.0 (Maximum creativity)  
b) 0.7 (Balanced)  
c) 0.1 (Minimum randomness/high determinism)  
d) Temperature does not affect data extraction

---

**Q32.** What is the "Sceptical Colleague" test in hallucination detection?

a) Asking a coworker to read the AI output  
b) A prompt technique where you tell the AI to act as a critical reviewer of its own output  
c) A psychological test for AI researchers  
d) A verification protocol involving CrossRef searches

---

**Q33.** What happens to the **embedding** of a technical term that appeared rarely in the training data?

a) It is automatically deleted to save space  
b) It has "poor quality"—meaning it has weak semantic connections and unreliable behaviour  
c) It is perfectly accurate because the AI focuses more on rare words  
d) It is replaced by a more common synonym

---

**Q34.** The 768 dimensions in a standard word embedding vector represent:

a) Human-defined properties like "density" or "hardness"  
b) Abstract, learned patterns discovered during training  
c) The 768 languages the model was trained on  
d) Fixed grammatical rules

---

### True/False Questions

**Q35.** TRUE or FALSE: Large Language Models (LLMs) function like a database that retrieves facts when queried.

---

**Q36.** TRUE or FALSE: Tokenization is the process of converting text into numerical coordinates.

---

**Q37.** TRUE or FALSE: A model with 3,072 dimensions (like Llama 3.2) can capture more subtle meaning differences than one with 768 dimensions.

---

**Q38.** TRUE or FALSE: CrossRef and Google Scholar are essential tools for verifying AI-generated citations.

---

### Fill-in-the-Blank

**Q39.** The "__________ Window" refers to the maximum number of tokens a model can process in a single interaction.

---

**Q40.** Rule of thumb: 1,000 tokens is approximately __________ English words.

---

## Day 4: Optimisation, Ethics & Advanced Techniques

### Multiple Choice Questions

**Q41.** What is the primary objective of asking "why" questions in a conversational learning cascade?

a) To exhaust the AI's token limit  
b) To force the model to reveal the underlying principles, assumptions, and reasoning logic  
c) To check if the AI is still responsive  
d) To get a shorter, more concise answer

---

**Q42.** Which "why" question template asks: "Under what conditions would this synthesis method fail?"

a) Mechanism Questions  
b) Boundary Questions  
c) Comparative Questions  
d) Assumption Questions

---

**Q43.** How does **Prompt Caching** improve efficiency?

a) It stores the AI's final answer for later use  
b) It reuses the mathematical representations of repeated prompt prefixes to reduce latency and cost  
c) It saves the user's login credentials  
d) It speeds up the internet connection

---

**Q44.** Generating 1,000 words with a model like GPT-4 has a carbon footprint roughly equivalent to:

a) Boiling a kettle for 10 minutes  
b) Powering a smartphone for 30 minutes (approx. 4.32g CO₂e)  
c) Driving a car for 5 kilometres  
d) Using a laptop for 24 hours

---

**Q45.** What is the benefit of "**Query Batching**"?

a) It makes the AI's reasoning more "creative"  
b) It reduces overhead and API costs by processing multiple related tasks in a single request  
c) It bypasses safety filters  
d) It allows the AI to ignore constraints

---

**Q46.** Which type of bias occurs when training data reflects historical inequalities or stereotypes?

a) Selection Bias  
b) Representation Bias  
c) Measurement Bias  
d) Latent Bias

---

**Q47.** In AI ethics, the "Right to Explanation" refers to:

a) The AI's right to explain why it cannot answer a prompt  
b) A user's right to receive a meaningful explanation of the logic behind an automated decision  
c) The requirement for AI companies to explain their pricing models  
d) The right of researchers to publish AI-generated papers

---

**Q48.** When is a **high temperature** (e.g., 0.9) appropriate?

a) Extracting data from lab notes  
b) Brainstorming novel application areas for a new material  
c) Generating safety protocols  
d) Formatting citations

---

**Q49.** What does "**Model Quantisation**" involve?

a) Increasing the number of parameters in a model  
b) Reducing the numerical precision of model weights (e.g., from 16-bit to 4-bit) to save memory and energy  
c) Training a model on quantum computers  
d) Measuring the model's accuracy on a scale of 1 to 100

---

**Q50.** If an AI output contains gender or geographic bias, what is the best professional response?

a) Accept the output as "standard" AI behaviour  
b) Explicitly challenge the assumption in a follow-up and refine the prompt with fairness criteria  
c) Manually edit the output without telling anyone  
d) Stop using the model immediately

---

### True/False Questions

**Q51.** TRUE or FALSE: Local models (run on your own hardware) always have a higher carbon footprint than cloud models.

---

**Q52.** TRUE or FALSE: Reinforcement Learning from Human Feedback (RLHF) often relies on outsourced labour in lower-income countries.

---

**Q53.** TRUE or FALSE: Asking "Why is this principle generalisable?" is an example of a **Transfer Question**.

---

**Q54.** TRUE or FALSE: Bias in materials science AI is impossible because the field is purely objective and technical.

---

### Fill-in-the-Blank

**Q55.** The "__________ Cascade" technique involves asking 10 progressive "why" questions to build expert-level insight.

---

**Q56.** Using a small local model (e.g., 8B parameters) instead of a large cloud model for routine tasks is a core __________ AI practice.

---

**Q57.** In RAG systems, the "__________ Database" stores the numerical representations of your documents for fast retrieval.

---

---

# Answer Key

## Day 1 Answers

**Q1: a)** Audience, User Persona, Task, Output, Method, Assumptions, Tone  
*Explanation:* This is the professional AUTOMAT framework for functional tasks.

**Q2: b)** For functional, structured tasks with clear input→output transformations  
*Explanation:* AUTOMAT is designed for precision and reproducibility in technical workflows.

**Q3: b)** Asking "why" questions builds deeper understanding of underlying principles  
*Explanation:* Conversational learning moves beyond "getting an answer" to building expertise.

**Q4: b)** Proprietary synthesis recipes or unpublished experimental data  
*Explanation:* Red List items are sensitive intellectual property that must stay within the local sandbox.

**Q5: b)** The exact format and structure required for results  
*Explanation:* Specifying output upfront (e.g., "Markdown table") reduces iterations and reformatting work.

**Q6: FALSE**  
*Explanation:* Prompt engineering is about technical specification and constraint definition, not etiquette.

**Q7: TRUE**  
*Explanation:* Defining a persona (e.g., "Senior Polymer Chemist") focuses the model's knowledge domain.

**Q8: TRUE**  
*Explanation:* Assumptions/Constraints are critical for preventing hallucinations and ensuring relevance.

**Q9: Audience**  
*Explanation:* The audience determines if the output should be high-level (Management) or deeply technical (R&D).

**Q10: 50-75%**  
*Explanation:* Structured prompting significantly reduces time wasted on manual corrections and trial-and-error.

---

## Day 2 Answers

**Q11: b)** The model navigates the high-dimensional embedding space without clear constraints  
*Explanation:* Vague prompts allow the model to provide generic, "nearest neighbour" answers that lack specificity.

**Q12: b)** Context, Objective, Style, Tone, Audience, Response  
*Explanation:* This is the CO-STAR framework for strategic, narrative communication.

**Q13: b)** Writing a strategic investor pitch for non-oxide ceramic nanofibres  
*Explanation:* CO-STAR is best for tasks where audience perspective and narrative strategy are critical.

**Q14: a)** Who, What, When, Where, Why, How  
*Explanation:* This checklist ensures all necessary situational context is provided to the model.

**Q15: b)** The Assumption  
*Explanation:* The Assumption anti-pattern leads to "context gaps" where the AI is forced to guess.

**Q16: b)** Style is the writing approach, while Tone is the emotional quality  
*Explanation:* "Style: Academic, Tone: Cautious" is a common professional combination.

**Q17: TRUE**  
*Explanation:* Negative context (e.g., "Do not use toxic solvents") is a powerful constraint for safety.

**Q18: FALSE**  
*Explanation:* Hallucinations are a result of statistical pattern completion, not a failure of a memory retrieval system.

**Q19: TRUE**  
*Explanation:* Specifying structure (e.g., "2 paragraphs per section") ensures the output meets professional requirements.

**Q20: Embedding**  
*Explanation:* The embedding space metaphor helps visualise how AI organises and retrieves related concepts.

**Q21: CO-STAR**  
*Explanation:* CO-STAR is specifically designed for audience-centric, strategic communication.

---

## Day 3 Answers

**Q22: b)** They frequently appear in similar linguistic contexts in the training data  
*Explanation:* AI calculates semantic proximity based on how words co-occur in billions of sentences.

**Q23: b)** A numerical ID representing a chunk of text  
*Explanation:* Tokens are the fundamental units of processing for LLMs (approx. 0.75 words).

**Q24: b)** This is normal tokenisation for a compound word  
*Explanation:* Tokenisers split complex words into common morphemes to handle technical vocabulary efficiently.

**Q25: b)** A spelling mistake or the term is outside the tokeniser's vocabulary  
*Explanation:* Excessive splitting is a "red flag" for potential errors or model unfamiliarity.

**Q26: b)** To assign importance weights to different tokens in a sequence  
*Explanation:* Attention allows the model to process "lead" differently in "lead investigator" vs "lead pipe."

**Q27: b)** They predict the most statistically probable next token  
*Explanation:* LLMs are pattern-matchers, not truth-checkers. They prioritise "plausibility" over "factuality."

**Q28: b)** The attention mechanism focuses on "investigator" and "supervised"  
*Explanation:* Contextual words allow the model to select the correct meaning in the high-dimensional space.

**Q29: b)** It generates plausible-looking patterns  
*Explanation:* The AI knows what a citation *looks like*, even if it hasn't seen that specific paper.

**Q30: b)** It "grounds" the model's response in specific, retrieved documents  
*Explanation:* RAG moves the source of information from the model's weights to a provided document.

**Q31: c)** 0.1 (Minimum randomness)  
*Explanation:* Low temperature ensures the model selects the most probable (and usually most accurate) tokens.

**Q32: b)** A prompt technique where you tell the AI to act as a critical reviewer  
*Explanation:* Self-correction prompts can identify 30-50% of hallucinations before a human sees them.

**Q33: b)** It has "poor quality"—meaning it has weak semantic connections  
*Explanation:* Rare words don't have enough data points to occupy a stable, accurate position in meaning-space.

**Q34: b)** Abstract, learned patterns discovered during training  
*Explanation:* These dimensions represent complex linguistic and conceptual relationships learned from data.

**Q35: FALSE**  
*Explanation:* LLMs are generative models, not retrieval databases.

**Q36: FALSE**  
*Explanation:* Tokenisation converts text to IDs; **Embedding** converts IDs to coordinates (vectors).

**Q37: TRUE**  
*Explanation:* Higher dimensionality allows for a more "fine-grained" map of human knowledge.

**Q38: TRUE**  
*Explanation:* Independent verification is the only 100% reliable way to catch technical hallucinations.

**Q39: Context**  
*Explanation:* The context window limits how much information the model can "keep in mind" at once.

**Q40: 750**  
*Explanation:* 1,000 tokens ≈ 750 words (0.75 ratio).

---

## Day 4 Answers

**Q41: b)** To force the model to reveal the underlying principles  
*Explanation:* "Why" questions move the interaction from "what to do" to "how it works."

**Q42: b)** Boundary Questions  
*Explanation:* Boundary questions explore where a rule, method, or principle ceases to be applicable.

**Q43: b)** It reuses the mathematical representations of repeated prompt prefixes  
*Explanation:* Caching saves compute power (and cost) for common instructions like framework definitions.

**Q44: b)** Powering a smartphone for 30 minutes (approx. 4.32g CO₂e)  
*Explanation:* AI has a modest but measurable environmental cost per query.

**Q45: b)** It reduces overhead and API costs  
*Explanation:* Processing 10 images in one query is significantly more efficient than 10 separate queries.

**Q46: b)** Representation Bias  
*Explanation:* Representation bias occurs when certain groups or perspectives are underrepresented in the training data.

**Q47: b)** A user's right to receive a meaningful explanation  
*Explanation:* This is a core principle of GDPR and responsible AI governance.

**Q48: b)** Brainstorming novel application areas  
*Explanation:* Higher temperature allows for more divergent, "creative" token selection.

**Q49: b)** Reducing the numerical precision of model weights  
*Explanation:* Quantisation makes models small enough to run on local laptops or edge devices.

**Q50: b)** Explicitly challenge the assumption  
*Explanation:* Professional use requires active bias mitigation and prompt refinement.

**Q51: FALSE**  
*Explanation:* For repetitive tasks, local models are often 100-1000× more efficient than cloud calls.

**Q52: TRUE**  
*Explanation:* RLHF involves significant human labour, often under difficult conditions.

**Q53: TRUE**  
*Explanation:* Transfer questions explore how a concept from one domain applies to another.

**Q54: FALSE**  
*Explanation:* Technical literature reflects the historical biases of the researchers who wrote it.

**Q55: Why**  
*Explanation:* The "Why Cascade" is a powerful tool for deep technical learning.

**Q56: Green**  
*Explanation:* Model selection (choosing the smallest tool for the job) is a primary Green AI strategy.

**Q57: Vector**  
*Explanation:* Vector databases allow for high-speed similarity searches during the retrieval phase of RAG.

---

## Scoring Guide

**Excellent (90-100%):** 51-57 correct  
**Good (80-89%):** 46-50 correct  
**Pass (70-79%):** 40-45 correct  
**Review recommended (<70%):** <40 correct

---

## Next Steps

- **<70%:** Review course materials for topics where you struggled.
- **70-89%:** Focus review on specific weak areas identified.
- **≥90%:** Excellent! You have demonstrated professional-level mastery of prompt engineering.

---

**Course materials:** [AmaDema AI Training Documentation](index.md)
