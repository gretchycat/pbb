# Portable Behavioral Blueprint (PBB)

**Status:** Draft • **Spec Version:** 1.1-draft • **Date:** 2025-10-06

This repository hosts the reference implementation of the **Portable Behavioral Blueprint (PBB)** — an extensible XML schema family for persistent, privacy-respecting personality profiles that can be shared across AI systems.

## Goals
- Portable, modular profiles that evolve over time (“living documents”)
- Selective disclosure per use case (e.g., music-only export vs. full profile)
- Strong provenance and validation semantics
- Infinite extensibility via namespaced extensions

## Namespaces
- Core: `http://pbb.ai/core/v1`
- Interests: `http://pbb.ai/extensions/interests/v1`
- Music: `http://pbb.ai/extensions/music/v1`
- Personality: `http://pbb.ai/extensions/personality/v1`
- Health: `http://pbb.ai/extensions/health/v1`
- Social: `http://pbb.ai/extensions/social/v1`
- Provenance: `http://pbb.ai/extensions/provenance/v1`

## Licensing
- **Schemas & Code:** Apache-2.0 (see `LICENSE`) — permissive with patent grant; ideal for ecosystem extensions.  
- **Documentation & RFC Drafts:** CC BY 4.0 (see `LICENSE-DOCS`) — free to share and adapt with attribution.

## Structure
```
core/
  v1/                      # kernel schema
extensions/
  interests/v1/            # <interests> container + domain modules
  personality/v1/          # cognition & philosophy
  health/v1/               # wellness & conditions
  social/v1/               # relationships & affiliations
  provenance/v1/           # origin, edit history, validation
examples/                  # validating XML instances
xslt/                      # XML → JSON converters
schema-manifest.xml         # machine-readable module index
PBB-RFC-Draft.txt           # internet-draft-style write-up
Makefile                   # validation helpers
```

Each `/v1/` directory defines a stable namespace. Future revisions (`/v2/`, `/v3/`, …) may coexist without breaking existing documents.

## Validation
Validate an example instance:

```bash
xmllint --noout --schema core/v1/pbb-core.xsd examples/schema-demo.xml
```

or simply:

```bash
make validate
```

## JSON Export
Generate JSON from any valid PBB XML file:

```bash
xsltproc xslt/pbb-to-json.xslt examples/schema-demo.xml
```

Parameters:
- `pretty=true|false` — formatted or compact JSON  
- `preserve_ns=true|false` — include namespace prefixes  
- `mode=standard|json-ld` — output mode selector

## Extending the Schema
To add a new domain:
1. Create a folder under `extensions/<your-domain>/v1/`
2. Define your schema and import `../../core/v1/pbb-core.xsd`
3. Add your module to `schema-manifest.xml`
4. Include a validating example under `/examples`
5. Submit a pull request following `CONTRIBUTING.md`

---

**Author:** Gretchen • Rochester, MN • 2025

