# Golden Prompts Library

Pre-tested, high-quality prompts for common materials science tasks. Copy, customise, and use.
---

## Usage Tips

1. **Copy the full prompt** including structure
2. **Replace `[VARIABLES]`** with your specific information
3. **Adjust constraints** based on your specific needs
4. **Test once** in sandbox, then save successful version as template
5. **Share** effective prompts with team

---

## Literature Review & Synthesis

### 1. Paper Summary for Technical Review

```
Act as a Materials Science Technical Reviewer with expertise in [DOMAIN].

Task: Summarise the synthesis methodology and key findings from the 
following paper for technical review by R&D team.

Paper: [TITLE], [DOI]

Output format:
1. Synthesis Method (brief description, 2-3 sentences)
2. Key Parameters (table with columns: Parameter, Value, Units)
3. Main Findings (3-5 bullet points with quantitative results)
4. Novelty/Innovation (2-3 sentences)
5. Limitations/Caveats (bullet points)
6. Relevance to [SPECIFIC_APPLICATION] (1-2 sentences)

Constraints:
- Extract only explicitly stated values (no estimation)
- If methodology unclear, note as limitation
- Include error bars/standard deviations where reported
- Do not compare to other papers unless explicitly mentioned

Tone: Technical, objective, suitable for peer review
```

**Variables to customise:**
- `[DOMAIN]`: polymer chemistry, ceramic materials, nanocomposites
- `[SPECIFIC_APPLICATION]`: Your focus area
- `[TITLE], [DOI]`: Paper details

---

### 2. Comparative Literature Analysis

```
Act as a Senior Researcher in [FIELD] conducting systematic literature review.

Context: Preparing competitive analysis of [SPECIFIC_TECHNOLOGY] approaches 
for R&D strategy meeting.

Task: Analyse the following [N] papers and create comparative synthesis.

Papers:
1. [DOI or citation]
2. [DOI or citation]
...

Output format:
1. Comparison table with columns:
   - Paper (Author Year)
   - Synthesis Method
   - Key Innovation
   - Performance Metrics
   - Scalability Assessment (High/Medium/Low)
   - Our Competitive Position vs. this work

2. Trend Analysis (1-2 paragraphs):
   - What patterns emerge across papers?
   - What gaps exist in current approaches?

3. Strategic Recommendations (3-5 bullets):
   - Where should we focus R&D efforts?

Constraints:
- Only include peer-reviewed journal articles
- Focus on papers from last 5 years
- Highlight approaches we could realistically implement
- Flag any IP conflicts with our pending patents

Tone: Strategic, evidence-based, actionable for decision-making
```

---

## Protocol & Documentation

### 3. Lab Notes to Standardised Protocol

```
Act as a Laboratory Documentation Specialist with expertise in 
materials synthesis.

Task: Convert informal lab notebook entry into standardised ISO-compliant 
synthesis protocol.

Output format:
## 1. Materials
- List all materials with: Chemical name, CAS number (if known), 
  Supplier, Purity, Molecular weight

## 2. Equipment
- List all equipment with model numbers where applicable

## 3. Safety Considerations
- Hazards and required PPE
- Disposal requirements

## 4. Procedure
Numbered steps with:
- Specific quantities (mass, volume)
- Time and temperature for each step
- Key observations/checkpoints

## 5. Characterisation
- Methods used
- Key parameters measured

## 6. Expected Outcomes
- Yield, appearance, key properties

Constraints:
- If information missing from notes, mark as [TO BE DETERMINED]
- Do not speculate on missing values
- Use SI units throughout
- For ambiguous steps, note [CLARIFICATION NEEDED: specific question]
- Include safety warnings for hazardous steps

Tone: Formal, precise, suitable for regulatory documentation

Lab notebook entry:
[PASTE ENTRY HERE]
```

---

### 4. Experimental Design Documentation

