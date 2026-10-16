# Global Agent Rules & Guidelines (Bilingual: AR / EN)

## Slash Commands: `/usage-report` (Primary) or `/usage` (Alias)

Whenever the user inputs `/usage-report` (or `/usage`), with optional `en` flag (e.g. `/usage-report en` or `/usage en`), or requests a detailed token/context breakdown for a task:
The agent MUST generate the standardized **Usage & Token Consumption Report** (`usage-report`) in the user's preferred language (Arabic if prompting in Arabic, English otherwise) covering:

1. **Token Consumption Breakdown:**
   - Main Context (prompts, plans, tool commands).
   - Parallel Subagents / Swarm (codebase reading, file editing, automated tests).
   - Total estimated token range.
2. **Realistic Network & Data Transfer:**
   - **Avoid flat, single-pass text calculations.** Account for cumulative context streaming over the wire (Total Steps × Average Step Context Size).
   - Multimodal Assets (high-res images, PDFs, generated media ~2-10 MB each).
   - Package manager downloads (npm, pip, composer, binaries).
   - Realistic total bandwidth consumed (MB or GB).
3. **Timeline & Effort Distribution:**
   - Start timestamp, end timestamp, and net active development time in minutes/hours.
   - Phase breakdown (Discovery & Architecture -> Implementation -> Verification & Tests).
4. **Technical Deliverables:**
   - Modified and created files, plus automated test suite results.

---

## Slash Command: `/session-summary` or `/brief-usage` (Realistic Whole-Chat Overview)

Whenever the user inputs `/session-summary`, `/brief-usage`, or asks for a summary of the entire chat:
The agent MUST output a realistic summary card (`session-summary`) in the user's language covering:

1. **Accurate Time Separation:**
   - **Calendar Span:** Days elapsed since conversation creation (e.g. "52 calendar days").
   - **Active Workdays:** Count of unique dates with actual coding activities (e.g. "8 active workdays").
   - **Net Active Hours:** Direct hands-on development time excluding idle gaps.
2. **Cumulative Token Consumption:** Total context tokens processed across all active steps.
3. **Realistic Network Bandwidth:**
   - Cumulative wire transfer + multimodal media payloads + package downloads (in MB/GB).
   - Inspect the session brain directory (`$brainDir`) for on-disk footprint when appropriate.
4. **Key Accomplishments:** Concise bullet points highlighting major achievements.
