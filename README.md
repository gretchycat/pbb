# Portable Behavioral Blueprint (PBB)

**Status:** Draft • **Spec Version:** 1.0 • **Date:** 2025-10-06

This repository hosts the reference implementation of the **Portable Behavioral Blueprint (PBB)** — an extensible XML schema family for persistent, privacy‑respecting personality profiles that can be shared across AI systems.

## Goals
- Portable, modular profiles that evolve over time (“living documents”)
- Selective disclosure per use-case (e.g., music-only export vs. full profile)
- Strong provenance and validation semantics
- Infinite extensibility via namespaced extensions

## Namespaces
- Core: `http://pbb.ai/core/v1`
- Interests: `http://pbb.ai/extensions/interests`
- Music: `http://pbb.ai/extensions/music`
- Personality: `http://pbb.ai/extensions/personality`
- Health: `http://pbb.ai/extensions/health`
- Social: `http://pbb.ai/extensions/social`
- Provenance: `http://pbb.ai/extensions/provenance`

## Licensing
- **Schemas & Code:** Apache-2.0 (see `LICENSE`) — permissive with patent grant; ideal for ecosystem extensions.
- **Documentation & RFC Drafts:** CC BY 4.0 (see `LICENSE-DOCS`) — free to share and adapt with attribution.

## Structure
```
core/                       # kernel schema
extensions/
  interests/                # <interests> container + domain modules
  personality/              # cognition & philosophy
  health/                   # wellness & conditions
  social/                   # relationships & affiliations
  provenance/               # origin, edit history, validation
examples/                   # validating XML instances
.github/workflows/          # CI validation
PBB-RFC-Draft.txt           # internet-draft style writeup
schema-manifest.xml         # machine-readable module index
```

## Quick Start
Validate the example against the schemas:
```bash
sudo apt-get update && sudo apt-get install -y libxml2-utils
xmllint --noout --schema core/pbb-core.xsd examples/schema-demo.xml
```

To extend, add a new schema under `extensions/<your-domain>/` with its own namespace, and import `core/pbb-core.xsd`. Use `xs:any` with `processContents="lax"` for forward‑compatible growth.

---

**Author:** Gretchen • Rochester, MN • 2025
