# AuraHarmonic ── 互動式身心療癒與聲學合成儀
### (Natural Healing Consultant AI Skill & Acoustic Synthesizer Web App)

專案整合了 **AI 自然療癒顧問諮詢技能 (AI Skill)** 與 **互動式聲學共振療癒 Web 應用程式 (AuraHarmonic Web App)**，提供從身心對應探索、根源信念分析，到個人化索爾費吉歐頻率 (Solfeggio Frequencies) 聲學共振、雙耳節拍 (Binaural Beats) 與 4-7-8 呼吸引導的完整療癒系統。

---

## 🌟 核心功能與特色

### 1. 🤖 AI 自然療癒顧問技能 (Natural Healing Consultant AI Skill)
位於 `.agents/skills/natural_healing_consultant/`，提供結構化的六階段全人身心諮詢工作流程：
1. **溫暖開場與建立安全感 (Welcome & Safe Space)**：建立同理傾聽氛圍與諮詢界限。
2. **全人狀態探索 (Holistic Exploration)**：細緻了解生理不適、情緒起伏與生活作息。
3. **身心連結與情緒覺察 (Mind-Body & Emotional Connection)**：對應身體各器官部位的心靈警訊。
4. **核心課題與根源追溯 (Root Cause Analysis)**：引導辨識深層信念模式（過度掌控、害怕衝突、討好型人格等）。
5. **個人化自然療癒方案 (Empathetic Recommendation)**：
   * 索爾費吉歐頻率聲波調頻建議
   * 雙耳節拍腦波夾帶 (Alpha / Theta / Delta)
   * 巴哈花精 (Bach Flower Remedies)
   * 芳香療法 (Aromatherapy) 精油配方
   * 草本茶飲 (Herbal Teas)
   * 正念呼吸引導與日常儀式
6. **整合與後續關懷 (Integration & Follow-up)**：生成結構化《個人身心療癒分析報告 (Holistic Wellness Report)》。

#### 📚 支援資料庫 (Resources)
* `mind_body_mapping.md`：頭部、頸喉、胸腔心肺、消化胃腸、脊椎背部、關節四肢、皮膚之身心對應與情緒對照庫。
* `media_remedies_library.md`：396Hz ~ 852Hz 索爾費吉歐頻率、雙耳節拍、4-7-8 呼吸動畫與本機合成器播放規格。
* `natural_remedies_library.md`：急救花精、溝酸漿、落葉松等巴哈花精，真正薰衣草、乳香、洋甘菊等芳療精油，草本茶與接地練習。
* `consultation_summary_template.md`：個人化身心療癒建議報告 Markdown 排版模板。

---

### 2. 🎵 AuraHarmonic Web App (互動式聲學合成儀)
以 Web Audio API 實現的純淨無損聲學合成器與視覺化療癒介面：
* **純淨正弦波頻率合成**：支援 396Hz (海底輪)、417Hz (本我輪)、528Hz (太陽輪/奇蹟修復)、639Hz (心輪)、741Hz (喉輪)、852Hz (眉心輪) 等經典頻率，亦支援自訂頻率與微調。
* **雙耳節拍 (Binaural Beats)**：雙耳耳機立體聲相位差技術，支援 Alpha (放鬆專注)、Theta (深層冥想/潛意識)、Delta (深睡修復)。
* **4-7-8 精確視覺化呼吸儀**：
  * 外圍 SVG 圓形發光進度環（吸氣 4 秒滿環、屏息 7 秒定格、吐氣 8 秒倒退歸零）。
  * 球心即時階段提示與秒數倒數。
  * 動態雙層能量共振漣漪動畫 (60 FPS)。
* **溫馨暗底與奶茶暖卡片視覺設計**：
  * 護眼暗可可漸層背景 (`#4A3E3B` ➔ `#3E3532`)。
  * 92% 透光暖奶油白卡片與溫潤奶茶色輸入框 (`#F2E8DC`)。
  * 5% 對角淡雅吉祥蓮花曼陀羅與植物枝椏浮水印。
* **Safari / Chrome 自動播放相容**：內建 Web Audio Context 解鎖機制與定時自動關閉。
* **身心關鍵字語意比對**：輸入自述困擾，自動推薦對應之脈輪、頻率、情緒課題與每日肯定句。

---

## 📂 專案目錄結構

```text
auraharmonics/
├── .agents/
│   └── skills/
│       └── natural_healing_consultant/
│           ├── SKILL.md                          # AI 顧問核心 Prompt 指引
│           └── resources/
│               ├── mind_body_mapping.md          # 身心對應與情緒對照庫
│               ├── media_remedies_library.md     # 聲波頻率與雙耳節拍庫
│               ├── natural_remedies_library.md   # 花精、精油、草本茶庫
│               └── consultation_summary_template.md # 諮詢報告範本
├── index.html                                    # 本機首頁 (完整 Web Audio 合成器)
├── index_secure.html                             # 備用安全版首頁
├── index_before_paywall.html                     # 基礎版首頁
├── share/
│   └── index.html                                # 分享版 (純前端本機語意比對引擎)
├── server.rb                                     # Ruby WEBrick 本機 API 伺服器 (/api/analyze)
├── 啟動身心療癒儀.command                       # macOS 雙擊一鍵啟動腳本
├── .gitignore                                    # Git 忽略清單
└── README.md                                     # 專案說明文件
```

---

## 🚀 快速啟動指南 (Local Setup)

### 方法 A：macOS 一鍵雙擊啟動
在 Finder 中直接雙擊 **`啟動身心療癒儀.command`**，系統將自動啟動本機伺服器並以預設瀏覽器開啟 `http://localhost:8000/index.html`。

### 方法 B：終端機手動啟動
```bash
# 啟動本機 Ruby API 伺服器 (埠號: 8000)
ruby server.rb
```
隨後在瀏覽器訪問：
* **主要頁面**：[http://localhost:8000/index.html](http://localhost:8000/index.html)
* **分享頁面**：[http://localhost:8000/share/index.html](http://localhost:8000/share/index.html)

### 方法 C：直接作為靜態頁面開啟
若無需後端 `/api/analyze` 介面，可直接以瀏覽器雙擊開啟 `share/index.html`（內建前端純 JS 關鍵字分析引擎，無需伺服器即可直接運作）。

---

## 🛡️ 安全邊界與使用聲明 (Safety Boundaries)
本專案與 AI Skill 設計為**輔助性身心放鬆與情緒覺察工具**，不涉及任何醫療診斷、處方或治療行為。若面臨重度身心疾病或急性醫療需求，請務必尋求合格專業醫師或心理師之協助。
