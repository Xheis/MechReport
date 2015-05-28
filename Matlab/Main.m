%% MECH2420 Report
% Script for analysing and plotting our data
D = importdata('Data\Diffraction_Data_6061.txt','\t',1); % read tab delimited data with 1 header line
ClipGuage_6061 = D.data(:,1); % extract the first column into the array Col1
ForceApplied_6061 = D.data(:,2); % extract the second column into the array Col2
E = importdata('Data\Diffraction_Data_7075.txt','\t',1); % read tab delimited data with 1 header line
ClipGuage_7075 = E.data(:,1); % extract the first column into the array Col1
ForceApplied_7075 = E.data(:,2); % extract the second column into the array Col2

%% Infomations about samples
% Here's the sample infomation

%% 6061
% Dimensions
% 40mm x 44.45mm x 300mm
volume_6061 = 40*44.45*300;

%% 7075
% Dimensions
% 40mm x 38.1mm x 300mm
volume_7075 = 40*38.1*300;


%% Equipment Specs
% Sigma = Force/Area
% Area = 100mm
% Force = Applied Force
simga_6061 = ForceApplied_6061/100;
% Epsilon = DeltaDeflection/Length
epsilon_6061 = (ClipGuage_6061-ClipGuage_6061(1))/ClipGuage_6061(1);

YoungsMod = simga_6061/epsilon_6061

%% Plotting our data
%plot our data
plot(epsilon_6061,simga_6061);