```
Act as an Experimental Design Specialist in [DOMAIN].

Task: Create structured experimental design document based on the 
following research question.

Research Question: [YOUR QUESTION]

Output format:
## 1. Hypothesis
Clear, testable hypothesis

## 2. Variables
- Independent variables (what we'll change)
- Dependent variables (what we'll measure)
- Controlled variables (what we'll keep constant)

## 3. Experimental Design
- Design type (factorial, one-factor-at-a-time, DOE, etc.)
- Number of samples/replicates
- Randomization strategy

## 4. Methodology
Step-by-step procedure (brief)

## 5. Characterisation Plan
- What measurements
- What equipment
- What will each measurement tell us

## 6. Success Criteria
- What results would support hypothesis?
- What results would reject hypothesis?
- What statistical tests will we use?

## 7. Potential Challenges
- What could go wrong?
- Mitigation strategies

Constraints:
- Design must be feasible with our existing equipment
- Total time should not exceed [TIMEFRAME]
- Budget constraint: [AMOUNT]
- Prioritise approaches with literature precedent

Tone: Scientific, rigorous, suitable for project planning
```

---

## Data Analysis

### 5. Tensile Testing Data Analysis

```
Act as a Materials Testing Engineer with expertise in mechanical characterisation.

Task: Analyse the following stress-strain data from tensile testing.

Data: [ATTACH FILES or PASTE DATA]

Sample information:
- Material: [MATERIAL]
- Sample dimensions: [LENGTH x WIDTH x THICKNESS]
- Test conditions: [TEMPERATURE, HUMIDITY, CROSSHEAD SPEED]
- Number of samples: [N]

Output format:
## 1. Data Quality Assessment
- Any samples with irregular curves (noise, slippage, premature failure)?
- Samples to exclude and why

## 2. Calculated Properties (table)
Columns: Sample ID, Tensile Strength (MPa), Young's Modulus (GPa), 
Elongation at Break (%), Notes

## 3. Statistical Summary
- Mean ± Standard Deviation for each property
- Coefficient of Variation (CV%)
- Outlier analysis (>2 SD from mean)

## 4. Comparison to Baseline
If baseline data provided: statistical significance (t-test, p-value)

## 5. Python Code
Commented code used for calculations (for reproducibility)

Constraints:
- Young's modulus calculated from linear region (strain 0.05-0.25%)
- Report values to 2 decimal places
- Flag any samples with CV% > 15% for property
- Use ISO 527 standards for calculations

Tone: Technical, objective, suitable for QC documentation
```

---

## Strategic Communication

### 6. Executive Summary for Non-Technical Audience

```
Act as a Technical Communication Specialist translating materials science 
for business stakeholders.

Context: [PROVIDE CONTEXT: project update, funding request, partnership discussion]

Objective: Create executive summary that communicates technical achievement 
and business impact to non-technical leadership.

Technical content to communicate:
[DESCRIBE TECHNICAL WORK]

Output format:
## Opening (1 paragraph)
- The opportunity or challenge
- Why it matters (business impact)

## What We Did (2 paragraphs)
- Technical approach explained simply (avoid jargon, use analogies)
- Why this approach is innovative

## Results (1-2 paragraphs)
- Key achievements (quantitative)
- What this enables (applications, market potential)

## Business Impact (1 paragraph)
- Revenue potential, cost savings, competitive advantage
- Timeline to commercialisation

## Next Steps (3-5 bullets)
- Clear, actionable recommendations
- Resource requirements

Length: Maximum 1.5 pages (600-700 words)

Constraints:
- Assume audience has business background, not materials science
- Define any unavoidable technical terms inline
- Emphasise business value, not technical elegance
- Include 1-2 quantitative metrics (cost reduction %, performance improvement %)
- Avoid hype—credible, evidence-based claims only

Tone: Confident, business-focused, accessible to non-technical readers
```

---

## Troubleshooting & Problem-Solving

### 7. Experimental Troubleshooting

