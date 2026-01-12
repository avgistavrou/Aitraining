# Ethics, Bias, and Privacy

As professionals using AI in materials science, we have ethical responsibilities across three dimensions: fairness (bias), privacy (data security), and integrity (responsible use).

---

## Part 1: Bias and Fairness

AI systems inherit and can amplify existing societal inequalities. Even in technical contexts like materials science, we must be vigilant about bias.

### Types of Bias

#### 1. Gender Bias

**Manifestations:**
- Associating professions with specific genders
- Using gendered language inappropriately
- Making assumptions about capabilities

**Example:**
```
Prompt: "Describe a lead researcher in polymer chemistry"
Biased output: "He directs the lab and mentors junior scientists..."
```

**Mitigation:** Explicitly request gender-neutral or diverse examples

---

#### 2. Racial and Ethnic Bias

**Manifestations:**
- Stereotypical associations
- Underrepresenting certain groups
- Making assumptions about backgrounds

**Example:**
```
Prompt: "Provide examples of pioneering materials scientists"
Biased output: [Lists predominantly Western, white scientists]
```

**Mitigation:** Request diverse examples across cultures and regions

---

#### 3. Socioeconomic Bias

**Manifestations:**
- Assuming access to resources
- Privileging certain educational experiences
- Excluding economic backgrounds

**Example:**
```
Prompt: "Suggest professional development for early-career scientists"
Biased output: "Attend international conferences, pursue postdoc at 
prestigious institution..." [Assumes funding availability]
```

**Mitigation:** Specify resource constraints explicitly

---

#### 4. Geographic Bias

**Manifestations:**
- Focusing on Western perspectives
- Making assumptions about local contexts
- Overlooking global south perspectives

**Example:**
```
Prompt: "What are standard safety protocols for chemical labs?"
Biased output: [Assumes US/EU regulations and equipment availability]
```

**Mitigation:** Specify geographic context and available resources

---

### Bias Detection Questions

When reviewing AI outputs, ask:

**Representation:** Who is included and excluded in examples?

**Language:** Are descriptions fair and respectful to all groups?

**Assumptions:** What unstated assumptions are being made?

**Perspectives:** Whose viewpoints are prioritised?

**Stereotypes:** Are any harmful generalisations present?

---

### Mitigation Strategies

#### Strategy 1: Request Diverse Examples Explicitly

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

#### Strategy 2: Ask for Multiple Perspectives

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

#### Strategy 3: Challenge Stereotypical Outputs

```
AI: "The senior engineer reviewed the calculations while his assistant 
prepared samples..."

You: "Why did you assume the senior engineer is male and assistant is 
female? Rewrite without gender assumptions and with diverse representation."
```

---

#### Strategy 4: Include Diverse Voices in Verification

- Review AI outputs with colleagues from diverse backgrounds
- Seek input from underrepresented groups
- Challenge outputs that feel exclusionary

---

### Materials Science Specific Considerations

**Historical bias in training data:**
- Materials science literature overrepresents Western institutions, male researchers, English-language publications, well-funded research

**Impact:** AI may perpetuate these biases in summaries and recommendations

**Mitigation:**
- Explicitly search for diverse sources
- Include non-English language research (translated)
- Prioritise open access to broaden representation

---

### Example Application Domains

**Biased framing:**
```
"PLA biomedical applications: surgical implants for hospitals"
[Assumes high-resource medical settings]
```

**Inclusive framing:**
```
"PLA biomedical applications: range from low-cost sutures for 
resource-limited settings to advanced implants for specialised surgery"
[Acknowledges resource diversity]
```

---

### Ethical Responsibility: Labour Practices

**Hidden labour in AI:**
- Reinforcement Learning from Human Feedback (RLHF) often outsourced
- Workers in lower-income countries, inadequate compensation
- Exposure to harmful content during moderation

**Your responsibility:**
- Be aware of human cost behind AI systems
- Support ethical AI providers
- Recognize AI is not "free"—humans enable it

---

## Part 2: Privacy and Data Security

!!! warning "Critical Principle"
    When you use AI tools, your data:
    
    1. Travels over the internet to AI company servers
    2. Gets processed by systems you don't control
    3. May be stored temporarily or permanently
    4. Could potentially be used for training future models
    5. Might be subject to different legal jurisdictions

---

### Data Privacy Risk Assessment

Before using AI tools, evaluate risk level:

#### ✅ Low Risk (Generally Safe)

- Public information already available online
- General knowledge questions
- Anonymous, aggregated data
- Published research you're summarising
- Hypothetical scenarios for learning

**Example:**
```
"Explain general principles of electrospinning for educational purposes"
```

---

#### ⚠️ Medium Risk (Use with Caution)

- Internal documents with no personal data
- Draft policies before approval (sanitised)
- Academic work in progress (with proper disclosure)
- Aggregate industry data
- De-identified case studies

**Example:**
```
"Format this anonymised synthesis protocol (all specific values 
replaced with placeholders)"
```

**Mitigation:** Sanitise before sharing

---

#### ❌ High Risk (Avoid or Use Local Sandbox)

- Any personal or confidential information
- Unpublished research data
- Student or staff records
- Commercially sensitive material
- Proprietary formulations
- Customer information
- Financial data
- Legal documents

**Example of violation:**
```
"Analyse this unpublished data from Experiment #343"
```

