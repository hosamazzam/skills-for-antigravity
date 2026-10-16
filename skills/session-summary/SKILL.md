---
name: session-summary
description: >-
  Provides a realistic, high-level summary of the entire chat session from its beginning up to the current moment
  in either Arabic or English based on user preference.
  Distinguishes between total calendar span (e.g. 52 days) and actual active workdays / active hours.
  Accurately calculates total tokens, realistic internet/bandwidth consumption
  (factoring in cumulative context re-transmission, multimodal media/images, and package downloads), and key deliverables.
  Trigger whenever the user types `/session-summary`, `/brief-usage`, or asks for an overall summary of the whole chat session.
---

# Session Summary & Quick Realistic Usage Skill (Bilingual: AR / EN)

Use this skill whenever the user types `/session-summary`, `/brief-usage`, or requests a realistic summary of the entire conversation session.

## Language Selection
- **Auto-Detection:** If the user's prompt or conversation is primarily Arabic, respond with the **Arabic Template**.
- If the conversation is in English or the user specifies English (e.g., `/session-summary en`), respond with the **English Template**.

---

## 🇸🇦 1. Arabic Template (النموذج العربي)

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

---

## 🇬🇧 2. English Template

```markdown
### ⚡ Realistic Session Overview:

* ⏱️ **Time & Activity Distribution:**
  * 📅 **Calendar Span:** From [Start Date] to [Today] (~[X] calendar days since chat creation).
  * 🔨 **Active Workdays:** ~[X] active working days only (days with actual prompts & code modifications).
  * ⏳ **Net Active Hours:** ~[X] hours of direct active development (excluding idle/offline gaps).

* 🪙 **Total Cumulative Context Tokens:** ~ [X] tokens across all active steps.
* 🌐 **Realistic Network Traffic (Bandwidth):** ~ [X] MB/GB
  * 🔄 **Cumulative Context Over The Wire:** [X] steps × average request context = ~[X] MB/GB.
  * 🖼️ **Multimodal & Media Assets:** ~[X] MB/GB ([X] media files generated or uploaded).
  * 📦 **Dependencies & Package Downloads:** ~[X] MB/GB (npm / composer / pip / git if applicable).
* 💬 **Total Executed Operations & Steps:** [Total steps recorded in session].

---

### 📌 Key Accomplishments:
* **Core Deliverables:** [Concise bullet points summarizing what was built].
* **Files Affected & Modified:** [File count or key paths].
* **Session Brain Disk Footprint:** ~[Directory size on disk].
```

## Calculation Heuristics
1. **Calendar Span vs Active Days:** Group `transcript.jsonl` step timestamps by unique calendar dates (`YYYY-MM-DD`). Distinguish between calendar lifetime and active days.
2. **Net Active Hours:** Combine consecutive steps within 45-60 min intervals into active work bursts.
3. **Cumulative Traffic:** Multiply total steps by average step context payload.
