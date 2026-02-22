# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Terminology

- **"Levin Labs"** / **"11 Labs"** = **ElevenLabs** (the voice AI provider). The user refers to ElevenLabs by these names.

## Project Overview

This is a **pre-implementation specification repository** for an AI companion platform targeting senior engagement and aged care. The product name is TBD. There is no source code yet — only product requirements (`prd.md`) and UI/UX wireframe specifications (`designs.md`).

The platform has three user personas and corresponding applications:
- **Senior User App** (iOS/Android mobile) — the end-user companion experience
- **Admin Dashboard** (web) — for aged care facility staff to monitor residents
- **Super Admin Dashboard** (web) — for platform-level management

## Product Concept

Three AI companion personas live in the app like contacts in a phone:
- **Brian** — primary companion (general conversation, long-term memory, proactive check-ins)
- **Gina** — fun & activities (trivia, games, puzzles)
- **Molly** — news & current events (briefings, sports, weather)

The core differentiator is **persistent long-term memory** — Brian remembers everything across conversations and proactively follows up. The platform is dual-purpose: consumer companionship + clinical observability (cognitive/emotional metrics for care teams).

## Planned Technical Architecture

| Component | Planned Technology |
|-----------|-------------------|
| Mobile app | Flutter (cross-platform) |
| Admin dashboard | Next.js |
| Voice synthesis/recognition | ElevenLabs Conversational AI (real-time streaming via WebSocket) |
| LLM backbone | Google Gemini 3 Flash (`gemini-3-flash`) |
| Memory store | Zvec (embedded vector DB) + structured DB |
| Telephony | Twilio (outbound calls, push notifications) |
| Analytics | Custom ML pipeline (sentiment, cognitive metrics) |
| Infrastructure | AWS/GCP (HIPAA-eligible) |

## Key Design Constraints

- **Accessibility-first**: min 18pt font (up to 32pt), 48x48dp touch targets, WCAG AAA (7:1 contrast), voice-only accessibility, max 2 taps to any companion, no scrolling on home screen
- **Target users**: seniors aged 65-85+ with low-to-moderate tech comfort
- **Compliance requirements**: HIPAA, SOC 2 Type II, Australian Privacy Act / Aged Care Quality Standards, GDPR
- **AI safety**: no medical/financial advice, distress/crisis detection with escalation, bias audits
- **App size**: target <100MB
- **Platform targets**: iOS 15+ (iPhone 8+), Android 10+, web dashboard on Chrome/Safari/Edge (latest 2 versions)

## Repository Structure

```
prd.md          — Full product requirements document (sections 1-21 + open questions)
designs.md      — ASCII wireframes for all 30 screens across 3 personas
evaluation.md   — Automated project evaluation (10 parameters, 1-10 scale, updated after every major change)
```

## External Dependencies & API Keys

**Do not commit API keys to the repository.** Store all keys in a `.env` file (added to `.gitignore`) and reference them via environment variables.

