# Global Agent Rules & Guidelines

## Slash Command: `/usage` (Detailed Task & Realistic Usage Reporting)

Whenever the user inputs `/usage` or requests a detailed token/context breakdown for a task:
The agent MUST generate the standardized **Usage & Token Consumption Report** (`usage-report`) covering:

1. **تقدير استهلاك التوكنز (Token Consumption):**
   - المحادثة الرئيسية (Main Context).
   - فريق الوكلاء المتوازي والعمليات الخلفية (Subagents / Tool outputs).
   - الإجمالي التقديري للتوكنز.
2. **تقدير استهلاك الإنترنت الواقعي (Realistic Network & Data Transfer):**
   - **تجنب الحساب النظري السطحي (الذي يحسب النص لمرة واحدة فقط):** يجب مراعاة النقل التراكمي للسياق عبر كافة الخطوات (Cumulative Wire Transfer = عدد الخطوات × متوسط سياق الطلب).
   - استهلاك الوسائط المتعددة والصور المولدة/المرفوعة (Multimodal Payloads ~ 2-10 MB لكل صورة).
   - تنزيلات الحزم والمكتبات عبر الطرفية (npm, pip, composer, binaries).
   - الإجمالي الواقعي لاستهلاك باقة الإنترنت (بالـ MB أو GB).
3. **التوقيت وتوزيع الجهد (Timeline & Distribution):**
   - وقت البداية، وقت الانتهاء، وإجمالي المدة بالدقائق (صافي وقت العمل النشط الفعلي).
   - توزيع الوقت على المراحل (المسح والمعمارية -> التطوير -> التدقيق والاختبار).
4. **ملخص الإنجاز الفني (Technical Deliverables):**
   - الملفات المنشأة أو المعدلة ونتائج الاختبارات.

---

## Slash Command: `/session-summary` أو `/brief-usage` (Realistic Whole-Chat Overview)

Whenever the user inputs `/session-summary`, `/brief-usage`, or asks for a summary of the entire chat from start to finish:
The agent MUST immediately output a realistic summary card (`session-summary`) covering:

1. **التمييز الدقيق بين المدى التقويمي والنشاط الفعلي:**
   - **المدى التقويمي (Calendar Span):** عدد الأيام منذ إنشاء الشات (مثلاً: "52 يوماً تقويمياً").
   - **أيام العمل الفعلية (Active Workdays):** عدد الأيام الفريدة التي شهدت إرسال رسائل وتنفيذ مهام برمجية بالفعل (مثلاً: "10 أيام عمل نشطة فقط").
   - **صافي ساعات العمل المباشرة (Net Active Hours):** استبعاد فترات الخمول والتوقف الطويلة.
2. **إجمالي التوكنز المتراكمة في الشات:** السياق التراكمي ومخرجات الأدوات المرتبطة بأيام العمل النشطة.
3. **استهلاك الإنترنت الواقعي والفعلي:**
   - الحساب التراكمي للخطوات (Cumulative Context Re-transmission) + الصور والوسائط + تنزيلات الحزم (بالـ MB / GB).
   - يمكن للوكيل فحص مجلد الجلسة (`$brainDir`) للتحقق من الحجم الفعلي للملفات والوسائط على القرص الصلب.
4. **ملخص الإنجاز السريع:** أهم ما تم إنجازه باختصار شديد في نقاط سريعة.
