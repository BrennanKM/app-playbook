# App playbook

The process, prompt, and starter files that took EarnVouch from an empty folder to the App Store in four weeks (2026-10-13 to 2026-11-11), made reusable for the next app.

## Start a new app

**1. Intake session (any length, messy is fine).** In the Claude desktop app, open a new Code session with the folder set to `~/Developer/app-playbook`. Paste the prompt from [INTAKE.md](INTAKE.md), then give it all your context: notes, chats, screenshots, links, and vault notes by name. It interviews you with the question tool, pressure-tests the idea, and writes the finished master prompt to `intake/<app-slug>/kickoff.md`, with the context beside it. Nothing there is committed.

**2. Make the app's empty folder:**
```bash
mkdir ~/Developer/<app-slug>
```

**3. Build session (clean start).** Open a new Code session with the folder set to `~/Developer/<app-slug>`. Paste the whole of `intake/<app-slug>/kickoff.md` as the first message. Copy it with `LANG=en_US.UTF-8 pbcopy < ~/Developer/app-playbook/intake/<app-slug>/kickoff.md`: without the UTF-8 setting, characters like "…" and "−" turn into "?". It copies the starter and your context in, saves the prompt to `docs/kickoff.md`, and starts the loop: it opens a PR, you merge it and say "merged", then you answer its questions.

**4. The same day,** start [DAY-ONE.md](DAY-ONE.md)'s paperwork: the company, D-U-N-S, and the store accounts.

To skip intake, fill in [KICKOFF.md](KICKOFF.md)'s brackets by hand and go straight to step 2.

## What's here

| File | What it is |
|---|---|
| [INTAKE.md](INTAKE.md) | The prompt for the intake session, which turns your idea and context into the finished kickoff prompt |
| [KICKOFF.md](KICKOFF.md) | The master prompt for the first message of a new project (rebuilt; the original was lost) |
| [PROCESS.md](PROCESS.md) | How the build ran, phase by phase; the rhythm, the record-keeping, the agents, and lessons from EarnVouch |
| [DAY-ONE.md](DAY-ONE.md) | Company and account paperwork to start on day one |
| [STACK.md](STACK.md) | The default stack and code rules, from EarnVouch's ADRs |
| [starter/](starter/) | Files copied into each new repository: `CLAUDE.md`, permissions, agents, PR and issue templates, ADR template, mocks register, doc skeletons |
| [scripts/new-app.sh](scripts/new-app.sh) | Copies `starter/` into a new folder and fills in the simple placeholders (the build session runs it) |
| `intake/` | Each intake's output: never committed |

## Keeping it current

Each project keeps a "For the playbook" list in its `docs/history.md` (its `CLAUDE.md`, section 0, rule 3). When a project teaches something new, carry those lines here: a lesson in `PROCESS.md`, a rule in `starter/CLAUDE.md`, or a default in `STACK.md`. Commit each change with the date and the project it came from. Nothing in this repository is specific to one app, and nothing secret goes in: no keys, IDs, contact details, or users' data.
