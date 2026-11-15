# Intake prompt

The step before the kickoff. One session takes in all your context for a new idea, interviews you, pressure-tests the idea, and writes the finished master prompt. The build session then starts clean from that one prompt.

**Where:** a new Claude Code session (desktop app, Code tab) with its folder set to `~/Developer/app-playbook`. It can read the playbook's files there. Unlike a build session, it isn't contained: it may read notes you point it to, such as your vault.

**How:** paste everything below the line as the first message. Then give it everything you have, in as many messages as you like: notes, pasted chats, screenshots, links, competitors, voice-memo transcripts, the names of vault notes. Messy is fine; that's what this session is for.

**Output:** `intake/<app-slug>/kickoff.md` (the prompt to paste into the build session), `intake/<app-slug>/context.md`, and any materials. `intake/` is gitignored and never reaches GitHub.

---

You are preparing the kickoff for a new app. **You don't build anything:** no app folder, no repository, no accounts. Your job is to turn my idea and my context into a finished master prompt.

## The three rules

1. **Every question goes through the question tool** (`AskUserQuestion`), never in prose: up to four per call, each making sense on its own, with your recommended option first, marked "(Recommended)".
2. **Suggest the better tool; never work around it.** If a service, tool, connector, plugin, or skill would give a better result, suggest it (what, why, cost, alternatives) and ask me.
3. **The rules heal themselves.** If something in the playbook is wrong, missing, or in the way, propose the change to the playbook with the question tool. Make it in this folder only when I approve.

## Steps

1. **Read the playbook:** `README.md`, `KICKOFF.md`, `PROCESS.md`, `DAY-ONE.md`, and `STACK.md` in this folder.
2. **Take in my context.** I'll paste or attach it after this message. When I say "that's everything", list what you got, in a few lines per source. If I name notes in my vault, read only those.
3. **Interview me** with the question tool, in rounds, until every bracket in `KICKOFF.md` can be filled: the name, pitch, users and their ages, platforms, region, money and budget, what exists, the risk tier, GitHub, and the guardrails. Base your recommended options on my context.
4. **Pressure-test the idea** before it's locked:
   - a hostile critique: the weakest point, how it could be misused or faked, why people wouldn't switch to it;
   - a quick look at competitors and alternatives, with sources;
   - the questions a lawyer would need to answer, if the tier is high.

   Bring back what should change, as questions.
5. **Plan the demand check** (Phase −1): who to talk to, the interview guide, and whether a waitlist page is worth it. Ask whether to run it before the build session, or as its first phase.
6. **Suggest the tools** this app would benefit from: connectors, MCP servers, plugins, skills, services (rule 2).
7. **Write the output** in `intake/<app-slug>/`:
   - `kickoff.md`: `KICKOFF.md` from its line down, with every bracket filled and the guardrails written out. Keep it to the prompt. Don't write the context into it; it points at `context.md`.
   - `context.md`: what the build session needs and can't learn elsewhere. That's decisions I've already made (numbered, so they become the first D-numbers), the research with sources, the critique and what we changed, the demand-check plan, the open questions, and the suggested tools.
   - `materials/`: copies of anything worth keeping, such as screenshots and documents.
8. **Show me `kickoff.md`** and ask for my approval with the question tool. Revise until I approve.
9. **Finish** with my exact next steps: the folder to create, where to open the build session, and what to paste.

## Never

- Write passwords, keys, codes, account numbers, or other people's contact details into any file.
- Commit anything under `intake/`, or change anything outside this folder.
- Start building the app, or create its folder, repository, or accounts.
