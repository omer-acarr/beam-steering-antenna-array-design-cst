# 4x1 Microstrip Patch Antenna Array Design & Beam Steering Analysis

[cite_start]This repository contains the design, simulation, and advanced system-level analysis of a 4-element linear microstrip patch antenna array[cite: 8]. The project bridges the gap between electromagnetic full-wave simulation (CST) and numerical system modeling (MATLAB).

## 🛠 Design & Hardware Specifications

| Parameter | Value |
| :--- | :--- |
| **Operating Frequency** | [cite_start]2.4 GHz [cite: 8] |
| **Substrate** | [cite_start]Rogers RT-duroid 5880 (lossy) [cite: 8] |
| **Dielectric Constant ($\epsilon_r$)** | [cite_start]2.2 [cite: 8] |
| **Substrate Height ($h$)** | [cite_start]1.6 mm [cite: 8] |
| **Feed Technique** | [cite_start]Corporate Feed with $\lambda/4$ Transformers [cite: 8] |

## 📊 Simulation & Numerical Performance

[cite_start]The design was first optimized in **CST Studio Suite 2025** [cite: 9] and subsequently analyzed in **MATLAB** for dynamic scanning characteristics:

* [cite_start]**Resonance Frequency:** 2.4 GHz[cite: 9].
* [cite_start]**Return Loss ($S_{11}$):** -14.5 dB[cite: 9].
* [cite_start]**Directivity:** 12.53 dBi[cite: 9].
* **Scanning Range:** ±60 Degrees validated via MATLAB algorithms.
* [cite_start]**Mesh Cells:** 1,089,792[cite: 9].

## 🚀 Advanced Phased Array Analysis (MATLAB Integration)

Beyond static EM simulation, the system was subjected to rigorous numerical post-processing to evaluate real-world radar performance:

* **Dynamic Beam Steering:** Implemented progressive phase-shifting algorithms to tilt the main lobe electronically up to ±60°, tracking variations in Beamwidth and Side-Lobe Levels (SLL).

* **Scan Blindness Characterization:** Conducted a comprehensive study of the **Active Reflection Coefficient ($\Gamma_{active}$)** to identify impedance instability points caused by mutual coupling during wide-angle scanning.
* **Gain Reduction & Mismatch Loss:** Quantified the "Gain Drop" phenomenon, correlating scanning angles with power reflection to ensure operational stability.

* **Live Performance Dashboard:** Developed a unified MATLAB environment that provides a synchronized, real-time view of the radiation pattern alongside instantaneous Active Gamma and Mismatch Loss metrics.

## 🏗 System Architecture

The design is modularized within the CST environment for parametric optimization:
* [cite_start]**Patch Elements:** Four identical rectangular patches designed for 2.4 GHz resonance[cite: 8].
* [cite_start]**Corporate Feed Network:** A symmetric power divider network ensuring equal amplitude and phase distribution[cite: 8].
* [cite_start]**Challenges & Solutions:** Phase imbalances and parasitic microstrip effects were mitigated through iterative geometric tuning and adaptive mesh refinement to ensure 180-degree phase shift fidelity[cite: 8].

---
