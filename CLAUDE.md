# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

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
| Mobile app | React Native or Flutter (cross-platform) |
| Admin dashboard | React / Next.js |
| Voice synthesis/recognition | ElevenLabs Conversational AI (real-time streaming via WebSocket) |
| LLM backbone | GPT-4o or Claude (evaluation pending) |
| Memory store | Vector DB (Pinecone/Weaviate) + structured DB |
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
prd.md        — Full product requirements document (sections 1-18 + open questions)
designs.md    — ASCII wireframes for all 30 screens across 3 personas
```

## Development & Testing Approach

This project follows **strict TDD (Test-Driven Development)**. Write tests before implementation code.

### Workflow

1. Write failing tests that define the expected behavior
2. Implement the minimum code to pass those tests
3. Refactor while keeping tests green
4. After any code change, run the full end-to-end test suite to confirm nothing is broken

### End-to-End Testing Philosophy

Every feature must have E2E tests that validate the experience **from the user's perspective** — simulating real interactions the way a senior, care staff member, or admin would actually use the product. These are not technical smoke tests; they should replicate genuine user journeys through the UI.

**Front-end testing is mandatory.** All screens and user flows must be covered by E2E tests using browser/device automation (e.g., Puppeteer, Playwright, Detox, or equivalent).

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

## Open Decisions (from PRD section 18)

Several architectural and product decisions are unresolved: product name, pricing model, target geography, LLM provider selection, telephony approach (in-app vs phone), voice customization, and offline capabilities. Check the "Open Questions" table at the end of `prd.md` before making assumptions about these areas.
