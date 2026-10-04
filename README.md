# MetroVerify - Online Verification System for Weighing and Measuring Instruments

> **National Legal Metrology Digital Verification, Stamping & Anti-Tamper Regulatory Platform**  
> Compliant with **OIML R 76** (Non-automatic weighing instruments) and National Standards of Weights & Measures Acts.

---

## 📌 Executive Summary & Problem Statement

Commercial transactions in commerce, trade, healthcare, aviation, and logistics rely fundamentally on the precision and trust of **Weighing and Measuring Instruments** (e.g., electronic retail scales, gold carat balances, industrial weighbridges, fuel dispensers, and clinical balances).

### Real-World Challenges Solved:
1. **Inefficient Manual Paperwork & Verification Delays**: Transitioned traditional paper records to an automated, end-to-end digital lifecycle.
2. **Fraud & Counterfeit Stamping**: Implemented cryptographic QR seals and digital verification certificates linked to tamper-evident physical seals.
3. **Citizen Empowerment & Transparency**: Enabled any consumer to scan an on-device QR seal or enter a serial UID to verify whether a scale is certified, in-tolerance, or overdue for re-verification.
4. **Field Inspector Calibration Automation**: Provided inspectors with a digital calibration suite that automatically calculates **Maximum Permissible Error (MPE)** against statutory tolerances (Class I, II, III, IV) and issues digitally signed certificates.
5. **Consumer Grievance Redressal**: Built an instant reporting mechanism for consumers to report unverified scales, broken seals, or short deliveries directly to the enforcement cell.

---

## 🚀 Key Features & Role-Based Portals

### 1. 🏢 Trader / Merchant Self-Service Portal
- **Equipment Inventory**: View all registered measuring instruments with live status badges (`VERIFIED`, `EXPIRING_SOON`, `EXPIRED`, `PENDING_INSPECTION`).
- **Online Registration**: Register new instruments with manufacturer serial numbers, model approval numbers, accuracy class, capacity, and shop premises details.
- **Re-Verification Scheduling**: Apply for periodic statutory re-verification with automated fee calculation.
- **Integrated Payment Gateway**: Simulated Bharat BillPay / UPI / NetBanking payment with instant regulatory receipt generation.
- **Official Digital Certificate**: Download and print high-resolution, digitally stamped Legal Metrology Certificates with cryptographic QR codes and holographic badges.
- **Physical QR Seal**: View and print tamper-evident QR stickers for affixing to instrument chassis.

### 2. 🔍 Inspector Field Verification & Calibration Suite
- **Assigned Inspection Queue**: Prioritized list of devices requiring initial verification or periodic re-stamping.
- **Interactive Hardware Scale Simulator & Sandbox (`VirtualScale`)**:
  - Realistic digital scale with pan assembly, VFD 7-segment digital display, and certified standard test weights rack (10g to 5,000g).
  - Tare / Zero controls and settling physics.
  - **Corner Load (Eccentricity) Testing** (Top-Left, Top-Right, Center, Bottom-Left, Bottom-Right).
  - **Drift / Illegal Tampering Simulator** (+0.5% drift, +2.0% fraud, -1.5% short delivery) to test regulatory compliance detection.
  - **One-Click Reading Transfer**: Transfer applied test load and indicated reading directly into the statutory verification routine.
- **Automated MPE Engine**: Evaluates observed error against OIML R76 Maximum Permissible Errors ($0.5e$, $1.0e$, $1.5e$) in real-time.
- **Official Stamping & Issuance**: Assigns holographic seal numbers and issues digitally signed certificates.

### 3. 📱 Public Citizen / Consumer Transparency Scanner
- **Optical Scanner Viewfinder**: Live animated camera viewfinder simulation.
- **Instant Search**: Lookup instruments via UID (e.g. `WM-2026-SCALE-8492`) or Serial Number.
- **Public Verification Card**: Transparently displays:
  - Accuracy Class and verification interval ($e$).
  - Calibration validity and expiration date.
  - Certifying Inspector Officer ID and Seal Number.
  - Physical store name and registered location.
- **Whistleblower / Grievance Redressal**: File direct complaints regarding unverified scales, broken seals, or suspected tampering, generating trackable tickets (`GRV-2026-XXX`).

### 4. 📊 Central Regulatory Command Center & Analytics
- **Live Regulatory KPIs**: Total registered instruments, active verifications, overdue instruments, statutory revenue collected, and national compliance rate.
- **Grievance Redressal Board**: Track consumer complaints, assign inspectors, and log enforcement actions.
- **Cryptographic Audit Trail**: Immutable log recording every registration, test, certificate issuance, and payment with timestamps and terminal IPs.
- **Data Export & Portability**: 1-click JSON export of the entire metrology database.

---

## 🛠️ Technology Architecture

- **Frontend**: Pure HTML5 (Semantic, Accessible, `<dialog>`, Canvas 2D) & Vanilla CSS3 (Custom Properties, Glassmorphism, Responsive Grid, Print Styles).
- **Core Logic**: Modern ES6+ JavaScript Modules (`app.js`, `store.js`, `metrology-engine.js`, `qr-generator.js`, `virtual-scale.js`, `audio-feedback.js`).
- **Data Persistence**: HTML5 `localStorage` with seed datasets.
- **QR Code Engine**: Standalone client-side 2D Matrix Canvas generator (zero external CDN dependencies).
- **Audio Feedback**: Web Audio API synthesized tones (scan beeps, success chimes, alert tones) with mute controls.
- **Zero Build Setup**: Runs natively in any modern web browser without requiring Node/npm or external servers.

---

## 💻 How to Run the Application

Simply open `index.html` in your favorite web browser (Google Chrome, Microsoft Edge, Mozilla Firefox, Safari):

1. Double-click **`index.html`** in the project folder, or
2. Right-click **`index.html`** → **Open with** → **Google Chrome** (or Edge).
3. Alternatively, if you have a local HTTP server (like VS Code Live Server or Python):
   ```bash
   # Optional: if python is installed
   python -m http.server 8080
   # Then open: http://localhost:8080
   ```

---

## 🧪 Quick Test Scenarios

| Test Case | Steps | Expected Result |
|-----------|-------|-----------------|
| **1. View Official Certificate** | Go to **Trader Portal** → Click **Certificate** on "Precision Gold Carat Balance". | Government-grade certificate appears with seal, watermark, QR code, and print button. |
| **2. Test Digital Calibration** | Go to **Inspector Field Suite** → Click **Launch Digital Verification** on Mandi Scale → Place a 1,000g weight on the virtual scale → Click **Transfer Reading** → Click **Calculate MPE & Record**. | Calculates error vs MPE and updates live compliance badge. |
| **3. Catch Illegal Tampering** | In the virtual scale toolbox, select **+2.0% (Fraud)** drift → Place 500g weight → Transfer reading → Record. | System flags **FAIL (OUT OF TOLERANCE)** and prevents certificate issuance. |
| **4. Citizen QR Lookup** | Go to **Citizen QR Scanner** → Click sample chip **Mandi Scale (Expired!)** → Click **Verify Now**. | Red warning displays: *EXPIRED VERIFICATION! It is an offense to conduct commercial transactions using an expired scale.* |
| **5. File a Grievance** | On the expired scale card, click **File Grievance / Report Tampering** → Fill out form → Submit. | Ticket `GRV-2026-XXX` is dispatched to the Legal Metrology Cell and logged in the Command Center. |