```
Act as a Senior Materials Scientist with expertise in [PROCESS/TECHNIQUE].

Context: I'm experiencing the following problem in my experiments:
[DESCRIBE PROBLEM]

Current conditions:
- Material: [MATERIAL]
- Process: [PROCESS]
- Key parameters: [LIST PARAMETERS]
- Observed result: [WHAT YOU'RE SEEING]
- Expected result: [WHAT YOU WANT]

Task: Provide systematic troubleshooting guide.

Output format:
## 1. Problem Analysis
- Most likely root causes (ranked by probability)
- Why each could cause observed symptoms

## 2. Diagnostic Tests
For each suspected cause:
- How to test if this is the problem
- What result would confirm/rule out
- Difficulty/time for test (Quick/Moderate/Extensive)

## 3. Solutions
For each confirmed cause:
- Corrective action
- Expected outcome
- Potential side effects
- Literature precedent (if any)

## 4. Preventive Measures
How to avoid this problem in future

Constraints:
- Solutions must be feasible with standard lab equipment
- Prioritise low-cost, quick-to-test solutions first
- Flag any solutions requiring >1 week implementation
- Do not propose solutions without explaining mechanism

Tone: Practical, systematic, mentor-like
```

---

## Brainstorming & Innovation

### 8. Alternative Approaches Generation

```
Act as an Innovation Consultant in [FIELD] with expertise in [SUBDOMAIN].

Context: We're experiencing [PROBLEM] with our current approach to [PROCESS]. 
Existing methods have the following limitations: [LIST LIMITATIONS].

Current approach:
[DESCRIBE CURRENT METHOD]

Task: Propose 5 alternative experimental approaches to solve this problem.

For each approach, provide:
## Approach N: [DESCRIPTIVE NAME]

**Description:** (2-3 sentences explaining the approach)

**Mechanism:** Why this could solve the problem (scientific rationale)

**Advantages:**
- [Bullet points]

**Challenges/Risks:**
- [Bullet points]

**Resource Requirements:**
- Equipment needed
- Materials/chemicals
- Estimated time to test
- Approximate cost

**Literature Precedent:**
- Has this been tried? (Citation if yes, "Novel" if no)

**Risk Level:** High/Medium/Low

**Priority Recommendation:** 1-5 (1=highest priority)

Constraints:
- Focus on approaches feasible with our existing capabilities
- Stay within €[BUDGET] for initial testing
- Exclude approaches requiring >6 months development
- Prioritise approaches with some literature validation
- Consider safety and environmental impact

Output order: Ranked by priority (1-5)

Tone: Creative but grounded, enthusiasm balanced with realism
```

---

## IP & Competitive Intelligence

### 9. Patent Prior Art Search Summary

```
Act as a Patent Analyst with expertise in materials science IP.

Context: Preparing prior art search for patent application on [INVENTION SUMMARY].

Task: Review the following patents/papers and assess overlap with our invention.

Our key claims:
1. [CLAIM 1]
2. [CLAIM 2]
3. [CLAIM 3]

Prior art to review:
1. [Patent/Paper 1: Title, Number/DOI]
2. [Patent/Paper 2: Title, Number/DOI]
...

Output format: Table with columns

| Reference | Year | Key Claims/Findings | Overlap with Our Work | Assessment | Notes for Legal |
|-----------|------|---------------------|----------------------|------------|-----------------|
| [#] | [YYYY] | [Summary] | High/Medium/Low/None | [Analysis] | [Specific concerns] |

Follow-up analysis:
## 1. High Overlap Items
Detailed discussion of any High overlap cases

## 2. Freedom to Operate Assessment
- Do any references block our approach?
- Workarounds if needed?

## 3. Novelty Positioning
- What aspects of our invention are clearly novel?
- How to position claims to maximize patentability?

Constraints:
- Focus only on claims/findings directly related to our invention
- Be conservative in overlap assessment (err on side of caution)
- Flag any expired patents that could provide prior art defense
- Note any inventors who are potential competitors

Tone: Formal, cautious, suitable for legal review
```

