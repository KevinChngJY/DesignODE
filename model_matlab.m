function dydt= model_matlab(t,y)

% Define Initial Conditions
T_ambient = 30+273.15;
Inner_diameter_tube = 0.1;
Outer_diameter_tube = 0.12;
Length_tube = 1;
Number_tube = 1;
Inner_diameter_shell = 0.2;
Outer_diameter_shell = 0.22;
Conductive_heattransfer_tube_shell = 40000;
conductive_heattransfer_shell_ambient = 500;
Cross_sectional_area_shell = 0.0254;
Cross_sectional_area_tube = 0.0314;
At = 2*3.142*((Inner_diameter_tube+Outer_diameter_tube)/2)*Length_tube*Number_tube;
Ad = 2*3.142*((Inner_diameter_shell+Outer_diameter_shell)/2)*Length_tube;
Average_heat_capacity_shell=4185;
Temperature_inlet_shell=26.8+273.15;
Density_fluid_shell = 1000;
Flow_rate_shell = 0.1;
ms = Cross_sectional_area_shell*Density_fluid_shell*Length_tube;
Average_heat_capacity_tube=1200;
Temperature_inlet_tube=96.85+273.15;
Density_fluid_tube = 1030;
Flow_rate_tube = 0.2;
mt = Cross_sectional_area_tube*Density_fluid_tube*Length_tube;

% ODE Equations
dydt = [((Temperature_inlet_shell-y(1))...
    - (Conductive_heattransfer_tube_shell*At)*(y(1)-y(2))/(Length_tube*Density_fluid_shell*Flow_rate_shell*Average_heat_capacity_shell)...
    - (conductive_heattransfer_shell_ambient*Ad)*(Temperature_inlet_shell-T_ambient)/(Density_fluid_shell*Flow_rate_shell*Average_heat_capacity_shell))...
    * (Density_fluid_shell*Flow_rate_shell/ms);
     (Flow_rate_tube*(Temperature_inlet_tube-y(2))...
    + (Conductive_heattransfer_tube_shell*At)*(y(1)-y(2))/(Length_tube*Density_fluid_tube*Average_heat_capacity_tube))...
    * (Density_fluid_tube/mt)];