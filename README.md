# cyberlabs

Cybersecurity learning pipeline: repositories, study material, notes, and skills.

## Layout

```
cyberlabs/
├── bin/       Helper scripts (clone-repo)
├── repos/     GitHub repos cloned here (one directory per repo)
├── docs/      Documents, PDFs, writeups, course material
├── notes/     Your own notes (one file per topic, Markdown)
├── skills/    Skill sources; installed globally with ./skills/install-skills.sh
└── scratch/   Throwaway experiments, VMs, payload tests
```

## Conventions

- **repos/** — clone with `./bin/clone-repo <owner>/<repo> "purpose"`, or
  `git clone <url> repos/<repo>`. Never nest a repo inside another repo.
  `clone-repo` also appends the row to `repos/INDEX.md` for you.
- **docs/** — keep the original filename; prefix with a topic folder when it helps,
  e.g. `docs/web-exploitation/portswigger-labs.pdf`.
- **notes/** — `notes/<topic>.md`, linked from `notes/README.md` as the index.
- **skills/** — one directory per skill containing a `SKILL.md`. Install with
  `./skills/install-skills.sh` (copies into `~/.config/opencode/skills/`), then
  use `/reload` or just ask for `@skill-id`.

## Adding a repo

```bash
cd ~/cyberlabs
./bin/clone-repo swisskyrepo/PayloadsAllTheThings "web payload cheatsheet"
```

That clones into `repos/PayloadsAllTheThings` and adds an indexed row.

## Tracking clones

`repos/INDEX.md` lists what has been cloned, from where, and why. Append a row
when a repo is added so the pipeline stays searchable.
