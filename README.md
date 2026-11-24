# Wing Tunnel Testing and Data Analysis

## **About**

- Analyzed how aerodynamic forces act on an airfoil by simulating various flight conditions in a wind tunnel.

## **Process**

- Collected normal force, axial force, and pitching moment data for the airfoil from $-2^\circ$ to $18^\circ$ angle of attack (AOA) across three airspeeds ($20$, $30$, and $40\text{ m/s}$).
- Calculated the coefficients of lift ($C_L$), drag ($C_D$), and pitching moment ($C_M$) from the raw load data in MATLAB.

## **Results**

| Metric | $V = 20\text{ m/s}$ | $V = 30\text{ m/s}$ | $V = 40\text{ m/s}$ |
| :--- | :---: | :---: | :---: |
| **Chord Reynolds Number ($Re$)** | $122,313$ | $183,469$ | $244,626$ |
| **Mach Number ($M$)** | $0.06$ | $0.09$ | $0.12$ |
| **Max Lift Coefficient ($C_{L,\max}$)** | $0.74$ | $0.78$ | $0.83$ |
| **Stall AOA ($\alpha_{\text{stall}}$)** | $13^\circ$ | $13^\circ$ | $14^\circ$ |

- The experimental data indicates that both the maximum lift coefficient ($C_{Lmax}$) and stall angle of attack increase slightly at higher Reynolds numbers due to delayed boundary layer separation.

*Coefficient of Lift Vs. Angle of Attack
<img width="1800" height="900" alt="c_l" src="https://github.com/user-attachments/assets/2d5e76b9-944f-4021-ac23-6825fcb260d3" />

*Coefficient of Drag Vs. Angle of Attack
<img width="1800" height="900" alt="c_d" src="https://github.com/user-attachments/assets/1ee776c6-726a-4c56-aa4a-02449d8eea6b" />

*Coefficient of Pitch Moment Vs. Angle of Attack
<img width="1800" height="900" alt="c_m" src="https://github.com/user-attachments/assets/7108e54d-9d9c-4df7-b6f0-5909b6adba59" />

