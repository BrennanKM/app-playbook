# Default stack

What EarnVouch chose (its ADRs 0001 to 0025) and what held up in production. Start the next app from these defaults, and write an ADR only where a choice changes, giving the reason. That saves most of a day of research in Phase 0.

These are defaults, not rules. A web-only app drops the mobile app; an app with no user content drops the content screening.

## The pieces

| Need | Default | Why it held up |
|---|---|---|
| Repository | One monorepo, pnpm workspaces: `apps/mobile`, `apps/api`, `apps/web`, `apps/admin`, `packages/domain` | One PR can change the API, the app, and the shared rules together |
| Language | TypeScript everywhere, strict, sharing one base config | Shared types between the API and the apps |
| Runtime | Node.js LTS (EarnVouch: 24), pinned in `.nvmrc` | |
| Mobile | Expo / React Native with Expo Router; builds and store uploads through EAS | One codebase for iOS and Android; EAS handles signing |
| API | Fastify, Zod for input, Drizzle ORM with migrations | Fast, typed, and plain SQL underneath |
| Database | PostgreSQL | Database-level rules (constraints, triggers), tested |
| Web pages | React Router, server-rendered, plain HTML forms that work before JavaScript loads | Pages for people without the app (clients, parents, reviewers) |
| Admin / moderation tool | A separate React Router app on its own service and domain | Never shares a deploy with the public site |
| Hosting | Render, with one Blueprint per environment: staging on the free tier, production on the smallest paid plans | About $27 a month for API, web, and admin plus the database |
| Staff sign-in | Passkeys (SimpleWebAuthn), set up by an invite command | No passwords to steal |
| User sign-in | Email codes, then passkeys | |
| Email | Postmark | Good delivery; transactional only |
| Text messages | Twilio Verify, only if needed; US texting needs carrier registration | EarnVouch launched email-only |
| Content screening (if users write text others see) | Own rules (strip contact details, linear-time regex) and then Azure AI Content Safety | Free tier covers early volume |
| Identity check (only if truly needed) | Stripe Identity | Pay per check |
| Push | Directly to Apple (APNs) and Google (FCM), with no names or details in a notification | No middleman holding user data |
| Errors | Sentry, server only, scrubbed of personal data | |
| Uptime | Render health checks, plus an outside monitor | |
| Tests | Vitest for units; Playwright for web end-to-end; Maestro for the app's flows | |
| CI | GitHub Actions: lint, types, tests, build, audit, secret scan (gitleaks), path filters; Actions pinned to commit SHAs | |
| Waitlist | A static page posting to Buttondown | No scripts or cookies on the page |
| Fonts and colors | One brand kit (tokens), copied to every app; fonts self-hosted, never from Google Fonts | Tests forbid hex values in screens |
| Marketing video | Remotion, in its own project, never shipped | |

## Code rules worth carrying over

- API routes take their dependencies through one `AppDeps` object (config, database, mailer, clock), so tests swap them easily.
- Errors are answered with a short code, never internal details.
- Every route that changes an account writes to an audit log.
- Free text from users goes through contact-detail stripping before it's stored, and the response says what was removed. Regular expressions on user text stay linear, with a timing test.
- Cryptography uses only Node's built-in `crypto`. Keys come only from environment settings and are never logged.
- Pages reached by a private link: no referrer to other sites, no indexing, no caching.
- The web servers' request logs must never write private links.
- Every schema change has a migration committed with it. The test database's name must end in `_test`, and the test run rebuilds it.
- Accessibility from the first screen: every tappable element has a role, every input a label, and text grows with the phone's text size.

## Dependency hygiene

- pnpm blocks install scripts by default. Allow one only by name, with the reason in a comment.
- Don't take package versions published less than a week ago.
- Dependabot handles ordinary packages. Expo-managed packages, and major versions of TypeScript and `@types/node`, are planned upgrades instead.
- An audit advisory is ignored only by its ID, with the reason and a review date.
- A secret-scan finding is skipped only by its exact fingerprint, never a whole file or rule.

## Budget reference (EarnVouch, 2026-11)

About $52 a month in fixed costs: Render production about $27, Postmark Basic about $15, the Apple Developer Program about $8 a month (yearly), and the domain about $1. Staging was free. Per-use costs were on top: identity checks and texts.
