# Study of Aircraft Behavior Project

## Project Overview

This project focuses on analyzing aircraft wing structures and lift distribution using computational simulations. The MATLAB-based implementation investigates aerodynamic properties using techniques such as Oscar Shrink Lift Distribution and Prandtl's Lifting Line Theory. Our simulations aim to enhance the understanding of aircraft performance and structural efficiency.

### Project Contributors
- **Oumarou Moussa Bola**
- **Nouaili Mariem**

## Repository Contents

This repository contains:
- **PFA.code**: Provides insights into the aerodynamic performance analysis.
- **Oscar Shrink Code**: Implements the Oscar Shrink method for lift distribution calculations.
- **Basic Simulation Output**: Contains generated plots illustrating key findings from our simulations.

## Theoretical Background

### Lift Distribution

The lift force $L$ acting on an aircraft wing can be expressed as:

```math
L = \frac{1}{2} \rho V^2 S C_L
```

where:
- $\rho$ = air density,
- $V$ = freestream velocity,
- $S$ = wing surface area,
- $C_L$ = lift coefficient.

The **Oscar Shrink Lift Distribution** method models how lift varies along the wingspan, helping optimize aerodynamic efficiency.

### Prandtl's Lifting Line Theory

Prandtl's Lifting Line Theory provides a mathematical framework to analyze lift along a finite wing:

```math
\Gamma(y) = \frac{2 V \alpha}{\pi} \int_{-b/2}^{b/2} \frac{C_L(y') dy'}{(y - y')}
```

where:
- $\Gamma(y)$ is the circulation distribution,
- $\alpha$ is the angle of attack,
- $b$ is the wingspan.

This equation helps predict induced drag and optimize wing performance.

### Structural Analysis and Calculations

To ensure the structural integrity of the aircraft wing, various engineering methods are used to analyze internal forces and deformations.

#### Virtual Work Method
The **Virtual Work Method** is used to determine displacements and deformations of structures under external forces. The principle states that the work done by external forces is equal to the internal virtual work:

```math
\delta W_{ext} = \delta W_{int}
```

This method is particularly useful for analyzing deflections in aircraft wing structures.

#### Shear Force Calculation
The **shear force** at a given section of the wing is computed using:

```math
V(x) = \int_{x}^{L} q(x) dx
```

where:
- $V(x)$ is the shear force at position $x$,
- $q(x)$ is the distributed load (e.g., lift force),
- $L$ is the span of the wing.
### Castigliano’s Theorem

Castigliano’s method is a principle used in structural mechanics to determine displacements in a structure subjected to external loads. It states that the partial derivative of the internal strain energy $W_{\text{int}}$, expressed as a function of external forces, with respect to an applied force $P_i$, gives the displacement $\delta_i$ at the point of application of $P_i$:

$$
\frac{\partial W_{\text{int}}}{\partial P_i} = \delta_i
$$

Using Castigliano's theorem, the shear force at a point $M$ along the beam can be determined as:

$$
V(M) = \frac{\partial W_{\text{int}}}{\partial F}
$$

where $F$ is an applied force at point $M$ with coordinate $x_M$.

#### Internal Force Distribution

For the segment $[M, L]$, where $x_M < x_G < x_L$:

$$T_{\text{int}, G} = T_{\text{ext}, G}^{+} = \begin{bmatrix}
\int_{x_M}^{x_L} p(x) \cdot \mathbf{y} \,dx \\
\int_{x_M}^{x_L} p(x) \cdot (x - x_G) \,dx \cdot \mathbf{z}
\end{bmatrix}_G $$

For the segment $[O, M]$, where $0 < x_G < x_M$:

```math
T_{\text{int}, G} = T_{\text{ext}, G}^{+} =
\begin{pmatrix}
\int_{0}^{x_M} p(x) \cdot \mathbf{y} \,dx \\
\int_{0}^{x_M} p(x) \cdot (x_G - x) \,dx \cdot \mathbf{z}
\end{pmatrix}_G
+
\begin{pmatrix}
F \cdot \mathbf{y} \\
F \cdot (x_M - x_G) \cdot \mathbf{z}
\end{pmatrix}_G
+
\begin{pmatrix}
\int_{x_G}^{x_L} p(x) \cdot \mathbf{y} \,dx \\
\int_{x_G}^{x_L} p(x) \cdot (x - x_G) \,dx \cdot \mathbf{z}
\end{pmatrix}_G
```
Thus, the internal force tensor is:

