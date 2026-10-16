---
name: usage-report
description: >-
  Generates a comprehensive token consumption, realistic internet data transfer, and task execution breakdown report
  (Token Consumption, Real Network/Bandwidth Traffic, Execution Timeline, and Technical Deliverables).
  Trigger whenever the user types `/usage`, asks for usage statistics, token estimates, internet/data consumption,
  or requests a victory / completion report after a task or agent swarm execution.
---

# Usage & Token Consumption Reporting Skill

Use this skill whenever the user types `/usage` or requests a detailed report on token consumption, internet bandwidth usage, execution timeline, and deliverable metrics.

## Guidelines for Generating the Report

When invoked with `/usage` or after a completed task upon request, analyze the current conversation (and any subagents/tasks executed in this session) and produce a structured report using this standard template:

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

## Realistic Network Calculation Heuristics:
1. **Never quote the single-pass raw text figure alone.** Explain both the raw text footprint and the cumulative wire reality.
2. **Formula for Cumulative Wire Traffic:**
   $$\text{Network Wire Traffic} \approx \text{Turn/Step Count} \times \text{Average Step Context Size (KB)} + \text{Multimodal Transfer} + \text{Downloads}$$
3. **Multimodal Factor:**
   - Generated images (`generate_image`) and high-res uploaded media: ~2 MB - 10 MB per image transferred over API/wire.
4. **Inspecting Disk When Relevant:**
   - You may run a quick PowerShell check on `$brainDir` or workspace to check real size of media and assets.
