---
name: usage-report
description: >-
  Generates a comprehensive token consumption, realistic internet data transfer, and task execution breakdown report
  in either Arabic or English based on user preference.
  (Token Consumption, Real Network/Bandwidth Traffic, Execution Timeline, and Technical Deliverables).
  Trigger whenever the user types `/usage`, asks for usage statistics, token estimates, internet/data consumption,
  or requests a victory / completion report after a task or agent swarm execution.
---

# Usage & Token Consumption Reporting Skill (Bilingual: AR / EN)

Use this skill whenever the user types `/usage` or requests a detailed report on token consumption, internet bandwidth usage, execution timeline, and deliverable metrics.

## Language Selection
- **Auto-Detection:** If the user's prompt or conversation is primarily Arabic, respond with the **Arabic Template**.
- If the conversation is in English or the user specifies English (e.g., `/usage en`), respond with the **English Template**.

---

## 🇸🇦 1. Arabic Template (النموذج العربي)

```markdown
### 📊 1. تقدير استهلاك التوكنز (Token Consumption):

* **في المحادثة الرئيسية (Main Context):**
  * استهلاك المدخلات، مسودة الخطة، أوامر التشغيل وتحديثات الحالة: ~[تقدير المدخلات والمخرجات للـ Main Agent] توكن.
* **فريق الوكلاء المتوازي / العمليات الفرعية (Agent Swarm / Subagents) [إن وجد]:**
  * قراءة وفحص بنية الكود والمشروع: ~[تقدير توكنز القراءة] توكن.
  * كتابة وتعديل الملفات ([عدد] ملفات، ~[عدد] سطر كود): ~[تقدير توكنز التعديل] توكن.
  * تشغيل الاختبارات الآلية والتدقيق (Testing & Audit): ~[تقدير توكنز الفحص] توكن.
* **التقدير الإجمالي لاستهلاك التوكنز:** يترواح تقريباً بين [الحد الأدنى] إلى [الحد الأقصى] توكن إجمالاً.

---

### 🌐 2. تقدير استهلاك الإنترنت الواقعي (Realistic Network & Data Transfer):

* **إعادة إرسال السياق التراكمي للنموذج (Cumulative Context Over The Wire):**
  * تدفق السياق عبر الخطوات ([عدد الخطوات] خطوة × متوسط سياق الطلب): ~[حجم البيانات بالـ MB أو GB].
* **الوسائط المتعددة والصور المولدة/المرفوعة (Multimodal Assets):**
  * رفع/توليد ونقل ملفات الصور والمستندات ([عدد الصور إن وُجدت] صورة): ~[حجم الوسائط بالـ MB أو GB].
* **تنزيل الحزم والمكتبات الخارجية (External Packages & Downloads):**
  * تنزيلات عبر الطرفية (npm / composer / pip / git / binaries): ~[حجم التنزيلات بالـ MB أو GB].
* **الإجمالي الواقعي لاستهلاك باقة الإنترنت:** ~[إجمالي حجم الترافيك الواقعي بالـ MB أو GB].

---

### ⏱️ 3. التوقيت وتوزيع الجهد (Timeline & Distribution):

* **لحظة الإطلاق والتوزيع:** [توقيت البداية بالتوقيت المحلي]
* **لحظة إنهاء العمل والتدقيق النهائي (Victory Report):** [توقيت الانتهاء]
* **صافي وقت العمل الفعلي (Net Active Time):** ~ [المدة بالدقائق/الساعات] (مع استبعاد فترات الخمول أو التوقف بين الجلسات).

**🔍 تفصيل المراحل الزمنية:**
* **المسح والتخطيط المعماري (Discovery & Architecture):** ~ [المدة] دقيقة
* **التطوير البرمجي الفعلي (Implementation):** ~ [المدة] دقيقة
* **التدقيق والمراجعات والاختبارات (Audit & Verification):** ~ [المدة] دقيقة

---

### 📁 4. ملخص الإنجاز الفني (Technical Deliverables):
* **الملفات المنشأة والمُعدّلة:** [قائمة بأهم الملفات وعدد الأسطر]
* **حزم الاختبارات وفحص الأنواع:** [حالة الـ TypeScript / Unit Tests ونسبة النجاح]
```

---

## 🇬🇧 2. English Template

```markdown
### 📊 1. Token Consumption Breakdown:

* **Main Context:**
  * Prompts, plan drafts, tool commands & status updates: ~[Estimate] tokens.
* **Parallel Subagents / Swarm [if any]:**
  * Architecture discovery & codebase inspection: ~[Estimate] tokens.
  * Writing & editing files ([X] files, ~[X] LOC): ~[Estimate] tokens.
  * Automated testing, audits & adversarial runs: ~[Estimate] tokens.
* **Total Estimated Token Consumption:** Approximately [Min] to [Max] tokens.

---

### 🌐 2. Realistic Network & Data Transfer:

* **Cumulative Context Over The Wire:**
  * Streaming context across turns ([X] steps × average step context): ~[X] MB/GB.
* **Multimodal Assets & Media Transfers:**
  * High-res images, PDFs, generated assets ([X] media files): ~[X] MB/GB.
* **Package Downloads & External Dependencies:**
  * Terminal packages (npm, pip, composer, binaries): ~[X] MB/GB.
* **Realistic Total Bandwidth Consumed:** ~[X] MB/GB.

---

### ⏱️ 3. Timeline & Effort Distribution:

* **Task Launch & Dispatch:** [Local Start Time]
* **Completion & Verification (Victory Report):** [End Time]
* **Net Active Development Time:** ~ [X] minutes/hours (excluding idle periods).

**🔍 Phase Breakdown:**
* **Discovery & Architecture:** ~ [X] mins
* **Implementation & Coding:** ~ [X] mins
* **Audit, Verification & Tests:** ~ [X] mins

---

### 📁 4. Technical Deliverables:
* **Created & Modified Files:** [List of primary files and LOC]
* **Automated Test Suites & Typechecks:** [TypeScript / Unit test status and pass rate]
```

## Calculation Heuristics
1. **Never quote the single-pass flat text figure alone.** Always provide realistic cumulative wire traffic.
2. **Formula:** $\text{Wire Traffic} \approx \text{Turn Count} \times \text{Average Step Context Size} + \text{Multimodal Transfer} + \text{Downloads}$.
3. **Net Active Time:** Isolate genuine active periods from long idle gaps.
