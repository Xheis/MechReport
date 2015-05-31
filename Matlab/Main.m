%% MECH2420 Report
% Script for analysing and plotting our data
D = importdata('Data\Stress_Strain_6061.txt','\t',1); % read tab delimited data with 1 header line
ClipGuage_6061 = D.data(:,1); % extract the first column into the array Col1
ForceApplied_6061 = D.data(:,2); % extract the second column into the array Col2
E = importdata('Data\Stress_Strain_7075.txt','\t',1); % read tab delimited data with 1 header line
ClipGuage_7075 = E.data(:,1); % extract the first column into the array Col1
ForceApplied_7075 = E.data(:,2); % extract the second column into the array Col2

%% Infomations about samples
% Here's the sample infomation

%% 6061
% Dimensions
% 40mm x 44.45mm x 300mm
volume_6061 = 40*44.45*300;
Area_6061 = 40*300;
%% 7075
% Dimensions
% 40mm x 38.1mm x 300mm
volume_7075 = 40*38.1*300;
Area_7075 = 40*300;

%% Equipment Specs
% Sigma = Force/Area
% Area = 100mm
% Force = Applied Force
simga_6061 = ForceApplied_6061/Area_6061; % This is not length! It's area.
% Epsilon = DeltaDeflection/Length
epsilon_6061 = (ClipGuage_6061-ClipGuage_6061(1))/ClipGuage_6061(1);

%% Reading Youngs Mod
% We use the Data Cursor to read off our stress/strain graph
YoungMod = 0.001506/0.00439; %0.001506/0.00439 %0.00439/0.001506

%% Plotting our data
%plot our data
figure('Name','Stress Vs Strain Graph','NumberTitle','off', 'Toolbar','none');
plot(epsilon_6061,simga_6061);
hold all
plot(0.00439,0.001506,'x');
title('Stress Vs Strain Graph');
axis([0 0.052 0 2*10^-3])
xlabel('Stress (%)');
ylabel('Strain (MPa)');

% Plot Proportional Limit and Modulus line
A = linspace(0,0.006,100); 
B = A.*(YoungMod);
plot(A,B);

% Plot 0.02% Yeild line
C = linspace(0.002,0.01,100); 
D = A.*(YoungMod);
plot(C,D);

%% Reading the Intersection
% We are able to read off our intersection of <0.007985,0.001541>
YieldStrength_2Percent = [0.007985 0.001541]