# AI training (MkDocs + GitLab Pages)

This repo contains the AmaDema general AI training content and a static site powered by MkDocs Material.

## Local preview

```bash
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\\Scripts\\Activate.ps1
pip install -r requirements.txt
mkdocs serve
```

## Build

```bash
mkdocs build --strict
```

## GitLab Pages

GitLab Pages is configured in `.gitlab-ci.yml` and publishes the MkDocs build output from `public/`.

