# App playbook

The process, prompt, and starter files that took EarnVouch from an empty folder to the App Store in four weeks (2026-10-13 to 2026-11-11), made reusable for the next app.

## Start a new app

1. **Make the folder and copy the starter:**
   ```bash
   sh ~/Developer/app-playbook/scripts/new-app.sh ~/Developer/<app-slug> "<App Name>"
   ```
2. **Fill in the brackets in [KICKOFF.md](KICKOFF.md)**: the pitch, the users, the platforms, the guardrails, and the risk tier.
3. **Open a new Claude Code session in the new folder** and paste the filled-in prompt as the first message.
4. **Start [DAY-ONE.md](DAY-ONE.md)'s paperwork the same day**, in parallel: the company, D-U-N-S, and the store accounts.
5. **Then the loop:** review the PR, merge, say "merged", and answer the batched questions.

## What's here

| File | What it is |
|---|---|
| [KICKOFF.md](KICKOFF.md) | The master prompt for the first message of a new project (rebuilt; the original was lost) |
| [PROCESS.md](PROCESS.md) | How the build ran, phase by phase; the rhythm, the record-keeping, the agents, and lessons from EarnVouch |
| [DAY-ONE.md](DAY-ONE.md) | Company and account paperwork to start on day one |
| [STACK.md](STACK.md) | The default stack and code rules, from EarnVouch's ADRs |
| [starter/](starter/) | Files copied into each new repository: `CLAUDE.md`, permissions, agents, PR and issue templates, ADR template, mocks register, doc skeletons |
| [scripts/new-app.sh](scripts/new-app.sh) | Copies `starter/` into a new folder and fills in the simple placeholders |

## Keeping it current

Each project keeps a "For the playbook" list in its `docs/history.md` (its `CLAUDE.md`, section 0, rule 3). When a project teaches something new, carry those lines here: a lesson in `PROCESS.md`, a rule in `starter/CLAUDE.md`, or a default in `STACK.md`. Commit each change with the date and the project it came from. Nothing in this repository is specific to one app, and nothing secret goes in: no keys, IDs, contact details, or users' data.
