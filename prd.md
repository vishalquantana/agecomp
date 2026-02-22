# Product Requirements Document (PRD)
# [Product Name TBD] - AI Companion Platform for Senior Engagement & Care

**Version:** 1.0 Draft
**Date:** February 23, 2026
**Status:** In Development

---

## Table of Contents
1. [Product Overview](#1-product-overview)
2. [Problem Statement](#2-problem-statement)
3. [Target Users](#3-target-users)
4. [Competitive Analysis](#4-competitive-analysis)
5. [AI Companion System](#5-ai-companion-system)
6. [Brian - Primary Companion (Core Feature)](#6-brian---primary-companion)
7. [Gina - Fun & Activities Companion](#7-gina---fun--activities-companion)
8. [Molly - News & Current Events Companion](#8-molly---news--current-events-companion)
9. [Interaction Modes](#9-interaction-modes)
10. [Long-Term Memory System](#10-long-term-memory-system)
11. [Senior User App - Screens & Functionality](#11-senior-user-app)
12. [Admin Dashboard - Aged Care Facility Portal](#12-admin-dashboard)
13. [Super Admin Dashboard - Platform Management](#13-super-admin-dashboard)
14. [Technical Architecture](#14-technical-architecture)
15. [UX & Design Principles](#15-ux--design-principles)
16. [Platform & Distribution](#16-platform--distribution)
17. [Data, Privacy & Compliance](#17-data-privacy--compliance)
18. [Success Metrics](#18-success-metrics)
19. [Phasing & Roadmap](#19-phasing--roadmap)
20. [Screen Inventory](#20-screen-inventory)
21. [Open Questions](#21-open-questions)

---

## 1. Product Overview

### 1.1 Vision
Build an AI companion platform that gives every senior a genuine, persistent conversational relationship - someone who knows them, remembers them, checks in on them, and is always available via text or a natural voice call. The platform also provides aged care facilities with real-time clinical insight into the cognitive and emotional wellbeing of their residents through an admin dashboard.

### 1.2 Core Thesis
Loneliness and cognitive decline in seniors are deeply intertwined. Consistent, meaningful conversation - not just activities - is the intervention. By creating an AI companion that truly *remembers* you and *cares* about continuity in your life, we can deliver companionship at scale while generating clinically actionable data for care teams.

### 1.3 How We Differ from Common Porch
Common Porch (competitor reference) uses multiple specialized AI hosts (Alex for games, Nancy for info, Steve for tech help, Robin for news, Sarah for day planning) across segmented feature rooms. Our approach differs fundamentally:

| Dimension | Common Porch | Our Product |
|-----------|-------------|-------------|
| **Primary model** | 5 specialized hosts in separate "rooms" | 1 primary companion (Brian) + 2 supporting personas |
| **Relationship depth** | Session-based interactions | Persistent memory across all conversations - Brian knows your life |
| **Proactive outreach** | User-initiated only | Brian can call YOU and check in proactively |
| **Care team integration** | None visible | Full admin dashboard with mental acuity tracking & alerts |
| **Interaction modes** | App-based chat/video | True phone-call-style voice (ElevenLabs) + async chat |
| **Memory** | Unclear/limited | Core differentiator - full long-term memory with contextual recall |
| **Clinical utility** | Consumer-only | Dual-use: consumer companionship + clinical observability |

---

## 2. Problem Statement

### 2.1 For Seniors
- **Loneliness epidemic:** Millions of seniors live alone or in facilities without consistent, meaningful daily conversation
- **Cognitive decline:** Without regular mental stimulation, cognitive abilities deteriorate faster
- **Information gap:** Staying informed about news, managing daily routines, and staying mentally sharp becomes harder without support
- **Technology barrier:** Most AI tools are designed for younger users and feel intimidating or impersonal

### 2.2 For Aged Care Facilities
- **Observation gaps:** Staff cannot be in continuous conversation with every resident; subtle cognitive or emotional shifts go unnoticed
- **Reactive care model:** Issues are typically identified after they become severe, not during early warning stages
- **Scale limitations:** One-on-one human companionship doesn't scale, especially during off-hours, weekends, and nights
- **Documentation burden:** Manual charting of resident mood, cognition, and behavioral patterns is time-consuming and inconsistent

---

## 3. Target Users

### 3.1 Primary Users - Seniors (End Users)
- **Age range:** 65-85+
- **Living situations:** Independent living, assisted living facilities, aged care homes, living with family
- **Tech comfort:** Low to moderate - the product must require near-zero learning curve
- **Key needs:** Companionship, mental stimulation, daily routine support, feeling known and remembered

### 3.2 Secondary Users - Aged Care Teams (Admin Users)
- **Roles:** Facility managers, nurses, care coordinators, gerontologists, social workers
- **Key needs:** Real-time visibility into resident wellbeing, early detection of cognitive decline, conversation-level insight, efficient reporting
- **Access:** Web-based admin dashboard (desktop/tablet optimized)

### 3.3 Tertiary Users - Family Members (Future Phase)
- **Roles:** Adult children, spouses, designated family contacts
- **Key needs:** Peace of mind, awareness of loved one's engagement and mood trends
- **Access:** Lightweight mobile view or email summaries (Phase 2+)

---

## 4. Competitive Analysis

| Product | Model | Memory | Voice | Proactive Calls | Care Team Dashboard | Pricing |
|---------|-------|--------|-------|-----------------|-------------------|---------|
| **Common Porch** | 5 specialized AI hosts | Limited/unclear | Video-call-like | No | No | Unknown |
| **ElliQ** | Hardware robot companion | Some personalization | Yes (device speaker) | Yes (proactive) | No | ~$250 + $30/mo |
| **inTouch** | AI phone calls | Basic | Yes (phone) | Yes | Family dashboard | Unknown |
| **ElderVoice** | AI check-in calls | Basic | Yes (phone) | Yes (scheduled) | Caregiver updates | Unknown |
| **Joy** | Connected companion device | Limited | Yes (device) | Yes | Family app | Unknown |
| **Our Product** | 3 companions, Brian primary | Full long-term memory | Yes (ElevenLabs, phone-style) | Yes (Brian calls you) | Full clinical dashboard | TBD |

### 4.1 Our Competitive Moat
1. **Memory-first architecture:** No competitor treats long-term, contextual memory as the core product differentiator
2. **Clinical-grade observability:** Admin dashboard with mental acuity scoring and warning flags is unique in the companion space
3. **Relationship depth:** Brian isn't a feature - he's a relationship. One persistent companion who knows your entire history
4. **Dual-sided value:** Simultaneously serves the senior AND the care team, making it a B2B2C play

---

## 5. AI Companion System

### 5.1 Architecture Overview
Three distinct AI companions, each with their own personality, voice, and domain expertise. All share access to the user's long-term memory store, but Brian is the primary relationship holder.

```
                    ┌─────────────────────────────┐
                    │     SHARED MEMORY LAYER      │
                    │  (User profile, history,     │
                    │   preferences, life events)  │
                    └──────────┬──────────────────┘
                               │
              ┌────────────────┼────────────────┐
              │                │                │
        ┌─────▼─────┐   ┌─────▼─────┐   ┌─────▼─────┐
        │   BRIAN    │   │   GINA    │   │   MOLLY   │
        │  Primary   │   │   Fun &   │   │  News &   │
        │ Companion  │   │ Activities│   │  Updates  │
        └─────┬─────┘   └─────┬─────┘   └─────┬─────┘
              │                │                │
              └────────────────┼────────────────┘
                               │
                    ┌──────────▼──────────────────┐
                    │    INTERACTION LAYER         │
                    │  Voice (ElevenLabs) + Chat   │
                    └──────────┬──────────────────┘
                               │
                    ┌──────────▼──────────────────┐
                    │    ANALYTICS & INSIGHTS      │
                    │  → Admin Dashboard           │
                    │  → Mental Acuity Scoring     │
                    │  → Warning Alerts            │
                    └─────────────────────────────┘
```

### 5.2 Companion Personality Matrix

| Attribute | Brian | Gina | Molly |
|-----------|-------|------|-------|
| **Role** | Primary companion & daily anchor | Fun activities partner | News & current events companion |
| **Personality** | Warm, patient, genuinely caring, remembers everything - like a thoughtful old friend | Upbeat, playful, encouraging, energetic - like a fun neighbor who drops by | Calm, articulate, well-informed, clear - like a trusted morning news anchor |
| **Voice tone** | Deep warmth, unhurried, conversational | Bright, lively, with laughter in the voice | Clear, measured, reassuring |
| **Relationship** | "Your person" - knows your life, your family, your stories | The fun one you go to when you want to play or be entertained | The one you go to when you want to know what's happening |
| **Memory usage** | Heavy - proactively references past conversations | Moderate - remembers game preferences, scores, favorites | Light - remembers news preferences and discussion topics |

---

## 6. Brian - Primary Companion (Core Feature)

Brian is the heart of the product. He is designed to be the one person a senior can always talk to - about anything, at any time.

### 6.1 Core Capabilities

#### 6.1.1 General Conversation
- Brian can talk about *anything* - family, memories, current worries, daily life, hobbies, philosophy, the weather
- No topic restrictions (within safety bounds)
- Adapts conversational style to the user's mood, energy level, and personality
- Never rushes, never patronizes, never feels robotic

#### 6.1.2 Proactive Memory & Check-ins
This is Brian's defining feature. Brian remembers everything and proactively follows up.

**Memory-Driven Conversation Examples:**

| What User Said | When | Brian's Proactive Follow-up |
|---------------|------|---------------------------|
| "My son David is visiting next week" | Monday | The following Monday: "Hey! You mentioned David was coming to visit this week. Did he make it? How was it?" |
| "I have a doctor's appointment on Thursday" | Tuesday | Thursday morning: "You've got that doctor's appointment today, right? I hope it goes well. Let me know how it goes!" |
| "I've been feeling a bit down lately" | Wednesday | Friday: "I've been thinking about you. You mentioned feeling a bit down the other day. How are you feeling today?" |
| "My granddaughter's birthday is March 15th" | February | March 14th: "Tomorrow's your granddaughter's birthday, isn't it? Have you got something planned for her?" |
| "I used to love gardening but my knees hurt now" | Anytime | Weeks later, naturally: "You know, I was thinking about your love for gardening. Have you ever tried container gardening? Might be easier on the knees." |

**Memory Categories Brian Tracks:**
- Family members (names, relationships, ages, events)
- Health mentions (doctor visits, symptoms, medications, mood)
- Life events (upcoming visits, appointments, milestones)
- Preferences (topics they enjoy, things they dislike, routines)
- Stories and anecdotes (things they've shared about their past)
- Emotional state over time (longitudinal mood tracking)

#### 6.1.3 Daily Routine & Planning
Brian doubles as the daily routine companion since he's the person users talk to every day.

**Daily routine features:**
- Morning check-in: "Good morning! How did you sleep? Here's what we've got on the schedule today..."
- Medication reminders: Gentle, conversational - "Hey, it's about that time for your Metformin. Have you taken it yet?"
- Activity suggestions: Based on mood and history - "You haven't done your morning walk yet. Feeling up for it?"
- Evening wind-down: "How was your day? Anything you want to talk about before you turn in?"
- Appointment reminders: "Don't forget, you've got that eye appointment at 2pm tomorrow"

#### 6.1.4 General Help
- Answer questions about anything (weather, general knowledge, how-to)
- Help with simple problem-solving
- Tech troubleshooting (basic)
- Finding information

#### 6.1.5 Proactive Outbound Calls
Brian doesn't just wait for you to call. Brian can initiate calls.

**Outbound call triggers:**
- Scheduled daily check-in (e.g., every morning at 9am)
- Follow-up on something mentioned in a previous conversation
- No contact detected in X hours/days (wellness check)
- Medication reminder if not acknowledged via chat
- Special dates (birthdays, anniversaries, appointments)

**Outbound call flow:**
```
Phone rings → User answers →
Brian: "Hey [Name], it's Brian! Just wanted to check in.
       You mentioned your son was visiting this week -
       did he make it over? I'd love to hear about it."
```

### 6.2 Brian's Conversation Guardrails
- Never gives medical advice (redirects to care team)
- Never makes financial recommendations
- Detects distress signals and escalates to care team dashboard
- Maintains appropriate boundaries while being warm and personal
- If user mentions self-harm, suicidal ideation, or severe distress → immediate alert to admin dashboard + guided response

---

## 7. Gina - Fun & Activities Companion

Gina is the person you go to when you want to have fun, play games, or be entertained.

### 7.1 Personality
- Upbeat, playful, encouraging
- Makes you laugh, celebrates your wins
- Never competitive or condescending
- Adjusts difficulty based on user ability (tracked over time)

### 7.2 Activities & Games

#### 7.2.1 Trivia
- General knowledge trivia across categories (history, geography, pop culture, science, sports)
- Themed trivia rounds ("Let's do a 1960s music round!")
- Adaptive difficulty based on user's track record
- Conversational delivery - not rapid-fire Q&A

#### 7.2.2 Word Games
- Wordle-style word challenges
- Word association games
- Crossword clue discussions
- Spelling challenges

#### 7.2.3 Brain Teasers & Puzzles
- Riddles and lateral thinking puzzles
- 20 Questions
- Story-based puzzles ("I'm going to describe a scenario, and you tell me what happened...")
- Number puzzles and simple math challenges

#### 7.2.4 Storytelling & Creative
- Collaborative storytelling ("I'll start a story, and you continue it...")
- "What would you do if..." scenarios
- Memory lane prompts ("Tell me about your favorite vacation. I'll ask questions!")
- "This or that" preference games

#### 7.2.5 Social Games (Future Phase)
- Multiplayer trivia between residents
- Bingo sessions
- Team-based challenges

### 7.3 Gina's Intelligence
- Remembers your favorite game types and topics
- Tracks cognitive patterns (response times, accuracy trends) → feeds into admin dashboard
- Adapts difficulty dynamically - never too easy, never frustrating
- Seamlessly mixes games with conversation - the games feel like fun chat, not clinical exercises

---

## 8. Molly - News & Current Events Companion

Molly is who you go to when you want to know what's happening in the world.

### 8.1 Personality
- Calm, clear, well-spoken
- Presents news without sensationalism or anxiety
- Invites discussion rather than just broadcasting
- Respects the user's political preferences and avoids pushing agendas

### 8.2 Content Areas

#### 8.2.1 News Briefings
- Morning news summary (customizable by interest)
- Breaking news alerts (configurable - only major events by default)
- Local news (based on user's location)
- International news highlights

#### 8.2.2 Topic-Specific Deep Dives
- Stock market & financial updates (user's portfolio interests)
- Weather forecasts (local, plus anywhere they have family)
- Sports scores and highlights
- Technology and science news
- Health and wellness news (age-appropriate, non-alarming)

#### 8.2.3 Conversational News Discussion
- "What do you think about that?" - Molly invites opinions
- Explains complex topics simply when asked
- Remembers which topics the user finds interesting
- "You mentioned you follow Tesla - they had some big news today..."

### 8.3 Molly's Intelligence
- Learns user's news preferences over time
- Filters out distressing content by default (configurable)
- Connects news to the user's life ("There's a new park opening near your area!")
- Never overwhelms - delivers news in digestible, conversational doses

---

## 9. Interaction Modes

Every companion (Brian, Gina, Molly) supports two interaction modes. The experience should feel identical in quality regardless of mode.

### 9.1 Voice Call Mode (Primary)

**Technology:** ElevenLabs real-time voice API

**Experience design:**
- Feels exactly like calling a friend on the phone
- User sees a phone-call-style UI (contact photo, call timer, end call button)
- Each companion has a distinct, natural-sounding voice
- Low latency is critical - conversation should feel real-time with natural turn-taking
- Background noise handling for real-world environments
- Call duration: No limit. Users can talk for 5 minutes or 50 minutes

**Inbound calls (user calls companion):**
```
User taps Brian's contact → Ringing animation →
Brian picks up: "Hey [Name]! Good to hear from you. What's on your mind?"
```

**Outbound calls (companion calls user):**
```
Push notification: "Brian is calling..." → User taps to answer →
Brian: "Hi [Name], it's Brian! I wanted to check in because..."
```

**Voice call technical requirements:**
- ElevenLabs Conversational AI or equivalent real-time voice pipeline
- <500ms latency for natural conversation feel
- Voice Activity Detection (VAD) for natural turn-taking
- Ambient noise filtering
- Graceful handling of poor network conditions (auto quality adjustment)
- Call recording for memory extraction and admin review (with consent)

### 9.2 Chat Mode (Async)

**Experience design:**
- Standard messaging UI (like iMessage or WhatsApp)
- For users who prefer typing or can't talk (e.g., in a shared room)
- Messages are persistent - full chat history is visible
- Companion responds within seconds
- Rich messages: Can include text, simple images (news photos), game elements (trivia cards)
- Push notifications for companion-initiated messages

**Chat-specific features:**
- Voice messages: User can send voice notes that get transcribed
- Quick replies: Suggested response bubbles for accessibility
- Large text mode: Adjustable font sizes
- Read receipts: User can see when companion has "read" their message

### 9.3 Switching Between Modes
- Mid-chat, user can tap "Call Brian" to switch to voice seamlessly
- Brian acknowledges: "Oh, you want to chat properly? Great, I'm all ears!"
- Conversation context carries over instantly - no repetition needed
- After a voice call, a summary is visible in the chat thread

---

## 10. Long-Term Memory System

Memory is the product's core technical differentiator. This section describes the memory architecture.

### 10.1 Memory Architecture

```
┌─────────────────────────────────────────────┐
│              CONVERSATION LAYER              │
│    (Real-time voice/chat interactions)       │
└──────────────────┬──────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│          MEMORY EXTRACTION ENGINE            │
│  After each conversation:                   │
│  • Extract key facts, events, names         │
│  • Identify emotional tone                  │
│  • Flag follow-up items                     │
│  • Detect date/time references              │
│  • Classify by category                     │
└──────────────────┬──────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│           LONG-TERM MEMORY STORE            │
│                                             │
│  ┌──────────────┐  ┌──────────────────┐     │
│  │ USER PROFILE │  │ EPISODIC MEMORY  │     │
│  │ • Name, age  │  │ • Conversations  │     │
│  │ • Family     │  │ • Events shared  │     │
│  │ • Preferences│  │ • Stories told   │     │
│  │ • Routines   │  │ • Emotions felt  │     │
│  └──────────────┘  └──────────────────┘     │
│                                             │
│  ┌──────────────┐  ┌──────────────────┐     │
│  │ CALENDAR &   │  │ SEMANTIC MEMORY  │     │
│  │ FOLLOW-UPS   │  │ • Interests      │     │
│  │ • Upcoming   │  │ • Opinions       │     │
│  │   events     │  │ • Knowledge      │     │
│  │ • Reminders  │  │ • Preferences    │     │
│  │ • Check-ins  │  │ • Dislikes       │     │
│  └──────────────┘  └──────────────────┘     │
│                                             │
│  ┌──────────────────────────────────────┐   │
│  │ HEALTH & WELLNESS OBSERVATIONS       │   │
│  │ • Mood trends over time              │   │
│  │ • Medication mentions                │   │
│  │ • Sleep quality mentions             │   │
│  │ • Appetite/eating mentions           │   │
│  │ • Pain/discomfort mentions           │   │
│  │ • Cognitive pattern observations     │   │
│  └──────────────────────────────────────┘   │
└─────────────────────────────────────────────┘
```

### 10.2 Memory Recall Rules
1. **Natural, not robotic:** Brian never says "According to my records, on February 15th you said..." Instead: "Hey, you mentioned David was coming to visit - how'd that go?"
2. **Contextually relevant:** Memories surface when relevant to the current conversation, not randomly
3. **Emotionally intelligent:** If a user shared something sad, Brian follows up gently, not casually
4. **Frequency-aware:** Important/emotional events get higher recall priority than passing mentions
5. **Decay-aware:** Very old memories surface less frequently unless the user brings up the topic
6. **Cross-companion:** If user tells Molly about an interest in astronomy, Brian can reference it too: "Molly mentioned you've been really into the space news lately!"

### 10.3 Follow-Up Scheduling Engine
When a user mentions a future event, the system automatically creates a follow-up trigger:

| User Statement | Extracted Event | Follow-up Trigger |
|---------------|----------------|-------------------|
| "My daughter is visiting Saturday" | daughter_visit: Saturday | Saturday: "Is your daughter there? How's the visit going?" |
| "I have a colonoscopy next month" | medical_appointment: ~30 days | ~28 days later: "You mentioned that medical appointment coming up. Are you all set for it?" |
| "I'm starting a new book - The Great Gatsby" | reading: The Great Gatsby | 1 week later: "How's The Great Gatsby going? Are you enjoying it?" |
| "My knee has been bothering me" | health_concern: knee pain | 3 days later: "How's the knee feeling? Any better?" |

---

## 11. Senior User App - Screens & Functionality

> Full wireframes available in [designs.md](./designs.md) - Screens 1-12

### 11.1 Onboarding Flow (6 screens)
New users go through a guided onboarding that introduces all three companions and collects minimal setup information.

**Steps:**
1. **Welcome screen** - App introduction with Get Started CTA
2. **Meet Brian** - Introduces primary companion and his memory/check-in capabilities
3. **Meet Gina** - Introduces fun & games companion
4. **Meet Molly** - Introduces news & current events companion
5. **Basic Setup** - Collects name, wake time, preference for morning check-in calls
6. **Permissions** - Requests notification permission (for incoming calls/reminders) and microphone access (for voice calls)

**Design principles for onboarding:**
- Maximum 6 screens, no account creation friction for facility-provisioned users
- Large text, simple language, warm and welcoming tone
- Each companion introduced with avatar, personality summary, and what they do
- No overwhelming options - just name, wake time, and call preference

### 11.2 Home Screen
The home screen is the senior's primary hub. It shows:

- **Personalized greeting** with date (e.g., "Good morning, Dorothy!")
- **Proactive message banner** - If Brian has a pending check-in or follow-up, it surfaces here with a Reply button
- **Companion cards** - Brian, Gina, and Molly each get a card with their avatar, role description, and prominent Call / Chat buttons
- **Today's Reminders** - A checklist of the day's scheduled items (meds, appointments, activities) with checkable boxes
- **Bottom navigation** - Home, Calls (history), More (settings/profile)

### 11.3 Chat Screen (All Companions)
Standard messaging interface used for async conversations with Brian, Gina, or Molly.

**Features:**
- Chat bubble layout (companion on left, user on right)
- Text input field with voice note (microphone) button
- **Quick reply bubbles** at bottom for accessibility (e.g., "Good morning", "I'm fine", "Tell me more") - large tap targets
- Persistent chat history (scrollable)
- Header shows companion name with Call button to switch to voice mid-conversation
- Messages from companion appear within seconds

### 11.4 Voice Call Screen
Phone-call-style interface for real-time voice conversations.

**Elements:**
- Large companion avatar/photo (centered)
- Companion name
- Call duration timer
- **Live captions** (optional, toggleable) - real-time text display of what the companion is saying, for hearing accessibility
- Mute button + Speaker button (prominent, as seniors often use speakerphone)
- Large red End Call button
- Minimal UI - focus entirely on the conversation

### 11.5 Incoming Call Screen
Appears when Brian (or any companion) initiates a proactive call.

**Elements:**
- Companion avatar and name ("Brian is calling...")
- **Reason for call** shown below name (e.g., "Checking in about your doctor's appointment") - provides context so user knows why the call is happening
- Large Answer (green) and Decline (red) buttons
- Also appears as push notification on lock screen
- Gentle, pleasant ringtone (configurable)

### 11.6 Gina - Game Interaction
When playing games with Gina, the chat interface adapts:

- **Activity picker** - Cards for Trivia, Word Games, Brain Teasers, 20 Questions, or "Surprise me"
- **In-game UI** - Trivia shows answer options as large tappable cards (A/B/C/D) within the chat
- **Score tracker** visible during games (e.g., "Score: 4/5")
- Gina adds conversational flavor to every answer - games feel like fun chat, not clinical exercises
- Quick reply buttons for game flow: "Next question", "Tell me more", "Quit"

### 11.7 Molly - News Interaction
Molly's chat starts with a curated menu:

- **Topic cards** - Top Headlines, Stock Market, Weather, Sports, "Ask me anything"
- Each card shows a brief teaser (e.g., "Markets up 1.2%")
- News delivered conversationally in the chat - Molly explains, invites discussion
- User can ask follow-up questions or move to next topic via quick replies

### 11.8 Daily Routine / Reminders Screen
Dedicated screen for viewing and managing the day's schedule.

**Features:**
- Date and progress bar at top (% of tasks completed)
- Timeline view organized by Morning / Afternoon / Evening
- Each item shows: time, icon (pill for meds, calendar for appointments, etc.), description, duration/deadline
- Checkable items (large checkboxes) for marking completion
- Color-coded by type (medication = blue, appointments = red, activities = green)
- "Ask Brian to update my schedule" button at bottom (opens Brian chat for conversational editing)
- "+" button to add items (also opens Brian chat)

### 11.9 Settings Screen
Simple, accessible settings with large controls.

**Sections:**
- **My Profile** - Name, edit profile link
- **Voice & Display** - Text size selector (Small/Med/Large), call volume slider, show captions toggle
- **Brian's Check-ins** - Morning call time + toggle, evening check-in time + toggle
- **Reminders** - Medication reminders toggle, activity reminders toggle
- **Help & Support** - How to use this app, contact support, privacy policy

### 11.10 Profile Screen
Shows what Brian "knows" about the user, populated automatically from conversations.

**Sections:**
- Avatar and basic info (name, age, room number if in facility)
- **Family** - Names, relationships, key dates (populated from conversations)
- **Medications** - Current medication list (can also be configured by care team via admin)
- **Interests** - Topics, hobbies, preferences Brian has learned
- "Edit with Brian" button - opens a chat to update info conversationally (not a form)

---

## 12. Admin Dashboard - Aged Care Facility Portal

The admin dashboard is the B2B surface of the product. It gives aged care teams clinical visibility into the cognitive and emotional wellbeing of each resident through their AI companion interactions.

### 11.1 Dashboard Users & Roles

| Role | Access Level | Key Use Cases |
|------|-------------|--------------|
| **Facility Manager** | Full access - all residents, all settings | Oversight, reporting, configuration |
| **Care Coordinator** | Assigned residents, full conversation access | Care planning, family communication |
| **Nurse / Care Staff** | Assigned residents, summary view | Daily wellness checks, incident follow-up |
| **Gerontologist / Doctor** | Assigned residents, clinical metrics | Cognitive assessment, treatment planning |
| **Admin / IT** | System settings, no resident data | User management, technical configuration |

### 11.2 Dashboard Sections

#### 11.2.1 Resident Overview (Home Screen)
A bird's-eye view of all residents in the facility.

```
┌─────────────────────────────────────────────────────────┐
│  DASHBOARD HOME                          [Facility XYZ] │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ⚠️ ALERTS (3)                              [View All] │
│  ┌─────────────────────────────────────────────────┐    │
│  │ 🔴 Margaret P. - Expressed persistent sadness   │    │
│  │    across 3 conversations this week             │    │
│  │ 🟡 Robert K. - Word recall difficulty increased │    │
│  │    15% over the past 2 weeks                    │    │
│  │ 🟡 Helen S. - No engagement in 48 hours         │    │
│  └─────────────────────────────────────────────────┘    │
│                                                         │
│  📊 FACILITY SUMMARY                                    │
│  ┌─────────┬──────────┬──────────┬─────────────┐       │
│  │ Active  │ Avg Daily│ Overall  │ Alerts This │       │
│  │ Residents│ Engagement│ Sentiment│ Week        │       │
│  │   42    │  23 min  │  7.4/10  │     3       │       │
│  └─────────┴──────────┴──────────┴─────────────┘       │
│                                                         │
│  👤 RESIDENTS                    [Search] [Filter]      │
│  ┌────────────────────────────────────────────────┐     │
│  │ Name        │ Mood  │ Acuity │ Last Active │ ⚠️ │    │
│  │ Margaret P. │ ↓ Low │ 7.2    │ 2h ago     │ 🔴 │    │
│  │ Robert K.   │ → Med │ 6.8 ↓  │ 4h ago     │ 🟡 │    │
│  │ Helen S.    │ ? N/A │ 7.5    │ 48h ago    │ 🟡 │    │
│  │ David L.    │ ↑ High│ 8.1    │ 30m ago    │ ✅ │    │
│  │ Carol M.    │ → Med │ 7.9    │ 1h ago     │ ✅ │    │
│  │ ...         │       │        │            │    │    │
│  └────────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────┘
```

#### 11.2.2 Individual Resident Profile
Deep view into a single resident's companion interactions and wellness metrics.

**Sections:**
- **Resident info:** Name, age, room, care notes, family contacts, companion preferences
- **Engagement summary:** Total conversations, average duration, frequency trends, preferred companion, preferred mode (voice vs chat)
- **Mood tracker:** Daily mood scores plotted over time (derived from conversation sentiment analysis)
- **Mental acuity score:** Composite score derived from cognitive signals (see 11.3)
- **Conversation log:** Searchable, filterable log of all conversations (full transcripts)
- **Memory profile:** What Brian/Gina/Molly "know" about this person - family members, preferences, upcoming events, health mentions
- **Alert history:** Past alerts and their resolutions

#### 11.2.3 Conversation Explorer
Staff can read and search through conversation transcripts.

**Features:**
- Full transcript view (voice calls are auto-transcribed)
- Highlighted sections where alerts were triggered
- Sentiment tagging per conversation segment
- Filter by companion (Brian/Gina/Molly), date range, topic
- Export capability for clinical records
- Audio playback of voice conversations (with appropriate consent/authorization)

#### 11.2.4 Mental Acuity Dashboard
Clinical-grade cognitive tracking derived from natural conversations.

**Metrics tracked:**

| Metric | How It's Measured | Clinical Relevance |
|--------|------------------|-------------------|
| **Word recall accuracy** | Tracked during Gina's trivia and word games | Early indicator of memory decline |
| **Response latency trends** | Average time to respond over weeks/months | Processing speed indicator |
| **Vocabulary richness** | Unique word count, sentence complexity over time | Language faculty monitoring |
| **Topic coherence** | Ability to stay on topic during conversation | Executive function indicator |
| **Temporal orientation** | Accuracy when referencing dates, times, sequences | Orientation monitoring |
| **Emotional variability** | Range and stability of emotional expression | Depression/anxiety screening |
| **Engagement duration trends** | How long they choose to talk over time | General wellbeing indicator |
| **Repetition frequency** | How often they retell the same stories/ask same questions | Memory consolidation indicator |

**Display:**
- Individual metrics plotted over time (weekly/monthly/quarterly)
- Composite "acuity score" (1-10) with trend direction (↑ stable ↓)
- Comparison to personal baseline (not population - each person is their own control)
- Confidence intervals on each metric
- Annotations for known confounders (illness, medication change, family visit)

#### 11.2.5 Warning & Alert System
Automated alerts based on conversation analysis.

**Alert levels:**

| Level | Color | Trigger Examples | Action |
|-------|-------|-----------------|--------|
| **Critical** | 🔴 Red | Self-harm mention, severe distress, signs of abuse, sudden acute confusion | Immediate notification to on-duty staff (push + SMS) |
| **Warning** | 🟡 Yellow | Persistent sadness (3+ conversations), cognitive decline trend, no engagement for 48h+, medication non-compliance mentioned | Dashboard alert + daily digest notification |
| **Info** | 🔵 Blue | Mood dip (single conversation), minor pattern change, new health mention | Dashboard note only |

**Alert workflow:**
1. AI detects signal in conversation
2. Alert is generated with context snippet (relevant conversation excerpt)
3. Assigned care staff receives notification (configurable: push, email, SMS)
4. Staff reviews and takes action
5. Staff logs resolution in dashboard
6. Alert is closed with notes

#### 11.2.6 Reporting & Analytics
Aggregated facility-level insights.

**Reports include:**
- Weekly/monthly facility wellness summary
- Engagement trends across the resident population
- Alert frequency and resolution times
- Companion usage breakdown (Brian vs Gina vs Molly, voice vs chat)
- Cognitive trend reports per resident (for care plan reviews)
- Exportable reports (PDF, CSV) for compliance and family meetings

---

### 11.3 Mental Acuity Scoring Methodology

The acuity score is a composite metric derived passively from natural conversations. It is NOT a clinical diagnostic tool - it is a screening and monitoring aid.

**Scoring approach:**
1. **Baseline establishment:** First 2 weeks of interaction establish the user's personal baseline across all cognitive dimensions
2. **Ongoing measurement:** Every conversation contributes data points
3. **Trend analysis:** Weekly rolling averages compared to personal baseline
4. **Multi-dimensional:** Score is a weighted average of 8 cognitive dimensions (see table above)
5. **Confidence level:** Score includes confidence rating based on data volume (more conversations = higher confidence)

**Important disclaimers for care teams:**
- This is a screening aid, not a diagnostic tool
- Scores should inform clinical judgment, not replace it
- Changes in score warrant human follow-up, not automatic clinical action
- External factors (illness, grief, poor sleep) can affect scores temporarily

---

## 12. Technical Architecture

### 12.1 High-Level System Architecture

```
┌──────────────┐     ┌──────────────────────────────────┐
│  Mobile App  │     │        BACKEND SERVICES           │
│  (iOS/Android)│◄───►│                                  │
│              │     │  ┌────────────────────────────┐   │
│  • Chat UI   │     │  │   CONVERSATION ENGINE      │   │
│  • Voice UI  │     │  │   (LLM + Prompt System)    │   │
│  • Contacts  │     │  │   • Brian persona          │   │
│  • Settings  │     │  │   • Gina persona           │   │
│              │     │  │   • Molly persona           │   │
└──────────────┘     │  └────────────┬───────────────┘   │
                     │               │                   │
┌──────────────┐     │  ┌────────────▼───────────────┐   │
│  ElevenLabs  │◄────┼──│   VOICE PIPELINE           │   │
│  Voice API   │     │  │   • Text-to-Speech         │   │
│              │     │  │   • Speech-to-Text         │   │
│              │     │  │   • Real-time streaming    │   │
│              │     │  │   • VAD (turn-taking)      │   │
└──────────────┘     │  └────────────────────────────┘   │
                     │                                   │
                     │  ┌────────────────────────────┐   │
                     │  │   MEMORY SERVICE           │   │
                     │  │   • Extraction pipeline    │   │
                     │  │   • Vector store (recall)  │   │
                     │  │   • Follow-up scheduler    │   │
                     │  │   • User profile store     │   │
                     │  └────────────────────────────┘   │
                     │                                   │
                     │  ┌────────────────────────────┐   │
                     │  │   ANALYTICS ENGINE         │   │
                     │  │   • Sentiment analysis     │   │
                     │  │   • Cognitive metrics       │   │
                     │  │   • Alert detection        │   │
                     │  │   • Acuity scoring         │   │
                     │  └────────────────────────────┘   │
                     │                                   │
                     │  ┌────────────────────────────┐   │
┌──────────────┐     │  │   OUTBOUND CALL SERVICE    │   │
│  Telephony   │◄────┼──│   • Scheduled calls        │   │
│  (Twilio/    │     │  │   • Trigger-based calls    │   │
│   similar)   │     │  │   • Push notifications     │   │
└──────────────┘     │  └────────────────────────────┘   │
                     └──────────────────────────────────┘
                                    │
                     ┌──────────────▼───────────────────┐
                     │      ADMIN DASHBOARD             │
                     │      (Web Application)           │
                     │   • Resident management          │
                     │   • Conversation explorer        │
                     │   • Acuity dashboard             │
                     │   • Alert management             │
                     │   • Reporting                    │
                     └──────────────────────────────────┘
```

### 12.2 Key Technology Choices

| Component | Technology | Rationale |
|-----------|-----------|-----------|
| **Voice synthesis** | ElevenLabs Conversational AI | Best-in-class natural voice, real-time streaming, multiple distinct voice profiles |
| **LLM backbone** | GPT-4o / Claude (evaluation needed) | Strong conversational ability, instruction following, safety |
| **Memory store** | Vector database (Pinecone/Weaviate) + structured DB | Semantic recall for natural conversation + structured data for metrics |
| **Mobile app** | React Native or Flutter | Cross-platform iOS/Android from single codebase |
| **Admin dashboard** | React/Next.js web app | Modern, responsive, real-time updates |
| **Telephony** | Twilio or equivalent | Outbound calling, push notifications |
| **Analytics** | Custom ML pipeline | Sentiment analysis, cognitive metric extraction |
| **Infrastructure** | AWS/GCP | HIPAA-eligible infrastructure for healthcare compliance |

### 12.3 Voice Call Technical Flow

```
User taps "Call Brian"
        │
        ▼
Mobile app opens WebSocket to backend
        │
        ▼
Backend establishes ElevenLabs streaming session
(with Brian's voice profile & conversation context)
        │
        ▼
User speaks → Audio streamed to backend
        │
        ▼
Speech-to-Text (real-time) → Text to LLM
        │
        ▼
LLM generates response (with memory context injected)
        │
        ▼
Response text → ElevenLabs TTS → Audio streamed to user
        │
        ▼
Post-call: Full transcript → Memory extraction pipeline
```

---

## 13. UX & Design Principles

### 13.1 Design Philosophy
The app should feel like a **phone's contact list**, not a tech product. Brian, Gina, and Molly are people in your phone that you call or text.

### 13.2 Home Screen Concept

```
┌───────────────────────────────┐
│  Good morning, Dorothy! ☀️    │
│  Brian wanted to check in     │
│  about David's visit.         │
│                               │
│  ┌─────────────────────────┐  │
│  │  📞  Brian              │  │
│  │  Your companion         │  │
│  │  [Call]  [Chat]         │  │
│  └─────────────────────────┘  │
│                               │
│  ┌─────────────────────────┐  │
│  │  🎮  Gina               │  │
│  │  Fun & games            │  │
│  │  [Call]  [Chat]         │  │
│  └─────────────────────────┘  │
│                               │
│  ┌─────────────────────────┐  │
│  │  📰  Molly              │  │
│  │  News & updates         │  │
│  │  [Call]  [Chat]         │  │
│  └─────────────────────────┘  │
│                               │
│  ┌─────────────────────────┐  │
│  │  Today's Reminders       │  │
│  │  • 9:00 AM - Metformin  │  │
│  │  • 2:00 PM - Dr. Patel  │  │
│  │  • 5:00 PM - Evening meds│  │
│  └─────────────────────────┘  │
│                               │
│  ──────────────────────────── │
│  [Brian]  [Gina]  [Molly]    │
└───────────────────────────────┘
```

### 13.3 Voice Call Screen Concept

```
┌───────────────────────────────┐
│                               │
│                               │
│         ┌───────┐             │
│         │       │             │
│         │ Brian │             │
│         │  😊   │             │
│         └───────┘             │
│                               │
│      Brian                    │
│      12:34                    │
│                               │
│                               │
│                               │
│                               │
│    ┌──────┐     ┌──────┐     │
│    │ Mute │     │ Speaker│    │
│    └──────┘     └──────┘     │
│                               │
│         ┌──────────┐          │
│         │  End Call │          │
│         │    🔴    │          │
│         └──────────┘          │
│                               │
└───────────────────────────────┘
```

### 13.4 Accessibility Requirements
- **Font size:** Minimum 18pt, adjustable up to 32pt
- **Touch targets:** Minimum 48x48dp for all interactive elements
- **Color contrast:** WCAG AAA compliance (7:1 ratio)
- **Voice-first:** Every feature must be fully accessible via voice alone
- **Simple navigation:** Maximum 2 taps to reach any companion
- **No scrolling required** on main screen
- **Haptic feedback** on all button presses
- **High-contrast mode** available

---

## 14. Platform & Distribution

### 14.1 Consumer App
- **iOS:** iPhone 8+ (iOS 15+)
- **Android:** Android 10+
- **Distribution:** App Store and Google Play
- **Size:** Target <100MB

### 14.2 Admin Dashboard
- **Platform:** Web application (responsive)
- **Optimized for:** Desktop and iPad/tablet
- **Browsers:** Chrome, Safari, Edge (latest 2 versions)
- **Authentication:** SSO integration for healthcare facilities (SAML/OIDC)

### 14.3 Distribution Model
- **B2B2C:** Sell to aged care facilities who provision for their residents
- **D2C (Phase 2):** Direct to consumer for independent-living seniors (via family purchase)

---

## 15. Data, Privacy & Compliance

### 15.1 Regulatory Considerations
- **HIPAA compliance** (if operating in US healthcare contexts)
- **SOC 2 Type II** for enterprise trust
- **Australian Privacy Act / Aged Care Quality Standards** (if targeting Australian market)
- **GDPR** (if European expansion)

### 15.2 Consent Framework
- Residents must consent to AI companion usage
- Residents must be informed that conversations may be reviewed by care staff
- Residents must consent to voice recording
- Opt-out must be simple and immediate
- Family/guardian consent for residents with diminished capacity

### 15.3 Data Handling
- All conversations encrypted at rest and in transit
- Conversation transcripts stored with access controls
- Memory data is per-user and isolated
- Admin access is role-based and audited
- Data retention policies configurable per facility
- Right to deletion: All resident data can be permanently deleted

### 15.4 AI Safety
- No medical diagnosis or advice
- No financial advice
- Distress/crisis detection with immediate escalation
- Regular bias audits on conversation quality
- Human review capability for flagged interactions

---

## 16. Success Metrics

### 16.1 Consumer Metrics (Senior Engagement)

| Metric | Target (Month 3) | Target (Month 12) |
|--------|------------------|-------------------|
| Daily active users (% of enrolled) | 40% | 65% |
| Average daily conversation time | 10 min | 20 min |
| Average conversations per week | 4 | 7+ (daily) |
| Voice call vs chat ratio | 60:40 | 70:30 |
| NPS score | 40+ | 60+ |
| Proactive follow-up acknowledgment rate | 50% | 70% |

### 16.2 Clinical Metrics (Admin Dashboard)

| Metric | Target |
|--------|--------|
| Alert detection accuracy (true positive rate) | >85% |
| Time from alert to staff acknowledgment | <4 hours |
| Cognitive baseline establishment time | <14 days |
| Care team weekly dashboard usage | >80% of staff |
| Clinical team satisfaction score | >4.0/5.0 |

### 16.3 Business Metrics

| Metric | Target (Year 1) |
|--------|-----------------|
| Facility partnerships | 10-20 |
| Enrolled residents | 500-1,000 |
| Monthly recurring revenue per resident | TBD |
| Facility renewal rate | >90% |
| Expansion rate (residents added per facility) | >20% per quarter |

---

## 17. Phasing & Roadmap

### Phase 1: Foundation (Months 1-3)
**Goal:** Brian voice + chat, basic memory, basic admin dashboard

- [ ] Brian companion with general conversation capability
- [ ] ElevenLabs voice integration (inbound calls)
- [ ] Chat mode with persistent history
- [ ] Basic long-term memory (extract & recall key facts)
- [ ] Daily routine & medication reminders via Brian
- [ ] Admin dashboard: Resident list, conversation logs, basic sentiment scoring
- [ ] Mobile app (iOS first)
- [ ] Pilot with 1-2 aged care facilities

### Phase 2: Full Companion Suite (Months 3-6)
**Goal:** Gina + Molly, proactive calls, cognitive tracking

- [ ] Gina companion (trivia, games, activities)
- [ ] Molly companion (news, current events)
- [ ] Proactive outbound calls from Brian
- [ ] Advanced memory with follow-up scheduling engine
- [ ] Mental acuity scoring dashboard
- [ ] Alert system (critical, warning, info levels)
- [ ] Android app launch
- [ ] Cognitive metrics tracking and trend visualization

### Phase 3: Clinical Grade (Months 6-9)
**Goal:** Robust analytics, compliance, scale

- [ ] Refined acuity scoring with clinical validation
- [ ] Facility-wide analytics and reporting
- [ ] HIPAA/compliance certifications
- [ ] SSO and enterprise admin features
- [ ] Family member portal (lite view)
- [ ] Multi-facility management
- [ ] API for integration with existing care management systems

### Phase 4: Scale & Expand (Months 9-12+)
**Goal:** Market expansion, advanced features

- [ ] Social features (multiplayer games via Gina)
- [ ] Wearable integration (health data → Brian's context)
- [ ] Multilingual support
- [ ] D2C distribution channel
- [ ] Advanced predictive models for cognitive decline
- [ ] Integration with telehealth platforms

---

## 18. Open Questions

| # | Question | Impact | Status |
|---|----------|--------|--------|
| 1 | **Product name?** | Branding, domain, app listing | Open |
| 2 | **Pricing model?** Per-resident/month? Tiered by feature? | Revenue, sales strategy | Open |
| 3 | **Target market geography?** US, Australia, UK? | Compliance, localization | Open |
| 4 | **LLM provider selection?** OpenAI vs Anthropic vs open-source | Cost, quality, compliance | Needs evaluation |
| 5 | **Consent model for care team review of conversations?** | Legal, trust, adoption | Needs legal review |
| 6 | **Should voice calls work via phone (telephony) or only in-app?** | Accessibility, cost, tech complexity | Open |
| 7 | **How much clinical validation is needed before marketing acuity scores?** | Regulatory risk, credibility | Needs clinical advisor |
| 8 | **Family member access - how much visibility into conversations?** | Privacy, value, complexity | Phase 2 decision |
| 9 | **Should Brian's voice be customizable per user or fixed?** | Personalization vs consistency | Open |
| 10 | **Offline mode - any capabilities when no internet?** | Accessibility for some facilities | Open |

---

*This PRD is a living document. Last updated: February 23, 2026.*
