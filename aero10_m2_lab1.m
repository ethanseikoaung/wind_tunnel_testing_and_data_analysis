clc, clear, close all

aero_data_org = readtable('D:\Downloads\553-wed-23.txt');

%------------Task 1------------

%Removing rows with missing data
aero_data = rmmissing(aero_data_org);

f_n = aero_data.balance_normalForce; % Normal Force in N
f_a = aero_data.balance_axialForce; % Axial Force in N
f_m = aero_data.balance_pitchingMoment; % Pitching Moment in Nm
aoa = aero_data.model_pitch; %Angle of Attack in deg
A_ref = 0.0223; % Reference Area in m^2
L_ref = 0.089; % Chord Length in m
V = aero_data.wind_V; % Airspeed in m/s
rho = aero_data.wind_rho; %Air density in kg/m^3

%Calculating coefficients
c_n = f_n./(0.5.*rho.*(V.^2).*A_ref);
c_a = f_a./(0.5.*rho.*(V.^2).*A_ref);
c_m = f_m./(0.5.*rho.*(V.^2).*A_ref.*L_ref);

c_aerodata= [c_n,c_a,c_m,aoa];

%Organizing data by airspeed
i_20 = V > 19 & V < 21;
i_30 = V > 29 & V < 31;
i_40 = V > 39 & V < 41;

c_aerodata_20 = array2table(c_aerodata(i_20,:),'VariableNames',{'C_N','C_A','C_M','AOA'});
c_aerodata_20_cl = groupsummary(c_aerodata_20,'AOA','mean');
c_aerodata_30 = array2table(c_aerodata(i_30,:),'VariableNames',{'C_N','C_A','C_M','AOA'});
c_aerodata_30_cl = groupsummary(c_aerodata_30,'AOA','mean');
c_aerodata_40 = array2table(c_aerodata(i_40,:),'VariableNames',{'C_N','C_A','C_M','AOA'});
c_aerodata_40_cl = groupsummary(c_aerodata_40,'AOA','mean');

%Plotting

%Plot for Coefficient of Normal Force
figure
hold on;
grid on;
plot(c_aerodata_20_cl.AOA,c_aerodata_20_cl.mean_C_N,'r-');
plot(c_aerodata_30_cl.AOA,c_aerodata_30_cl.mean_C_N,'b-');
plot(c_aerodata_40_cl.AOA,c_aerodata_40_cl.mean_C_N,'g-');
plot(c_aerodata_20.AOA,c_aerodata_20.C_N,'r.');
plot(c_aerodata_30.AOA,c_aerodata_30.C_N,'b.');
plot(c_aerodata_40.AOA,c_aerodata_40.C_N,'g.');
legend("V = 20 m/s","V = 30 m/s","V = 40 m/s");
xlabel("Angle of Attack, α (degrees)");
ylabel("Coefficient of Normal Force, C_{N}");
hold off;

%Plot for Coefficient of Axial Force
figure
hold on;
grid on;
plot(c_aerodata_20_cl.AOA,c_aerodata_20_cl.mean_C_A,'r-');
plot(c_aerodata_30_cl.AOA,c_aerodata_30_cl.mean_C_A,'b-');
plot(c_aerodata_40_cl.AOA,c_aerodata_40_cl.mean_C_A,'g-');
plot(c_aerodata_20.AOA,c_aerodata_20.C_A,'r.');
plot(c_aerodata_30.AOA,c_aerodata_30.C_A,'b.');
plot(c_aerodata_40.AOA,c_aerodata_40.C_A,'g.');
legend("V = 20 m/s","V = 30 m/s","V = 40 m/s");
xlabel("Angle of Attack, α (degrees)");
ylabel("Coefficient of Normal Force, C_{A}");
hold off;

%Plot for Coefficient of Pitching Moment
figure
hold on;
grid on;
plot(c_aerodata_20_cl.AOA,c_aerodata_20_cl.mean_C_M,'r-');
plot(c_aerodata_30_cl.AOA,c_aerodata_30_cl.mean_C_M,'b-');
plot(c_aerodata_40_cl.AOA,c_aerodata_40_cl.mean_C_M,'g-');
plot(c_aerodata_20.AOA,c_aerodata_20.C_M,'r.');
plot(c_aerodata_30.AOA,c_aerodata_30.C_M,'b.');
plot(c_aerodata_40.AOA,c_aerodata_40.C_M,'g.');
legend("V = 20 m/s","V = 30 m/s","V = 40 m/s");
xlabel("Angle of Attack, α (degrees)");
ylabel("Coefficient of Pitching Moment, C_{M}");
hold off;


%------------Task 2------------

