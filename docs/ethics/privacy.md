# Privacy & Data Security

!!! warning "Critical Principle"
    When you use AI tools for work-related tasks, your data typically:
    
    1. Travels over the internet to AI company servers
    2. Gets processed by AI systems you don't control
    3. May be stored temporarily or permanently
    4. Could potentially be used for training future models
    5. Might be subject to different legal jurisdictions

Understanding this data flow is crucial for making informed decisions about what information you share with AI systems.

---

## Data Privacy Risk Assessment

Before using AI tools, evaluate risk level:

### ✅ Low Risk (Generally Safe)

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

### ⚠️ Medium Risk (Use with Caution)

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

### ❌ High Risk (Avoid or Use Local Sandbox)

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

## Data Protection Best Practices

### 1. Anonymise Data

**Before sharing:**
- Remove specific values → Use ranges or categories
- Replace names → Use roles or placeholders
- Strip metadata → Remove dates, locations, identifiers
- Generalise context → Remove company-specific details

---

### 2. Use Placeholder Data

**For testing and learning:**
```
Instead of actual experimental data:
"Sample A: 42.3 MPa, Sample B: 45.1 MPa..."

Use hypothetical:
"Sample A: X MPa, Sample B: Y MPa where Y > X by ~5%..."
```

---

### 3. Check Privacy Policies

Different AI tools have different data policies:

| Provider | Data Retention | Training Use | Enterprise Options |
|----------|---------------|--------------|-------------------|
| **ChatGPT** | 30 days (can opt out) | Optional | Yes (data isolation) |
| **Claude** | Not for training | No | Yes (enterprise) |
| **Copilot** | Microsoft terms | Depends on version | Yes (M365) |
| **Local Llama** | **Your control** | **Never** | **N/A** |

**Recommendation:** Read terms before sharing data

---

### 4. Follow Data Classification Guidelines

**AmaDema data classification:**

| Level | Description | AI Use |
|-------|-------------|--------|
| **Public** | Published, public domain | ✅ Any tool |
| **Internal** | Non-sensitive, internal only | ⚠️ Sanitised only |
| **Confidential** | IP, customer data, financials | ❌ Local only |
| **Restricted** | Highly sensitive, regulated | ❌ Never |

---

### 5. Consider On-Premises Alternatives

For sensitive work:

✅ **Local Llama models** (via Ollama)  
✅ **Enterprise licenses** with data protection guarantees  
✅ **Air-gapped systems** for critical work

---

## Regulatory Considerations

### GDPR (EU/UK)

**Key points:**
- Personal data requires consent for processing
- AI processing may constitute "automated decision-making"
- Data minimisation principle applies
- Right to explanation for automated decisions

**For AmaDema:** Avoid sharing any personal data (employees, customers, partners) with public AI tools

---

### Intellectual Property

**Key concerns:**
- Sharing unpublished research may affect patent priority
- Timestamp of AI interaction could count as "disclosure"
- Trade secrets lose protection if disclosed
- Copyright implications for AI-generated content

**For AmaDema:** Follow Red List protocol strictly

---

## The Local Sandbox Advantage

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

## Incident Response

**If you accidentally share sensitive data:**

1. **Stop immediately:** Don't continue conversation
2. **Document:** What was shared, when, which tool
3. **Report:** Notify your supervisor and IT/security team
4. **Mitigate:** Follow company incident response protocol
5. **Learn:** Update processes to prevent recurrence

---

## Privacy Checklist

Before each AI interaction, verify:

- [ ] Is this data already public?
- [ ] Does it contain personal information?
- [ ] Is it on the Red List?
- [ ] Have I checked the privacy policy of the tool?
- [ ] Could this data identify individuals or companies?
- [ ] Am I using the appropriate tool for the sensitivity level?
- [ ] Have I sanitised as needed?

**If any red flags:** Use local sandbox instead

---

**Next:** [Environmental Impact](environmental.md) – The carbon cost of AI →
