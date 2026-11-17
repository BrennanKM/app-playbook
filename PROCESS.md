# The process

How EarnVouch went from an empty folder (2026-10-13) to the App Store (2026-11-11) in four weeks, written down so the next app can do it again, with the improvements we'd make next time.

## The shape of it

| Phase | Goal | Ends when | EarnVouch took |
|---|---|---|---|
| −1. Demand check *(new)* | Know people want it before building | 10+ target users talked to; the PRD changed by what they said | skipped (learned after) |
| 0. Design | Decide what to build and why, on paper | The owner approves all Phase 0 docs together | 2 days |
| 1. Scaffolding | An empty but working system: each part builds, tests, and deploys to staging through CI | CI green, staging up | ~2 days |
| 2. MVP build | Every Must story working in staging, safety built before the features that depend on it | Every Must story passes, with its tests | ~2.5 weeks |
| 3. Beta | Real use by a small group (adults first, if minors are involved) | The launch-readiness checklist is done | skipped for iOS (a deliberate, recorded trade-off) |
| 4. Store submission | Approved by the stores | Approved | ~5 days, including an early review build |
| 5. After launch | Run it safely, learn, grow | Ongoing, by a 3-to-6-month plan | — |

Phases have **exit criteria, not dates.** Dates come once scaffolding shows the real pace.

## The daily rhythm

1. The assistant works on one branch per deliverable, opens a PR, and ends its message with **what the owner needs to do, in order** ("review and merge #12", "buy the domain at the last screen", "type the code in Terminal tab c3").
2. The owner reviews and merges, then says "merged".
3. The assistant checks the merge, deletes the branch, updates the docs, and starts the next step.
4. **Every question goes through the question tool**, in every phase and session, never in prose. They come in batches with a recommended option, and the answers become numbered decisions.
5. Anything remote, paid, legal, or about safety waits for an explicit yes. Everything else the assistant decides and records, and the owner can overrule it.
6. **When a better tool, service, or connector would improve the result, the assistant suggests it** (what, why, cost, alternatives) instead of working around its absence. A "no" is recorded, along with the quality lost.
7. **Rules heal themselves.** A rule that proves wrong, missing, or in the way gets a proposed change through the question tool, then a PR to `CLAUDE.md`, and a line under "For the playbook" in `docs/history.md`.

These three rules (questions through the tool, suggest rather than work around, self-healing) are section 0 of every project's `CLAUDE.md`. They keep the prompt growing with the project instead of going rigid.

This loop is the engine. Most owner messages during EarnVouch's build were one word: "merged".

## The record-keeping that made it work

- **`CLAUDE.md`**: the rules, commands, structure, and "where things are". Every session reads it first. Keep it short (under about 250 lines). Status goes elsewhere.
- **PRD decisions (D1, D2, ...)**: every product decision the owner made, numbered, in one table, and settled once recorded. EarnVouch reached 242. Numbering let any doc, PR, or code comment cite "D61" instead of re-arguing it.
- **ADRs**: one per significant technical choice, with the options and the costs. They stopped "why did we pick X?" from coming up again.
- **Requirement IDs** in the threat model (S1, S2, ...), the compliance doc (M1, M2, ...), and the roadmap (RM1, ...), cited in code and tests.
- **`docs/mocks.md`**: every stand-in, approved, labeled `// MOCK:` in code, with what replaces it. Nothing fake reached production unnoticed.
- **`docs/history.md`** and a plan in `docs/plan/` for the log and the current stage. *(new: from day one, not moved in at launch)*
- **`docs/kickoff.md`**: the prompt that started it. *(new)*

## Sessions and agents

- **One main engineering session** that builds and keeps the docs current. For a long build, plan around context compaction: the docs, not the conversation, hold the state.
- **A second session for growth** (marketing, content, outreach) once there's something to show. It reads the same strategy and brand docs, and never touches code.
- **Specialist agents** in `.claude/agents/`, each of which **drafts or checks but never acts**:
  - `release`: store answers, review notes, the release checklist.
  - `qa`: test plans, run reports, bug triage.
  - `support`: help pages, saved replies.
  - `operations`: services, costs, dates, the budget.
  - `legal`: research from primary sources, questions for the lawyer.
  - `strategist`: keeps the strategy and checks drift.
  - `marketing`: drafts posts, never posts.
  - `critic`: reviews content blind, as a stranger would.
  - `funding`: grants and sponsors, drafts only.
  - `trust-safety` (high risk): the moderator handbook and drills.

  The "never acts" line in each agent is what made them safe to use freely.
