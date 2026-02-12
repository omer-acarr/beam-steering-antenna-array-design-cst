# 4x1 Microstrip Patch Antenna Array Design & Beam Steering Analysis

This repository contains the design and simulation of a 4-element linear microstrip patch antenna array, developed as part of an RF engineering study. The design is optimized for the **2.4 GHz ISM band** and focuses on high directivity and efficient impedance matching.

## 🛠 Design & Hardware Specifications

| Parameter | Value |
| :--- | :--- |
| **Operating Frequency** | 2.4 GHz |
| **Substrate** | Rogers RT-duroid 5880 (lossy) |
| **Dielectric Constant ($\epsilon_r$)** | 2.2 |
| **Substrate Height ($h$)** | 1.6 mm |
| **Conducting Material** | PEC (Perfect Electric Conductor) |
| **Feed Technique** | Corporate Feed with $\lambda/4$ Transformers |



## 📊 Simulation Performance

The following results were obtained using the **CST Studio Suite 2025** Time Domain Solver:

* **Resonance Frequency:** 2.4 GHz
* **Return Loss ($S_{11}$):** -14.5 dB
* **Directivity:** 12.53 dBi
* **Radiation Efficiency:** -0.3280 dB
* **Total Efficiency:** -0.5961 dB
* **Mesh Cells:** 1,089,792



## 🏗 System Architecture

The design is modularized within the CST environment for parametric optimization:
- **Patch Elements:** Four identical rectangular patches designed for 2.4 GHz resonance.
- **Corporate Feed Network:** A symmetric power divider network ensuring equal amplitude and phase distribution for broadside radiation.
- **Impedance Matching:** Utilization of quarter-wavelength transformers to match the patch impedance to the 50-ohm main feed line.



## 🚀 Future Work: Beam Steering
The current architecture is prepared for electronic beam steering integration:
1.  **Phase Shift Analysis:** Implementing progressive phase shifts ($\beta$) between elements to tilt the main lobe.
2.  **Active Component Integration:** Adding digital phase shifters to the feed network for real-time scanning.
3.  **Side Lobe Level (SLL) Optimization:** Adjusting element spacing and amplitude tapering to reduce interference.