---

## Teaching & Knowledge Transfer

### 10. Concept Explanation for Training

```
Act as a Pedagogy Expert and Materials Science Educator.

Task: Explain [CONCEPT] to a new team member with [BACKGROUND LEVEL] in materials science.

Target understanding:
- They should be able to [LEARNING OBJECTIVE]

Output format:
## 1. Simple Explanation
- 2-3 sentences, minimal jargon
- Use analogy or everyday example

## 2. Scientific Detail
- Proper explanation with technical terms
- Key principles and mechanisms
- 3-4 paragraphs

## 3. Why It Matters
- Relevance to our work
- Real-world applications
- What goes wrong if not understood

## 4. Common Misconceptions
- Mistakes beginners often make
- How to avoid them

## 5. Hands-On Learning
- Simple experiment or demonstration they could do
- What they'd observe and what it teaches

## 6. Further Reading
- 2-3 recommended resources (papers, textbooks, videos)
- For different learning styles

Constraints:
- Start simple, build complexity gradually
- Use examples relevant to our specific materials/processes
- Emphasise practical application over pure theory
- Include visual descriptions (we'll create diagrams separately)

Tone: Friendly, encouraging, patient (good mentor voice)
```

---

## Python Code Generation for Materials Science

### Template 1: Data Analysis & Visualization

```
[A] Audience: R&D scientists who will use this code for routine data analysis 
tasks. Code must be self-documenting and easy to maintain.

[U] User Persona: Act as a Senior Data Scientist specializing in materials 
testing analysis, with expertise in Python (pandas, numpy, matplotlib, scipy), 
statistical analysis, and scientific data visualization.

[T] Task: Create a Python function that {SPECIFIC_TASK_DESCRIPTION}.

Input data format: {INPUT_FORMAT}
Expected output: {OUTPUT_DESCRIPTION}

[O] Output requirements:
1. Complete Python function with type hints (PEP 484)
2. Comprehensive docstring (Google style) including:
   - Function purpose
   - Args with types and descriptions
   - Returns with type and description
   - Raises for all exceptions
   - Example usage
3. Inline comments explaining complex logic
4. Error handling for edge cases:
   - Missing data points
   - Invalid input formats
   - Division by zero / mathematical errors
   - File I/O errors (if applicable)
5. Unit test examples (pytest format)

[M] Method:
- Follow PEP 8 style guidelines strictly
- Use vectorized operations (numpy/pandas) instead of explicit loops
- Implement proper data validation at function entry
- Use descriptive variable names (e.g., stress_values, strain_data)
- Optimize for performance using pandas.DataFrame methods
- Include type checking for numpy arrays and pandas DataFrames

[A] Assumptions/Constraints:
- Code must handle missing data gracefully (flag or interpolate, never crash)
- If {CRITICAL_PARAMETER} is not provided, raise ValueError with clear message
- All numerical outputs must include uncertainty quantification where applicable
- Visualization code must use colorblind-friendly palettes
- For file operations: validate paths exist before reading/writing
- Statistical calculations must report confidence intervals or p-values
- Do NOT hardcode file paths or magic numbers (use function parameters/constants)

[T] Tone: Professional, production-ready code suitable for peer review and 
version control. Prioritize clarity and maintainability over cleverness.
```

**Variables to customise:**
- `{SPECIFIC_TASK_DESCRIPTION}`: e.g., "analyses stress-strain curves from tensile testing and calculates Young's modulus, tensile strength, and elongation at break"
- `{INPUT_FORMAT}`: e.g., "CSV file with columns: Strain (%), Stress (MPa)" or "numpy array of shape (n_samples, 2)"
- `{OUTPUT_DESCRIPTION}`: e.g., "Dictionary containing calculated properties + matplotlib figure object"
- `{CRITICAL_PARAMETER}`: e.g., "strain range for modulus calculation"

