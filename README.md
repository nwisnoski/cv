# Nathan Wisnoski CV

The CV uses standard `article` LaTeX, a small semantic style file, and BibLaTeX/Biber for publications.

## Build

From this directory, run:

```sh
latexmk Wisnoski_CV.tex
```

The local `.latexmkrc` selects LuaLaTeX. `latexmk` detects the bibliography and runs Biber automatically. To remove generated build files, run:

```sh
latexmk -C Wisnoski_CV.tex
```

LuaLaTeX is intentional: it preserves the familiar Times New Roman appearance while producing substantially better searchable text and accessibility metadata than the old XeLaTeX build.

## Files

- `Wisnoski_CV.tex` contains CV content and section ordering.
- `cv-style.sty` contains typography, page geometry, headers, and reusable entry commands.
- `publications.bib` contains publication metadata.
- `presentations.bib` contains contributed-presentation metadata.
- `Wisnoski_CV.pdf` is the compiled CV.
- `resume.cls` is retained only as an archival copy of the previous template; the CV no longer uses it.

## Add or update a publication

Edit `publications.bib`. A typical published article looks like:

```bibtex
@article{wisnoski_short_key_2026,
  author       = {Wisnoski, Nathan I. and Collaborator, Ada B.},
  title        = {Article Title},
  journaltitle = {Journal Name},
  year         = {2026},
  volume       = {12},
  number       = {3},
  pages        = {100--112},
  doi          = {10.xxxx/example},
  keywords     = {published}
}
```

Use one of these keywords to place the record in the appropriate CV subsection:

- `review` -- preprints and manuscripts under review
- `published` -- published and in-press work
- `bookreview` -- book reviews

The bibliography is sorted newest first. Published papers are reverse numbered automatically, so the oldest paper remains number 1 as new work is added. All bibliography lists use the same `1.` label style. The style abbreviates given names, uses `Last, F.M.` author order, highlights Nathan Wisnoski's name, formats titles in sentence case, omits an “In:” label before journal names, and turns DOI values into links. Protect proper nouns or acronyms from sentence-case conversion with braces, for example `{Oregon}` or `{DNA}`.

## Add a contributed presentation

Edit `presentations.bib`. Use one record per delivered presentation:

```bibtex
@misc{talk_patalinghug_microbial_2025,
  author       = {Patalinghug, Jenny Marie R. and Wisnoski, Nathan I.},
  author+an    = {1=presenter},
  title        = {Microbial ecology of mangroves: A metacommunity perspective},
  date         = {2025},
  sortkey      = {01},
  howpublished = {American Society for Microbiology South Central Branch Annual Meeting},
  location     = {Starkville, MS},
  keywords     = {contributed}
}
```

Write every author as `Family, Given Middle` and separate authors with `and`; the CV converts all names to `Last, F. M.` automatically. `author+an` identifies the presenter by position in the author list. For example, `{1=presenter}` marks the first author, `{2=presenter}` marks the second, and `{1=presenter;3=presenter}` marks multiple presenters. If the presentation was a poster, add:

```bibtex
type = {poster},
```

Presentations sort newest first. `sortkey` controls the order of records within the same year; use `01`, `02`, and so on. Protect proper nouns and acronyms in titles with braces just as you would in `publications.bib`.
Prefix presentation citation keys with `talk_` to keep them distinct from publication keys.

## Update ordinary CV entries

The primary reusable commands are:

```tex
\cventry{Position}{Dates}{Institution}{Location}
\degreeentry{Institution}{Dates}{Degree}{Minor or additional detail}
\grantentry{Dates or status}{Amount}{Description and role}
\datedentry{Date}{Description}
\courseentry{Role}{Course}{Institution}{Terms}
\adviseeentry{Name}{Role or degree}{Individual dates, if known}
\adviseedatedentry{Name}{Dates shown after the name}
\cvserviceheading{Service category}
\servicelabelentry{Short label}{Service detail}
\serviceinstitutionentry{Institution}{Names or activity}
\serviceentry{Undated service item}
\servicedatedentry{Dates}{Service item}
```

Service subsection headings are italic. Within a subsection, use
`\servicelabelentry` for upright labeled rows, `\serviceinstitutionentry` for
institution-specific rows, and `\servicedatedentry` for dated roles. Use
`\serviceentry` for a continuation line beneath the preceding label. All
entries share the same upright label/date gutter.

Teaching is maintained as a four-column `tabularx` block in `Wisnoski_CV.tex`. Keep its rows in descending order by the most recent teaching date.

Change `\CVUpdated` near the top of `Wisnoski_CV.tex` when releasing a new version.
