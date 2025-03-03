# Study of Aircraft Behavior Project

## Project Overview

This project investigates the aerodynamic behavior of an aircraft using MATLAB-based simulations. It specifically explores **lift distribution** over the wing, **wing structural design**, and **performance evaluation** through computational models. The analysis is based on Oscar Shrink's lift distribution method, with numerical results validated through MATLAB simulations.

### Project Supervisor

**[Include Supervisor's Name if Applicable]**

### Author

**Oumarou Moussa Bola**

## Repository Contents

This repository contains MATLAB scripts and outputs that model aircraft lift distribution and performance analysis. Key components include:

- **`oscar_shrink.m`** - MATLAB script implementing the Oscar Shrink lift distribution model.
- **`PFA.code`** - Performance evaluation module.
- **`basic-simulation-output/`** - Folder containing plots that illustrate the simulation results.

## Theoretical Background

### 1. Lift Distribution over a Wing

The **Oscar Shrink Lift Distribution** describes how lift varies along the aircraft wing. This is governed by the fundamental lift equation:

\(L = \frac{1}{2} \rho V^2 S C_L\)

where:

- \(L\) = Lift force (N)
- \(\rho\) = Air density (kg/m³)
- \(V\) = Free-stream velocity (m/s)
- \(S\) = Wing surface area (m²)
- \(C_L\) = Lift coefficient (dimensionless)

Oscar Shrink’s method refines this by considering the elliptical distribution of lift along the wingspan:

\(L(y) = C_L \frac{1}{2} \rho V^2 \frac{b}{2} \left(1 - \frac{y^2}{(b/2)^2}\right)\)

where:

- \(L(y)\) = Lift at a given spanwise position \(y\)
- \(b\) = Wingspan (m)
- \(y\) = Spanwise location from the centerline (m)

This method provides a **more realistic approximation** of lift distribution for subsonic aircraft wings.

### 2. Aircraft Wing Structure

The wing structure is designed to withstand aerodynamic loads while maintaining optimal performance. Key considerations include:

- **Aspect Ratio (AR):**

  \(AR = \frac{b^2}{S}\)

  Higher aspect ratios improve efficiency but may introduce structural challenges.

- **Taper Ratio (λ):**

  \(\lambda = \frac{C_t}{C_r}\)

  where \(C_t\) and \(C_r\) are the tip and root chord lengths, respectively. Tapering affects both aerodynamic efficiency and structural weight.

- **Structural Load Analysis:**
  The bending moment \(M(y)\) along the span is given by:

  \(M(y) = \int_{y}^{b/2} L(y') y' dy'\)

  This integral determines the stress distribution that the wing must withstand.

### 3. MATLAB Implementation

The project employs MATLAB to:

- Simulate lift distribution using Oscar Shrink’s method.
- Analyze structural loading through numerical integration.
- Generate **plots available in** `basic-simulation-output/`, including:
  - Lift coefficient distribution.
  - Pressure coefficient variations.
  - Structural bending moment analysis.

## Simulation Results

Some key plots ill*ustrating the results include:*



## Conclusion

This study provides insights into aircraft lift characteristics and structural considerations. By utilizing MATLAB-based simulations, it enhances understanding of aerodynamics and wing design optimization.

## Contact

📧 **[oumarou@aims.ac.za](mailto\:oumarou@aims.ac.za)**\
🔗 **Repository:** [GitHub](https://github.com/OMB227/Study-Of-Aircraft-Behavior-Project.git)

