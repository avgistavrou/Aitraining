# Bias and Fairness in AI

AI systems inherit and can amplify existing societal inequalities. As materials scientists, we must be vigilant about bias in AI outputs, even in technical contexts.

---

## Types of Bias

### 1. Gender Bias

**Manifestations:**
- Associating certain professions with specific genders
- Using gendered language inappropriately
- Making assumptions about capabilities based on gender

**Example in materials science:**
```
Prompt: "Describe a lead researcher in polymer chemistry"
Biased output: "He directs the lab and mentors junior scientists..."
```

**Mitigation:** Explicitly request gender-neutral or diverse examples

---

### 2. Racial and Ethnic Bias

**Manifestations:**
- Stereotypical associations with names or cultural references
- Underrepresenting certain groups in examples
- Making assumptions about backgrounds or capabilities

**Example:**
```
Prompt: "Provide examples of pioneering materials scientists"
Biased output: [Lists predominantly Western, white scientists]
```

**Mitigation:** Request diverse examples across cultures and regions

---

### 3. Socioeconomic Bias

**Manifestations:**
- Assuming access to resources or opportunities
- Using examples that exclude certain economic backgrounds
- Privileging certain educational or professional experiences

**Example:**
```
Prompt: "Suggest professional development for early-career scientists"
Biased output: "Attend international conferences, pursue postdoc at 
prestigious institution..." [Assumes funding availability]
```

**Mitigation:** Specify resource constraints explicitly

---

### 4. Geographic Bias

**Manifestations:**
- Focusing on Western/English-speaking perspectives
- Making assumptions about local contexts
- Overlooking global south perspectives

**Example:**
```
Prompt: "What are standard safety protocols for chemical labs?"
Biased output: [Assumes US/EU regulations and equipment availability]
```

**Mitigation:** Specify geographic context and available resources

---

## Bias Detection Questions

When reviewing AI outputs, ask:

**Representation:** Who is included and excluded in examples?

**Language:** Are descriptions fair and respectful to all groups?

**Assumptions:** What unstated assumptions are being made?

**Perspectives:** Whose viewpoints are prioritised?

**Stereotypes:** Are any harmful generalisations present?

---

## Mitigation Strategies

### 1. Request Diverse Examples Explicitly

**Instead of:**
```
"Provide examples of successful materials scientists"
```

**Try:**
```
"Provide examples of successful materials scientists from diverse 
backgrounds, including different genders, ethnicities, cultural 
contexts, and career paths. Explain their varied approaches and 
contributions."
```

---

### 2. Ask for Multiple Perspectives

**Instead of:**
```
"What's the best approach to sustainable materials development?"
```

**Try:**
```
"Describe approaches to sustainable materials development from 
perspectives of: (1) industrialised nations, (2) developing economies, 
(3) indigenous knowledge systems. Highlight different priorities and 
constraints."
```

---

### 3. Challenge Stereotypical Outputs

```
AI: "The senior engineer reviewed the calculations while his assistant prepared samples..."

You: "Why did you assume the senior engineer is male and assistant is female? 
Rewrite without gender assumptions and with diverse representation."
```

---

### 4. Include Diverse Voices in Verification

- Review AI outputs with colleagues from diverse backgrounds
- Seek input from underrepresented groups
- Challenge outputs that feel exclusionary

---

## Materials Science Specific Considerations

### Historical Bias in Training Data

**Issue:** Materials science literature historically overrepresents:
- Western research institutions
- Male researchers
- English-language publications
- Well-funded research areas

**Impact:** AI may perpetuate these biases in literature summaries and recommendations

**Mitigation:**
- Explicitly search for diverse sources
- Include non-English language research (translated)
- Prioritise open access to broaden representation

---

### Example Application Domains

When AI suggests applications for materials, be aware of bias:

**Biased framing:**
```
"PLA biomedical applications: surgical implants for hospitals"
[Assumes high-resource medical settings]
```

**Inclusive framing:**
```
"PLA biomedical applications: range from low-cost sutures for 
resource-limited settings to advanced implants for specialized surgery"
[Acknowledges resource diversity]
```

---

## Ethical Responsibility

### Data Rights and Training Data

**Issues:**
- LLMs trained on data collected without explicit consent
- Original authors/creators often not attributed or compensated
- Power imbalances in who benefits from AI

**Your responsibility:**
- Acknowledge AI's limitations in attribution
- Verify and cite original sources
- Support open access and equitable research practices

---

### Labour Practices in AI Development

**Hidden labour:**
- Reinforcement Learning from Human Feedback (RLHF) often outsourced
- Workers in lower-income countries, inadequate compensation
- Exposure to harmful content during moderation

**Your responsibility:**
- Be aware of human cost behind AI systems
- Support ethical AI providers
- Recognise AI is not "free"—humans enable it

---

## Action Items

- [ ] Review your common prompts for implicit biases
- [ ] Add diversity requirements to your prompt templates
- [ ] Challenge stereotypical outputs when they appear
- [ ] Verify AI recommendations against diverse sources
- [ ] Include diverse perspectives in your verification process

---

## Further Reading

- [Algorithmic Justice League](https://www.ajl.org/)
- [AI Now Institute Research](https://ainowinstitute.org/)
- *Race After Technology* by Ruha Benjamin
- *Algorithms of Oppression* by Safiya Noble

---

**Next:** [Resources](../resources/cheat-sheet.md) – Downloadable reference materials →