**Solution:** Use local sandbox only

---

### Data Protection Best Practices

#### 1. Anonymise Data

**Before sharing:**
- Remove specific values → Use ranges or categories
- Replace names → Use roles or placeholders
- Strip metadata → Remove dates, locations, identifiers
- Generalise context → Remove company-specific details

---

#### 2. Use Placeholder Data

**For testing and learning:**
```
Instead of actual experimental data:
"Sample A: 42.3 MPa, Sample B: 45.1 MPa..."

Use hypothetical:
"Sample A: X MPa, Sample B: Y MPa where Y > X by ~5%..."
```

---

#### 3. Check Privacy Policies

Different AI tools have different data policies:

| Provider | Data Retention | Training Use | Enterprise Options |
|----------|---------------|--------------|-------------------|
| **ChatGPT** | 30 days (can opt out) | Optional | Yes (data isolation) |
| **Claude** | Not for training | No | Yes (enterprise) |
| **Copilot** | Microsoft terms | Depends on version | Yes (M365) |
| **Local Llama** | **Your control** | **Never** | **N/A** |

**Recommendation:** Read terms before sharing data

---

#### 4. Follow Data Classification Guidelines

**AmaDema data classification:**

| Level | Description | AI Use |
|-------|-------------|--------|
| **Public** | Published, public domain | ✅ Any tool |
| **Internal** | Non-sensitive, internal only | ⚠️ Sanitised only |
| **Confidential** | IP, customer data, financials | ❌ Local only |
| **Restricted** | Highly sensitive, regulated | ❌ Never |

---

#### 5. Consider On-Premises Alternatives

For sensitive work:

✅ **Local Llama models** (via Ollama)  
✅ **Enterprise licenses** with data protection guarantees  
✅ **Air-gapped systems** for critical work

---

### Regulatory Considerations

#### GDPR (EU/UK)

**Key points:**
- Personal data requires consent for processing
- AI processing may constitute "automated decision-making"
- Data minimisation principle applies
- Right to explanation for automated decisions

**For AmaDema:** Avoid sharing any personal data (employees, customers, partners) with public AI tools

---

#### Intellectual Property

**Key concerns:**
- Sharing unpublished research may affect patent priority
- Timestamp of AI interaction could count as "disclosure"
- Trade secrets lose protection if disclosed
- Copyright implications for AI-generated content

**For AmaDema:** Follow Red List protocol strictly

---

### The Local Sandbox Advantage

**Why local models for sensitive work:**

✅ **Complete privacy:** Data never leaves your device  
✅ **No external logging:** No service provider records  
✅ **Regulatory compliance:** Easier to meet data protection requirements  
✅ **No internet dependency:** Works offline  
✅ **Full control:** You manage data lifecycle

**Trade-offs:**
- Requires local compute resources
- Smaller models (but sufficient for most tasks)
- One-time setup effort

---

### Incident Response

**If you accidentally share sensitive data:**

1. **Stop immediately:** Don't continue conversation
2. **Document:** What was shared, when, which tool
3. **Report:** Notify your supervisor and IT/security team
4. **Mitigate:** Follow company incident response protocol
5. **Learn:** Update processes to prevent recurrence

---

## Part 3: Responsible Use Checklist

Before each AI interaction, verify:

**Bias Check:**
- [ ] Have I requested diverse perspectives?
- [ ] Will I challenge stereotypical outputs?
- [ ] Am I including underrepresented voices?

**Privacy Check:**
- [ ] Is this data already public?
- [ ] Does it contain personal information?
- [ ] Is it on the Red List?
- [ ] Have I checked the privacy policy of the tool?
- [ ] Could this data identify individuals or companies?
- [ ] Am I using the appropriate tool for the sensitivity level?
- [ ] Have I sanitised as needed?

**Environmental Check:**
- [ ] Is AI necessary for this task?
- [ ] Have I batched related queries?
- [ ] Am I using the smallest model that meets quality needs?
- [ ] Can I reuse existing outputs?

**Quality Check:**
- [ ] Will I verify critical claims?
- [ ] Will I check citations?
- [ ] Will I apply domain expertise to validation?

---

## Action Items

### Individual Level

- [ ] Review your common prompts for implicit biases
- [ ] Add diversity requirements to your prompt templates
- [ ] Challenge stereotypical outputs when they appear
- [ ] Create privacy decision flowchart for your work
- [ ] Implement Red List protocol rigorously

### Team Level

- [ ] Discuss bias and fairness in team meetings
- [ ] Share examples of good and bad practices
- [ ] Establish team privacy guidelines
- [ ] Create shared sanitisation templates
- [ ] Regular review of AI ethics practices

---

## Further Reading

**Bias and Fairness:**
- [Algorithmic Justice League](https://www.ajl.org/)
- [AI Now Institute Research](https://ainowinstitute.org/)
- *Race After Technology* by Ruha Benjamin
- *Algorithms of Oppression* by Safiya Noble

**Privacy and Security:**
- [ICO Guide to AI and Data Protection](https://ico.org.uk/for-organisations/guide-to-data-protection/key-dp-themes/guidance-on-ai-and-data-protection/)
- [GDPR compliance for AI](https://gdpr.eu/ai/)

---

**Next:** [Day 4 Exercises](exercises.md) – Practice ethical AI use →