$$T_{\text{int}, G} =
\begin{bmatrix}
\int_{0}^{x_M} p(x) \cdot \mathbf{y} \,dx + \int_{x_G}^{x_L} p(x) \cdot \mathbf{y} \,dx + F \cdot \mathbf{y} \\
\int_{x_G}^{x_M} p(x) \cdot (x - x_G) \,dx \cdot \mathbf{z} + \int_{x_G}^{x_L} p(x) \cdot (x - x_G) \,dx \cdot \mathbf{z} + F (x_M - x_G) \cdot \mathbf{z}
\end{bmatrix}_G$$

#### Bending Moment Calculation

For the segment $[M, L]$:

$$
M_{fz} = \int_{x_M}^{x_L} p(x) \cdot (x - x_G) \,dx
$$

For the segment $[O, M]$:

$$M_{fz} = \int_{x_G}^{x_M} p(x) \cdot (x - x_G) \,dx + \int_{x_G}^{x_L} p(x) \cdot (x - x_G) \,dx + F (x_M - x_G)$$

Under the **Navier-Bernoulli hypothesis**, the effects of shear force are neglected, leading to:

$$V(M) = \left(\frac{\partial W_{\text{int}}}{\partial F}\right)_{F=0}$$


$$V(M)=\frac{1}{EI}\int_{0}^{x_M}(x_M - x_G)\left[\int_{x_G}^{x_M} p(x) \cdot (x - x_G) \,dx + \int_{x_G}^{x_L} p(x) \cdot (x - x_G) \,dx\right]$$


where:
- $E$ is the Young's modulus of the material,
- $I$ is the moment of inertia of the beam cross-section.

This formulation is crucial for predicting deflections and structural behavior in aircraft wing analysis.
#### Wing Bending Moment Calculation
The **bending moment** along the wing is given by:

```math
M(x) = \int_{x}^{L} V(x) dx
```

where $M(x)$ represents the internal moment at position $x$. This helps in assessing wing bending stresses.

#### External Load Considerations
Aircraft wings are subject to:
- **Aerodynamic Loads** (Lift, Drag)
- **Structural Loads** (Weight, Fuel, Engine Forces)
- **Dynamic Loads** (Gusts, Maneuvers)

The combination of these loads determines the stress distribution within the wing.

## Simulation Results
## Architectural Plan Fi-156
![Architectural Plan FI-156](image.png)
### Table 1: Parameters of the Fi-156

| **Parameter**      | **Value**      |
|--------------------|---------------|
| **Envergure**      | **14.25 m**    |
| **Longueur**       | 9.90 m         |
| Hauteur           | 3.05 m         |
| **Surface alaire** | 26 m²          |
| MTOW              | 1320 kg        |
| $V_{\text{max}}$           | 175 km/h       |
| **Stall speed**    | 46 km/h        |
| **Range**         | 385 km         |

### Table 2: Material Properties

| **Property**            | **Value**            |
|-------------------------|---------------------|
| **Masse volumique**     | ρ = 2700 kg/m³      |
| **Module de Young**     | E = 65000 MPa       |
| **Poisson's ratio**     | ν = 0.33            |
| **Résistance élastique** | Rₑ = 190 MPa       |

Below are some visualizations of our analysis:

### Lift Distribution  
![Lift Distribution](Basic-Simulation-Outputs/Lift-Distribution-Over-The-Wing.jpg)

### Displacement Over the Wing  
![Wing Structure](Basic-Simulation-Outputs/DISPLACEMENT-Over-The-Wing.jpg)

### Tangential Stress  
![Bending Moment](Basic-Simulation-Outputs/Moment-Flechissant.jpg)

## Getting Started

### Prerequisites
To run the MATLAB simulations, ensure you have:
- MATLAB installed (R2020a or later recommended)
- Required MATLAB toolboxes for aerodynamics and simulations

### Running the Code
1. Clone this repository:
   ```sh
   git clone https://github.com/OMB227/Study-Of-Aircraft-Behavior-Project.git
   ```
2. Open MATLAB and navigate to the repository directory.
3. Run `PFA.code` or `Oscar Shrink Code` to start the analysis.
## Contact
For more information, feel free to reach out:  
📧 **moussabolaoumarou@gmailcom**  
🔗 **Repository**: [GitHub Repository](https://github.com/OMB227/Study-Of-Aircraft-Behavior-Project.git)