**Example usage:**
```
Task: Create a Python function that analyses stress-strain curves from 
tensile testing (CSV input) and calculates Young's modulus, tensile 
strength, and elongation at break. Include automated outlier detection.

Input data format: CSV file with columns [Strain (%), Stress (MPa)]
Expected output: Dictionary with {modulus, tensile_strength, elongation, 
quality_flag} + matplotlib figure showing curve with linear fit region
```

---

### Template 2: Laboratory Automation Scripts

```
[A] Audience: Lab technicians and researchers who will run this script 
regularly as part of routine workflows. Must be robust and idiot-proof.

[U] User Persona: Act as a Laboratory Automation Engineer with expertise 
in Python scripting, file I/O, batch processing, data validation, and 
scientific data formatting standards.

[T] Task: Create a Python script that automates {AUTOMATION_TASK}.

Processing requirements:
- Input source: {INPUT_SOURCE}
- Batch size: {BATCH_SIZE}
- Output destination: {OUTPUT_DESTINATION}

[O] Output requirements:
1. Standalone Python script (.py file) with CLI argument parsing (argparse)
2. Main function with clear entry point and execution flow
3. Logging to both console and file ({SCRIPT_NAME}.log) with timestamps
4. Progress indicators for batch operations (using tqdm)
5. Comprehensive error handling with user-friendly messages
6. Summary report generated at completion (successes, failures, warnings)
7. Configuration section at top of script for easy customization
8. Requirements.txt file listing all dependencies

[M] Method:
- Use pathlib.Path for all file operations (cross-platform compatibility)
- Implement try-except blocks for all I/O and parsing operations
- Use context managers (with statements) for file handling
- Validate all inputs before processing (file existence, format, permissions)
- Create backup copies before modifying existing files
- Use logging module with levels: DEBUG, INFO, WARNING, ERROR
- Implement early returns and guard clauses for invalid states

[A] Assumptions/Constraints:
- Script must handle partial failures (e.g., 8/10 files processed successfully)
- Invalid input files should be logged but not crash the entire batch
- Output directory must be created if it doesn't exist
- If {SAFETY_CHECK} fails, halt execution and provide clear error message
- All file writes must be atomic (write to temp, then rename)
- Script must be idempotent (safe to run multiple times on same data)
- Include --dry-run flag to preview changes without executing
- Do NOT process files matching patterns: {EXCLUSION_PATTERNS}

[T] Tone: Production-grade automation code suitable for deployment in 
laboratory environment. Prioritize reliability and clear error reporting.
```

**Variables to customise:**
- `{AUTOMATION_TASK}`: e.g., "converts informal lab notebook entries (Word/PDF) to standardised synthesis protocol templates (JSON)"
- `{INPUT_SOURCE}`: e.g., "Directory containing .docx files"
- `{BATCH_SIZE}`: e.g., "Process up to 50 files per run"
- `{OUTPUT_DESTINATION}`: e.g., "output/ directory with dated subdirectories"
- `{SCRIPT_NAME}`: e.g., "protocol_formatter"
- `{SAFETY_CHECK}`: e.g., "file size exceeds 10MB"
- `{EXCLUSION_PATTERNS}`: e.g., "*.tmp, *_backup.*, confidential_*"

**Example usage:**
```
Task: Create a Python script that automates the extraction of synthesis 
parameters from SEM image metadata (EXIF tags) and organizes them into a 
searchable CSV database with columns: [Date, Sample_ID, Voltage_kV, 
Magnification, Operator, Filename].

Input source: Directory tree containing .tif SEM images
Output: Single consolidated CSV + error log for images with missing metadata
```

---

### Template 3: Computational Modeling & Property Prediction

