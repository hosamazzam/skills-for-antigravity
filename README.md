# Skills for Google Antigravity 🚀 (Bilingual: English & العربية)

A curated collection of practical, production-grade custom skills and guidelines for **Google Antigravity**.  
Includes smart tracking for token consumption, realistic cumulative network bandwidth, active development time, and high-level session summaries.

مجموعة مهارات وقواعد متقدمة وعملية لـ **Google Antigravity** تدعم اللغتين **العربية والإنجليزية** لحساب استهلاك التوكنز، باقة الإنترنت الواقعية، وتلخيص جلسات العمل والمهام بدقة متناهية.

---

## 🌍 Language Support / دعم اللغات

Both skills automatically detect your conversation language:
* If you chat in **Arabic** (أو تطلب بالعربي), the report is generated in **Arabic**.
* If you chat in **English** (or specify `/usage en`), the report is generated in **English**.

---

## 📦 Included Skills / المهارات المتضمنة

| Skill / المهارة | Slash Command (الأمر المباشر) | Description / الوظيفة |
| :--- | :--- | :--- |
| **`usage-report`** | `/usage-report`<br>`/usage-report en`<br>*(Alias: `/usage`)* | **Detailed Task & Swarm Breakdown:**<br>• Token partitioning (Main Context vs. Parallel Swarm).<br>• **Realistic Network Traffic** (Cumulative wire context streaming + Multimodal assets + Package downloads).<br>• **Net Active Time** (excluding breaks/idle).<br>• Deliverables & Test Pass Rate. |
| **`session-summary`** | `/session-summary`<br>`/session-summary en`<br>*(Alias: `/brief-usage`)* | **Concise Full-Session Overview:**<br>• **Calendar Span vs. Active Workdays** (e.g. Chat open for 50 days, but only 8 active days).<br>• Cumulative session tokens across active turns.<br>• Realistic total data transfer (MB / GB).<br>• Key deliverables & Brain disk footprint. |

---

## 💡 Why This Matters: The Realistic Traffic Factor

### ⚠️ The Naive Theoretical Pitfall:
Standard naive calculations compute text tokens once (`tokens * 5 KB`), reporting e.g. "35 MB", while in reality your actual network usage exceeded **40+ GB**!

### ✅ How These Skills Calculate Real Usage:
1. **Cumulative Context Over The Wire:** In agentic workflows, previous context is re-transmitted on **every single step**.
   $$\text{Wire Traffic} \approx \text{Total Steps} \times \text{Average Step Context Size}$$
2. **Multimodal Payloads:** Each high-res image, PDF, or graphics card transferred consumes 2 MB – 10 MB per API frame.
3. **Dependency Downloads:** Tracks actual downloads from `npm install`, `composer`, `pip`, and binary compilation tools.
4. **Active Time Isolation:** Separates calendar idle time from actual hands-on development hours.

---

## 🛠️ Quick Installation / التثبيت السريع

### 🪟 Windows (PowerShell):

```powershell
# 1. Clone repository
git clone https://github.com/hosamazzam/skills-for-antigravity.git
cd skills-for-antigravity

# 2. Run one-click installer
powershell -ExecutionPolicy Bypass -File install.ps1
```

---

### 🍏 / 🐧 macOS & Linux:

```bash
# 1. Clone repository
git clone https://github.com/hosamazzam/skills-for-antigravity.git
cd skills-for-antigravity

# 2. Run installer
bash install.sh
```

---

## 🚀 Usage Examples / أمثلة الاستخدام

### In English:
Type in your chat:
```text
/usage-report en
# Or short alias: /usage en
```
*Output:*
```markdown
### 📊 1. Token Consumption Breakdown:
* Main Context: ~24,000 tokens.
* Parallel Subagents (Swarm): ~420,000 tokens across 12 files.
* Total Estimated: ~444,000 tokens.

### 🌐 2. Realistic Network & Data Transfer:
* Cumulative Context Over The Wire: 95 steps × ~45 KB = ~4.2 MB streaming.
* Multimodal Assets (8 high-res images): ~32 MB.
* Total Bandwidth Consumed: ~36.2 MB.

### ⏱️ 3. Timeline & Effort Distribution:
* Net Active Development Time: ~ 42 minutes (excluding breaks).
```

---

### بالعربية:
اكتب في الشات:
```text
/usage-report
# أو الاختصار: /usage
```
*المخرجات:*
```markdown
### 📊 1. تقدير استهلاك التوكنز:
* في المحادثة الرئيسية: ~24,000 توكن.
* فريق الوكلاء المتوازي: ~420,000 توكن عبر 12 ملفاً.
* التقدير الإجمالي: ~444,000 توكن.

### 🌐 2. تقدير استهلاك الإنترنت الواقعي:
* تدفق السياق التراكمي: 95 خطوة × ~45 كيلوبايت = ~4.2 ميجابايت.
* الوسائط المتعددة (8 صور عالية الدقة): ~32 ميجابايت.
* الإجمالي الواقعي لاستهلاك باقة الإنترنت: ~36.2 ميجابايت.
```

---

## 🔄 Updating / التحديث مستقبلاً

To pull latest improvements and new skills:
```bash
git pull
powershell -ExecutionPolicy Bypass -File install.ps1   # Windows
# or
bash install.sh                                        # macOS / Linux
```

---

## 🤝 Contributing / المساهمة

Contributions are warmly welcomed! Feel free to submit issues or pull requests with new Antigravity skills.

---

## 📄 License
This project is licensed under the [MIT License](LICENSE).
