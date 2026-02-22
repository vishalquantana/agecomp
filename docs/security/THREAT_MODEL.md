# Security Threat Model (STRIDE Analysis)

**Last Updated:** 2026-02-23
**Methodology:** STRIDE (Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege)

---

## System Boundaries

```
                    ┌─────────────────────────────────────────┐
                    │           TRUST BOUNDARY                │
                    │                                         │
  [Senior User]────┼──► Mobile App ──► Backend API ──►       │
                    │                     │    │              │
                    │                     │    ├──► Gemini API│ (External)
                    │                     │    ├──► ElevenLabs│ (External)
                    │                     │    ├──► Database  │
                    │                     │    └──► Vector DB │
                    │                                         │
  [Admin User]─────┼──► Admin Dashboard ──► Backend API      │
                    │                                         │
  [Super Admin]────┼──► Super Admin Dashboard ──► Backend API│
                    │                                         │
                    └─────────────────────────────────────────┘
```

---

## Threat Analysis by Component

### 1. Mobile App (Flutter)

| Threat | Category | Severity | Mitigation |
|--------|----------|----------|------------|
| Attacker impersonates a senior user | Spoofing | High | JWT authentication, device binding, biometric option |
| Modified app sends malicious input to API | Tampering | High | Certificate pinning, input validation on server |
| User denies sending a message | Repudiation | Low | Immutable audit log on server |
| Conversation data leaked from device | Info Disclosure | Critical | Encrypted local storage, no plaintext caching |
| App crashes under heavy use | DoS | Medium | Rate limiting, graceful degradation |
| Privilege escalation to admin functions | EoP | High | Server-side RBAC enforcement, no admin paths in mobile app |

### 2. Backend API

| Threat | Category | Severity | Mitigation |
|--------|----------|----------|------------|
| API called with stolen JWT | Spoofing | High | Short-lived tokens, refresh rotation, token revocation |
| SQL injection in API parameters | Tampering | Critical | Parameterized queries, ORM usage, input sanitization |
| Unauthorized data modification | Tampering | High | Server-side validation, RBAC checks on every endpoint |
| API errors leak internal details | Info Disclosure | Medium | Generic error responses, structured logging |
| Brute force authentication | DoS | High | Rate limiting, account lockout, CAPTCHA |
| Regular user accesses admin endpoints | EoP | Critical | Middleware RBAC, role verification per request |

### 3. Voice Pipeline (ElevenLabs)

| Threat | Category | Severity | Mitigation |
|--------|----------|----------|------------|
| Man-in-the-middle on voice stream | Info Disclosure | Critical | TLS 1.3 for all WebSocket connections |
| Voice recording accessed by unauthorized party | Info Disclosure | Critical | Encryption at rest, RBAC for transcript access |
| Prompt injection via voice input | Tampering | High | Input sanitization, LLM guardrails, system prompt protection |
| Voice call floods backend | DoS | Medium | Concurrent call limits, queue management |

### 4. LLM Integration (Gemini)

| Threat | Category | Severity | Mitigation |
|--------|----------|----------|------------|
| Prompt injection to bypass safety | Tampering | Critical | System prompt hardening, input/output filtering, safety layer |
| LLM generates harmful content | Info Disclosure | High | Output filtering, content safety classifier, guardrails |
| Memory poisoning via crafted input | Tampering | High | Memory extraction validation, anomaly detection |
| LLM API key exposure | Info Disclosure | Critical | Server-side only, never in client, key rotation |

### 5. Database & Memory Store

| Threat | Category | Severity | Mitigation |
|--------|----------|----------|------------|
| Unauthorized database access | Info Disclosure | Critical | Network isolation, encryption at rest (AES-256) |
| Cross-tenant data leakage | Info Disclosure | Critical | Tenant isolation, row-level security, query scoping |
| Memory store corruption | Tampering | High | Backup/restore, integrity checks, versioning |
| Database backup theft | Info Disclosure | High | Encrypted backups, secure storage, access logging |

### 6. Admin Dashboard

| Threat | Category | Severity | Mitigation |
|--------|----------|----------|------------|
| Session hijacking | Spoofing | High | HttpOnly cookies, SameSite, CSRF tokens |
| XSS in conversation transcripts | Tampering | High | Output encoding, CSP headers, sanitized rendering |
| Admin impersonation | Spoofing | Critical | MFA, SSO integration, session management |
| Unauthorized report export | Info Disclosure | High | RBAC on exports, audit logging, watermarking |

---

## HIPAA-Specific Threats

| Requirement | Threat | Control |
|-------------|--------|---------|
| Access Controls (§164.312(a)) | Unauthorized access to ePHI | RBAC, MFA, unique user IDs, automatic logoff |
| Audit Controls (§164.312(b)) | Undetected unauthorized access | Comprehensive audit logging, log integrity, monitoring |
| Integrity Controls (§164.312(c)) | Unauthorized ePHI modification | Hash verification, database constraints, change tracking |
| Transmission Security (§164.312(e)) | Interception in transit | TLS 1.3, certificate pinning, encrypted WebSocket |
| Encryption (§164.312(a)(2)(iv)) | Data breach exposure | AES-256 at rest, TLS 1.3 in transit |

---

## Risk Priority Matrix

| Risk Level | Count | Immediate Actions Required |
|------------|-------|---------------------------|
| Critical | 7 | Implement before any production deployment |
| High | 9 | Implement in Phase 1 |
| Medium | 3 | Implement by Phase 2 |
| Low | 1 | Implement as part of ongoing hardening |

---

## Implementation Priority (Phase 1)

1. **Authentication & Authorization** - JWT with RBAC, server-side enforcement
2. **Input Validation** - All API endpoints, parameterized queries
3. **Encryption** - TLS 1.3 in transit, AES-256 at rest
4. **Audit Logging** - All ePHI access logged with timestamps and user IDs
5. **API Security** - Rate limiting, CORS, security headers
6. **LLM Safety** - Prompt injection defense, output filtering
7. **Tenant Isolation** - Database-level isolation between facilities

*This threat model will be updated as the system architecture evolves.*