```
[A] Audience: Computational materials scientists and researchers who will 
integrate this code into larger simulation pipelines or Jupyter notebooks.

[U] User Persona: Act as a Computational Materials Scientist with expertise 
in Python scientific computing (numpy, scipy, scikit-learn), numerical methods, 
optimization algorithms, and materials property modeling.

[T] Task: Develop a Python function that {COMPUTATIONAL_TASK}.

Scientific requirements:
- Physical constraints: {PHYSICAL_CONSTRAINTS}
- Convergence criteria: {CONVERGENCE_CRITERIA}
- Expected computational complexity: {COMPLEXITY}

[O] Output requirements:
1. Modular function design with clear separation of concerns:
   - Core algorithm function (pure computation)
   - Validation function (input checking)
   - Wrapper function (user-facing interface)
2. Type hints for all function signatures (numpy.ndarray, float, etc.)
3. Comprehensive docstring with mathematical formulation:
   - LaTeX equations in docstring (for Jupyter rendering)
   - Physical meaning of all parameters
   - Units for all dimensional quantities
   - References to source papers/textbooks
4. Vectorized operations using numpy (avoid Python loops)
5. Performance optimization notes as comments
6. Test cases with known analytical solutions for validation
7. Visualization helper function for debugging/interpretation

[M] Method:
- Use numpy for all array operations; scipy for optimization/integration
- Implement numerical stability checks (condition numbers, convergence monitoring)
- Use appropriate precision (float64 for stability-critical calculations)
- Leverage scipy.optimize for fitting/minimization tasks
- Cache expensive computations where appropriate (functools.lru_cache)
- Profile performance-critical sections and document bottlenecks
- Follow functional programming patterns (pure functions, no side effects)

[A] Assumptions/Constraints:
- Input arrays must satisfy: {INPUT_VALIDATION_RULES}
- If convergence fails after {MAX_ITERATIONS} iterations, raise ConvergenceError
- Physical constraints must be enforced: {PHYSICS_CHECKS}
- Numerical precision tolerance: {TOLERANCE}
- Do NOT use machine learning unless {ML_JUSTIFICATION}
- Results must be deterministic (set random seeds if stochastic methods used)
- Include warning if extrapolating beyond training/calibration data range
- Document all assumptions in docstring (e.g., isothermal conditions, linear elasticity)

[T] Tone: Research-grade scientific code suitable for publication supplementary 
materials. Balance performance optimization with code readability.
```

**Variables to customise:**
- `{COMPUTATIONAL_TASK}`: e.g., "predicts glass transition temperature (Tg) of polymer blends using Fox equation with composition-dependent parameters"
- `{PHYSICAL_CONSTRAINTS}`: e.g., "Tg must be positive Kelvin, mass fractions sum to 1.0"
- `{CONVERGENCE_CRITERIA}`: e.g., "Relative error < 1e-6 or absolute change < 0.01 K"
- `{COMPLEXITY}`: e.g., "O(n) for n components"
- `{INPUT_VALIDATION_RULES}`: e.g., "All concentrations 0 <= c <= 1, sum(c) = 1.0 ± 1e-10"
- `{MAX_ITERATIONS}`: e.g., "1000"
- `{PHYSICS_CHECKS}`: e.g., "Check Tg > 0 K, modulus > 0 Pa"
- `{TOLERANCE}`: e.g., "1e-8 for iterative solvers"
- `{ML_JUSTIFICATION}`: e.g., "training dataset >1000 samples and validated R² > 0.95"

**Example usage:**
```
Task: Develop a Python function that calculates the effective thermal 
conductivity of a two-phase nanocomposite using the Maxwell-Garnett model, 
accounting for interfacial thermal resistance (Kapitza resistance).

Input: Volume fraction (0-0.3), matrix conductivity (W/m·K), filler 
conductivity (W/m·K), Kapitza resistance (m²·K/W)

Output: Effective thermal conductivity + sensitivity analysis showing 
contribution of each parameter
```

---
## Customisation Guidelines

**When adapting golden prompts:**

- Keep the structure (it's proven to work)
- Adjust domain-specific terms for your work
- Add constraints relevant to your data/safety requirements
- Modify output format if needed for your tools
- Update tone if audience differs

---

**Next:** [Red List Details](red-list.md) → [External Resources](external.md)
