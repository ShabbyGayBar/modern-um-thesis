# AGENTS.md

## Project

Typst thesis template for University of Macau. Published as the `modern-um-thesis` package on Typst Universe.

## Commands

```bash
typst compile template/main.typ       # build the demo document
typst compile test/test.typ            # build the test document
typst compile docs/manual.typ          # build the API docs (requires @preview/tidy)
```

No linter, formatter, typechecker, or automated test suite exists. Verification is visual — compile and inspect the PDF.

## Architecture

- **Package entrypoint**: `src/lib.typ` (declared in `typst.toml` as `entrypoint`)
- **Template entrypoint**: `template/main.typ` (user-facing demo; also serves as usage guide)
- `src/lib.typ` exports `documentclass()`, the single public API. It returns a dict of bound layout/page functions.
- `src/layouts/` — document-wide show rules (`doc.typ`), section environments (`frontmatter.typ`, `mainmatter.typ`, `appendix.typ`)
- `src/pages/` — standalone page templates (`cover-phd.typ`, `cover-ms.typ`, `declare-phd.typ`, `declare-ms.typ`, `abstract.typ`, `outline.typ`)
- `src/utils/` — helpers. Public: `symbols.typ` (`ppi`, `ee`, `ii`), `line.typ` (`toprule`, `midrule`, `bottomrule`). Private: `convert.typ`, `numbering.typ`, `page.typ`.

## Key Conventions

- `documentclass()` params: `doctype` (`"doctor"` | `"master"` | `"bachelor"`), `lang` (`"en"` | `"zh"` | `"pt"`), `double-sided`, `print`, `info` dict.
- Master's theses must use `lang: "en"` per UM rules.
- `info` dict keys use suffix convention: `title-en`, `title-zh`, `title-pt`. Required: all `-en` fields plus fields matching the chosen `lang`.
- Local dev uses relative import `../src/lib.typ`. Production (Typst Universe) uses `@preview/modern-um-thesis:<version>`.
- The `test/` directory is gitignored (only used locally for visual checks).
- API docs are generated with `@preview/tidy` via `docs/manual.typ`. Doc comments in `src/` use Tidy's format.

## Gotchas

- UM logo files in `src/assets/` are University of Macau property, not MIT-licensed.
- `docs/guidelines/` contains UM's official PhD thesis formatting PDF — the authoritative reference for layout rules.
- Typst package deps are pinned in source (`#import "@preview/..."`), not in a lockfile. Check existing import versions before adding or updating deps.
- Changing layout logic in `src/layouts/doc.typ` affects all doctypes and langs — always compile both `template/main.typ` (master/en) and a doctor config before merging.
