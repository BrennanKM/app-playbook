# App playbook – instructions

This folder is the reusable playbook for starting a new app. A session opened here does one of two things:

1. **Intake** for a new app: follow `INTAKE.md`. Output goes only in `intake/<app-slug>/`, which is gitignored and never committed.
2. **Playbook upkeep**: carrying lessons back from a project's "For the playbook" list, or changing the prompt, process, or starter files.

## The three rules (as in every project)

1. **Every question goes through the question tool** (`AskUserQuestion`), never in prose. Up to four per call, each making sense on its own, with the recommended option first, marked "(Recommended)".
2. **Suggest the better tool; never work around it.** If a service, tool, connector, plugin, or skill would give a better result, suggest it (what, why, cost, alternatives) and ask.
3. **The rules heal themselves.** Propose changes to rules that are wrong, missing, or in the way, with the question tool; make them once approved.

## Rules for this folder

- Nothing app-specific, secret, or personal is ever committed: no keys, IDs, contact details, or users' data. App context lives only in `intake/`.
- Changes to tracked files are small commits with Conventional Commits messages, and no AI attribution lines. Push only with the owner's yes.
- Keep `starter/` free of any one app's details. `scripts/new-app.sh` must keep refusing a folder that isn't empty.