%Calculating coefficient of lift and drag for various air-speeds. 
c_l_20 = c_aerodata_20.C_N.*cosd(c_aerodata_20.AOA) + c_aerodata_20.C_A.*sind(c_aerodata_20.AOA);
c_d_20 = c_aerodata_20.C_N.*sind(c_aerodata_20.AOA) + c_aerodata_20.C_A.*cosd(c_aerodata_20.AOA);

c_l_30 = c_aerodata_30.C_N.*cosd(c_aerodata_30.AOA) + c_aerodata_30.C_A.*sind(c_aerodata_30.AOA);
c_d_30 = c_aerodata_30.C_N.*sind(c_aerodata_30.AOA) + c_aerodata_30.C_A.*cosd(c_aerodata_30.AOA);

c_l_40 = c_aerodata_40.C_N.*cosd(c_aerodata_40.AOA) + c_aerodata_40.C_A.*sind(c_aerodata_40.AOA);
c_d_40 = c_aerodata_40.C_N.*sind(c_aerodata_40.AOA) + c_aerodata_40.C_A.*cosd(c_aerodata_40.AOA);

% Organizing CL and CD data into tables

cl_data_20 = table(c_aerodata_20.AOA,c_l_20,'VariableNames',{'AOA','CL'});
cd_data_20 = table(c_aerodata_20.AOA,c_d_20,'VariableNames',{'AOA','CD'});
cl_data_30 = table(c_aerodata_30.AOA,c_l_30,'VariableNames',{'AOA','CL'});
cd_data_30 = table(c_aerodata_30.AOA,c_d_30,'VariableNames',{'AOA','CD'});
cl_data_40 = table(c_aerodata_40.AOA,c_l_40,'VariableNames',{'AOA','CL'});
cd_data_40 = table(c_aerodata_40.AOA,c_d_40,'VariableNames',{'AOA','CD'});

% Finding average CL for each unique AOA
cl_data_20_cl = groupsummary(cl_data_20,'AOA','mean');
cd_data_20_cl = groupsummary(cd_data_20,'AOA','mean');
cl_data_30_cl = groupsummary(cl_data_30,'AOA','mean');
cd_data_30_cl = groupsummary(cd_data_30,'AOA','mean');
cl_data_40_cl = groupsummary(cl_data_40,'AOA','mean');
cd_data_40_cl = groupsummary(cd_data_40,'AOA','mean');

% Plots

%Plot for coefficient of lift
figure
hold on;
grid on;
plot(cl_data_20_cl.AOA,cl_data_20_cl.mean_CL,'r-');
plot(cl_data_30_cl.AOA,cl_data_30_cl.mean_CL,'b-');
plot(cl_data_40_cl.AOA,cl_data_40_cl.mean_CL,'g-');
plot(c_aerodata_20.AOA,c_l_20,'r.');
plot(c_aerodata_30.AOA,c_l_30,'b.');
plot(c_aerodata_40.AOA,c_l_40,'g.');
xlabel('Angle of Attack, α (degrees)');
ylabel('Coefficient of Lift, C_{L}');
legend("V = 20 m/s","V = 30 m/s","V = 40 m/s");
hold off;

%Plot for coefficient of drag
figure
hold on;
grid on;
plot(cd_data_20_cl.AOA,cd_data_20_cl.mean_CD,'r-');
plot(cd_data_30_cl.AOA,cd_data_30_cl.mean_CD,'b-');
plot(cd_data_40_cl.AOA,cd_data_40_cl.mean_CD,'g-');
plot(c_aerodata_20.AOA,c_d_20,'r.');
plot(c_aerodata_30.AOA,c_d_30,'b.');
plot(c_aerodata_40.AOA,c_d_40,'g.');
xlabel('Angle of Attack, α (degrees)');
ylabel('Coefficient of Drag, C_{D}');
legend("V = 20 m/s","V = 30 m/s","V = 40 m/s");
hold off;

%------------Task 3------------

%Airspeed Used

V = [20,30,40]; %Airspeed tested in wind tunnel

rho_given = 1.23; %Air density in kg/m^3
c = 0.089 ; % chord in m
mu = 0.0000179; %air dynamic viscosity in kg/(m*s)
C = 340; % speed of sound at sea level in m/s

Re = (rho_given.*V.*c)./mu; %Computing chord Reynolds numbers
M = V./C; %Mach Number

disp("For V = 20 m/s");
fprintf("Chord Reynolds Number: %6.2f\n",Re(1));
fprintf("Mach Number: %6.2f\n",M(1));
disp("---------------------");
disp("For V = 30 m/s");
fprintf("Chord Reynolds Number: %6.2f\n",Re(2));
fprintf("Mach Number: %6.2f\n",M(2));
disp("---------------------");
disp("For V = 40 m/s");
fprintf("Chord Reynolds Number: %6.2f\n",Re(3));
fprintf("Mach Number: %6.2f\n",M(3));