| Dependency | Purpose | Env Variable | Docs |
|------------|---------|-------------|------|
| **Google Gemini API** | LLM backbone (`gemini-3-flash`) | `GEMINI_API_KEY` | [ai.google.dev](https://ai.google.dev/) |
| **ElevenLabs** | Voice synthesis & speech-to-text (real-time streaming) | `ELEVENLABS_API_KEY` | [elevenlabs.io/docs](https://elevenlabs.io/docs) |
| **Zvec** | Embedded vector DB for memory/semantic recall | N/A (in-process library, no API key) | [zvec.org](https://zvec.org/) |

**Deferred (not needed for local development):**

| Dependency | Purpose | Status |
|------------|---------|--------|
| Twilio | Outbound telephony, push notifications | Deferred — will integrate later |
| AWS / GCP | Cloud infrastructure (HIPAA-eligible) | Deferred — running locally for now |

## Development & Testing Approach

This project follows **strict TDD (Test-Driven Development)**. Write tests before implementation code.

### Workflow

1. Write failing tests that define the expected behavior
2. Implement the minimum code to pass those tests
3. Refactor while keeping tests green
4. After any code change, run the full end-to-end test suite to confirm nothing is broken

### End-to-End Testing Philosophy

Every feature must have E2E tests that validate the experience **from the user's perspective** — simulating real interactions the way a senior, care staff member, or admin would actually use the product. These are not technical smoke tests; they should replicate genuine user journeys through the UI.

**Front-end testing is mandatory.** All screens and user flows must be covered by E2E tests using browser/device automation (e.g., Puppeteer, Playwright, Detox, or equivalent for Flutter: `integration_test` package, `patrol`, or `flutter_driver`).

### Test Case Expansion

Each time the test suite runs, **actively look for gaps and add new test cases**, especially:

- **Naive user scenarios**: users who don't read instructions, tap random things, use unexpected input (very long text, special characters, empty fields, repeated rapid taps)
- **Accessibility edge cases**: screen reader navigation, high-contrast mode, maximum font size (32pt) rendering, voice-only interaction flows
- **Interruption flows**: mid-call disconnects, app backgrounding during voice calls, network loss during chat, switching between companions mid-conversation
- **Senior-specific patterns**: accidental double-taps, very slow input, confusion between companions, backing out of onboarding partway through, calling the same companion repeatedly
- **Permission and consent flows**: denying microphone access then trying a voice call, revoking consent, re-onboarding after account deletion
- **Admin dashboard edge cases**: viewing a resident with zero conversations, alerts for residents who haven't used the app yet, bulk operations on large resident lists
- **Cross-persona memory**: verifying Brian recalls something mentioned to Gina, ensuring memory isolation where appropriate

The goal is to continuously harden the product against real-world usage by non-technical seniors (65-85+) who will interact with the app in unpredictable ways.

### Local Development

Current phase is **local-only**. The app should build and run entirely on a local machine with just the Gemini and ElevenLabs API keys in `.env`. No cloud infrastructure, no Twilio, no push notifications yet.

### TestFlight / macOS Deployment Tests

The Flutter app will be pushed to **TestFlight on macOS** for early testing. The following must be validated before each TestFlight submission:

**Build & packaging:**
- `flutter build macos` completes without errors or warnings
- App bundle size is within target (<100MB)
- App launches cleanly on macOS without crashes on first run
- `.env` / API key configuration is not bundled into the archive (secrets stay local)

**Core functionality smoke tests (pre-TestFlight checklist):**
- Onboarding flow completes start to finish without getting stuck
- Home screen renders all three companion cards (Brian, Gina, Molly) with correct layout
- Chat with Brian: send a message → receive an LLM response via Gemini
- Voice call with Brian: tap Call → ElevenLabs streaming connects → audio plays → end call works
- Chat with Gina: start a trivia/game session → interaction works
- Chat with Molly: request a news briefing → response renders
- Settings screen: font size slider works and applies globally
- Profile screen: displays stored memory items from conversations

**Platform-specific tests (macOS):**
- Window resizing doesn't break layout — all screens remain usable at various window sizes
- Menu bar and keyboard shortcuts don't conflict with app controls
- Microphone permission prompt appears correctly on first voice call attempt
- App behaves correctly when microphone permission is denied (graceful fallback, not a crash)
- App handles macOS sleep/wake without losing conversation state
- Copy/paste works in chat input fields
- Trackpad scrolling works in chat history and long content views

**Offline / degraded network tests:**
- App shows clear error state when no network is available (not a blank screen or spinner forever)
- Partial network loss mid-voice-call: app recovers or shows a clear "call dropped" message
- Queued chat messages send when network returns (or user is clearly told the message failed)

## Project Evaluation

An automated evaluation framework exists in `evaluation.md`. It scores the project across 10 parameters on a 1-10 scale, with an overall score and actionable instructions for reaching 10/10 on each parameter.

### When to Run the Evaluation

Run the evaluation as a **codebase-evaluator sub-agent** in these situations:

1. **After every major change** — any significant feature implementation, architectural change, or milestone completion
2. **On every Ralph Loop iteration** — the evaluation must be run at the end of each Ralph Loop cycle
3. **Before creating pull requests** — to validate the current state before integration
4. **After completing a phase milestone** — when a numbered phase from the roadmap is completed

### Evaluation Parameters

The evaluation scores these 10 parameters (1-10 each):

1. Product Requirements Completeness
2. UI/UX Design Specification
3. Technical Architecture
4. Implementation Progress
5. Test Coverage
6. Security & Compliance
7. DevOps & Infrastructure
8. Documentation Quality
9. Project Management & Process
10. Accessibility & Inclusivity

Each parameter includes the current state assessment, identified gaps, and a checklist of specific actions to reach 10/10. The overall score is the average of all parameters.

### How to Run

Use the `codebase-evaluator` sub-agent type via the Task tool. The agent will audit the entire codebase, update `evaluation.md` with current scores, and identify what changed since the last evaluation.

## Open Decisions (from PRD section 18)

Several architectural and product decisions are unresolved: product name, pricing model, target geography, LLM provider selection, telephony approach (in-app vs phone), voice customization, and offline capabilities. Check the "Open Questions" table at the end of `prd.md` before making assumptions about these areas.