- **Named exceptions to containment**, each dated and scoped in `CLAUDE.md`, e.g. "the assistant may use Chrome only for the app's own service dashboards". Add them as the need appears, never broadly.

## Phase 0 in practice

- The PRD came first and took the longest: the owner answered questions in rounds and each answer became a D-number.
- An outside critique (pasted in from a separate chat) found the weakest point: what "verified" really proved. That led to the trust model, and to dropping the word "verified" for "Client-confirmed". **Ask for a hostile critique of the PRD before approving it.** *(worth making standard)*
- Compliance research came before the lawyer. The assistant drafted numbered questions, the owner sent them, and the answers were pasted back and recorded with their round number. EarnVouch went through six rounds. Batching questions into rounds kept the lawyer's time, and fees, down.
- Phase 0 was approved as a whole, then scaffolding began.

## Building (Phases 1 and 2)

- **Build before paying.** Each part is built locally with labeled stand-ins (approved mocks) until the step that truly needs the paid service. Staging starts on free tiers.
- **Safety before features.** Accounts, consent, and moderation came before the features that depend on them.
- **Pure rules in a shared package with tests** (`packages/domain`): ages, limits, screening. They're the easiest code to test and the most expensive to get wrong.
- **CI from the first code PR:** lint, types, tests, dependency audit, secret scanning, path filters. Third-party Actions are pinned to commit SHAs.
- **End-to-end checks against the stories** before calling the MVP done. Then a self-review of every threat in the threat model.

## Getting to the store

- **Do an early review build** (EarnVouch's D154). A build goes through full App Store review with its release held, so Apple's objections come weeks early.
- **The review account:** give Apple a made-up test account for the review, and remove it afterwards. **Clean it up only once App Store Connect shows "Pending Developer Release",** never at "approved" in an email.
- **Manual release, phased release off** for the first versions, so the owner chooses the moment.
- **Store answers are truthful and conservative**, and checked against the privacy policy. If the two disagree, one of them is wrong.
- **Screenshots:** design them deliberately: a different color and layout per slide, big type, crops of the real screens. EarnVouch's first set read as "repetitive and AI" and was redone on launch day. Screenshots can't change without a new version.
- **Monitoring before launch, not on launch day:** error alerts (Sentry), the support inbox, the moderation queue emailing within 15 minutes, and a mail filter so these reach the phone.

## After launch

- A **3-to-6-month plan** (`docs/plan/`) with stages, the weekly numbers, what we won't do, and a weekly log.
- **Weekly metrics**, totals only. Counts under 5 are hidden outside the owner's view.
- **Two lanes:** engineering and operations, and growth. Both work from the same plan.

## Lessons from EarnVouch

1. **Save the kickoff prompt in the repository.** Claude Code deletes old transcripts, and EarnVouch's original prompt is gone.
2. **Check demand first.** Four weeks to launch, and only then "prove the loop". Talk to 10 users first.
3. **Start the paperwork on day one** (`DAY-ONE.md`): the LLC, EIN, D-U-N-S, and Apple and Google accounts in the company's name. Moving an Apple developer account from a person to a company later is slow.
4. **Match rigor to risk.** Minors and identity checks justified 242 decisions and six lawyer rounds. A standard-risk app needs a fraction of that.
5. **Keep `CLAUDE.md` short from the start.** Rules only; the status log lives in `docs/history.md`.
6. **Never trust "approved" in an email.** Check the live state in the console before cleaning anything up.
7. **Render:** a Blueprint sync doesn't remove custom domains the file no longer lists, so remove them by hand. After deleting a static file, run "Clear build cache & deploy". Editing an environment variable redeploys the service.
8. **Expo / EAS:** the free build queue takes 25 to 55 minutes, and the free plan has a monthly build quota, so plan release days around it. Upgrade Expo-managed packages together as a deliberate SDK upgrade, never through Dependabot.
9. **pnpm:** keep dependency install scripts blocked except by name (`allowBuilds`), and don't merge packages published less than a week ago.
10. **Heavy local work collides.** A video render in one session slows another session's test run. Check the load before trusting a slow or failed run.
11. **Secrets never pass through the assistant.** Scripts that need a code ask for it with hidden input, and the owner types it in their own Terminal.
12. **Brand kit early.** One set of color tokens copied to every app, with tests that forbid hex values in screens. It made the late redesigns cheap.
