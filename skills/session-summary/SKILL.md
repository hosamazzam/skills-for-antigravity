---
name: session-summary
description: >-
  Provides a realistic, high-level summary of the entire chat session from its beginning up to the current moment.
  Distinguishes between total calendar span (e.g. 52 days) and actual active workdays / active hours.
  Accurately calculates total tokens, realistic internet/bandwidth consumption
  (factoring in cumulative context re-transmission, multimodal media/images, and package downloads), and key deliverables.
  Trigger whenever the user types `/session-summary`, `/brief-usage`, or asks for an overall summary of the whole chat session.
---

# Session Summary & Quick Realistic Usage Skill

Use this skill whenever the user types `/session-summary`, `/brief-usage`, or requests a realistic summary of the entire conversation session.

## Guidelines for Generating the Summary

When invoked, the agent should examine the conversation history and transcript (`<appDataDir>\brain\<conversation-id>\.system_generated\logs\transcript.jsonl`) to distinguish between the **calendar span** (days the chat stayed open) and **actual active working days/hours**, avoiding misleading flat-time claims:

```markdown
### ⚡ ملخص الجلسة الشامل والواقعي (Session Overview):

* ⏱️ **توزيع الوقت والنشاط الحقيقي:**
  * 📅 **المدى التقويمي للجلسة (Calendar Span):** من [تاريخ البداية] إلى [اليوم] (~[X] يوماً تقويمياً منذ إنشاء الشات).
  * 🔨 **أيام العمل الفعلية النشطة (Active Workdays):** ~[عدد] أيام عمل فعلية فقط (الأيام التي شهدت رسائل وأوامر برمجية).
  * ⏳ **صافي ساعات العمل المباشرة (Net Active Hours):** ~[عدد] ساعات عمل وتطوير نشطة (مع استبعاد فترات الخمول والتوقف الطويلة).

* 🪙 **إجمالي التوكنز المتراكمة (Total Context Tokens):** ~ [الرقم الإجمالي للتوكنز عبر كافة الخطوات النشطة].
* 🌐 **استهلاك الإنترنت الواقعي والفعلي (Actual Network Traffic):** ~ [الرقم الإجمالي بالـ MB أو GB]
  * 🔄 **إعادة إرسال السياق التراكمي (Cumulative Context Over The Wire):** [العدد] خطوة × متوسط سياق الطلب = ~[X] MB/GB.
  * 🖼️ **الوسائط والصور والملفات (Multimodal & Media Assets):** ~[X] MB/GB ([عدد] صورة/ملف تم توليدها أو رفعها).
  * 📦 **تنزيلات الحزم والمكتبات (Dependencies & Packages):** ~[X] MB/GB (npm / composer / pip / git إن وُجدت).
* 💬 **عدد الخطوات والعمليات المنفذة:** [عدد الخطوات الإجمالي المسجل في الجلسة].

---

### 📌 ملخص الإنجاز السريع (Key Accomplishments):
* **المهام الرئيسية:** [أهم ما تم إنجازه بنقاط محددة وموجزة].
* **الملفات المستقرة والمعدلة:** [عدد الملفات أو أهم المسارات].
* **حجم ملفات الجلسة على القرص (Brain Footprint):** ~[حجم مجلد الجلسة على الهارد].
```

## Calculation Heuristics:
1. **Active Time vs. Calendar Span:**
   - **Calendar Span:** Days between the first step timestamp and the current time.
   - **Active Workdays:** Count the unique dates (`YYYY-MM-DD`) in `transcript.jsonl` where user messages or tool calls took place. If a chat is open for 50 days but messages were only sent across 8 separate days, report "50 calendar days, 8 active workdays".
   - **Net Active Hours:** Sum durations of active work bursts (grouping steps where the gap between consecutive steps is under 45-60 minutes).
2. **Never quote the single-pass flat text figure (`tokens * 5 KB`) alone:**
   - Always report cumulative wire traffic:
     $$\text{Cumulative Context Wire Traffic} \approx \text{Total Steps} \times \text{Average Step Context Size (in KB)}$$
3. **Multimodal & Media:**
   - High-res images, camera raw files, 300 DPI exports, PDFs, and generated images consume ~2 MB - 10 MB per image transferred over API frames.
4. **Quick Telemetry Inspection:**
   - The agent can run a quick command on the session brain directory to check real media count, disk size, and transcript timestamps when appropriate.
