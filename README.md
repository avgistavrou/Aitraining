# AmaDema AI Training Programme

> **Material Science Prompt Engineering: A Comprehensive Workshop**

This repository contains the complete training materials for AmaDema's AI training programme, designed to upskill Material Scientists and R&D staff in prompt engineering, responsible AI use, and sustainable AI practices.

## 🎯 Overview

A 4-day intensive workshop teaching:
- **AUTOMAT & CO-STAR frameworks** for scientific prompt engineering
- **IP protection** and data security protocols
- **Green AI** practices for sustainable AI usage
- **Hands-on practice** with local AI models

## 📚 Course Structure

### Day 1-2: Precision Engineering & Operational Safety
- AUTOMAT Framework
- CO-STAR Framework
- Responsible AI & Risk Management
- The Red List Protocol

### Day 3-4: Technical Architecture & Sustainability
- NLMs vs LLMs
- Green AI Practices
- Optimisation Strategies
- Real Materials Science Applications

## 🚀 Quick Start

### View the Course Website

Visit: **https://avgistavrou.github.io/amadema-aitraining/**

### Run Locally

```bash
# Install dependencies
pip install -r requirements.txt

# Serve locally
mkdocs serve

# Build static site
mkdocs build
```

The site will be available at `http://127.0.0.1:8000`

## 🔬 Sandbox Environment

The course includes a local AI sandbox using:
- **Ollama** with Llama 3.3 8B
- **Open WebUI** for chat interface
- **Docker Compose** for easy deployment

See [Sandbox Setup Guide](docs/resources/sandbox-setup.md) for instructions.

## 📋 Requirements

- Python 3.8+
- Docker & Docker Compose (for sandbox)
- 16GB+ RAM (for local model)

## 📖 Course Materials

- **Cheat Sheets**: Quick reference guides for frameworks
- **Golden Prompts**: Pre-tested prompts for common tasks
- **Exercises**: Interactive challenges with real data
- **Resources**: Links to external documentation

## 🎓 Learning Objectives

By the end of this course, participants will:
- Master AUTOMAT and CO-STAR frameworks
- Protect IP whilst using AI tools
- Implement Green AI practices
- Engineer prompts for materials science workflows

## 🔒 Data Privacy

All exercises can be completed using the **local, air-gapped sandbox**. No external data sharing required.

## 👤 Course Designer

**Avgi Stavrou**  
Materials Science AI Specialist

## 📄 Licence

Copyright © 2025 AmaDema - All Rights Reserved

Course materials are proprietary and intended for AmaDema employees only.

---

## 🛠️ Development

### Project Structure

```
├── docs/                 # Markdown documentation
│   ├── index.md
│   ├── fundamentals/
│   ├── day1-2/
│   ├── day3-4/
│   ├── conversational/
│   ├── ethics/
│   └── resources/
├── mkdocs.yml           # MkDocs configuration
├── requirements.txt     # Python dependencies
└── .github/workflows/   # CI/CD automation
```

### Contributing

This is an internal training programme. For suggestions or corrections, contact Avgi Stavrou.

### Deployment

The site automatically deploys to GitHub Pages via GitHub Actions when changes are pushed to the `main` branch.

---

**Ready to transform your AI usage?** Visit the [course website](https://avgistavrou.github.io/amadema-aitraining/) to begin.
