%% MECH2420 Report
% Script for analysing and plotting our data
D = importdata('Data\Stress_Strain_6061.txt','\t',1); % read tab delimited data with 1 header line
ClipGuage_6061 = D.data(:,1); % extract the first column into the array Col1
ForceApplied_6061 = D.data(:,2); % extract the second column into the array Col2
E = importdata('Data\Stress_Strain_7075.txt','\t',1); % read tab delimited data with 1 header line
ClipGuage_7075 = E.data(:,1); % extract the first column into the array Col1
ForceApplied_7075 = E.data(:,2); % extract the second column into the array Col2

%% Converting to Standard Units
% We want to convert to our standard units Metres and Newtons. This helps
% avoid mm^2 * 10^-3 conversions, which are linear but confusing.
ForceApplied_6061 = ForceApplied_6061;%.*10^3;    % Here we take kN to N
ForceApplied_7075 = ForceApplied_7075;%.*10^3;
ClipGuage_6061 =    ClipGuage_6061;%.*10^-3;      % Here we take mm to m
ClipGuage_7075 =    ClipGuage_7075;%.*10^-3;
%% Infomations about samples
% Here's the sample infomation

%% 6061
% Dimensions
% 40mm x 44.45mm x 300mm
volume_6061 = 40*44.45*300;
%Area_6061 = (5)*(12.5);
Area_6061 = (5*10^-3)*(12.5*10^-3);

%% 7075
% Dimensions
% 40mm x 38.1mm x 300mm
volume_7075 = 40*38.1*300;
Area_7075 = (5*10^-3)*(12.5*10^-3)

%% Equipment Specs
% Sigma = Force/Area
% Area = 100mm
% Force = Applied Force
simga_6061 = ForceApplied_6061/Area_6061; % This is not length! It's area.
% Epsilon = DeltaDeflection/Length
epsilon_6061 = (ClipGuage_6061-ClipGuage_6061(1))/ClipGuage_6061(1);

% epsilon_6061 = zeros(size(ClipGuage_6061,1),1);
% for i = 2:size(epsilon_6061,1)
%     epsilon_6061(i) = (ClipGuage_6061(i)-ClipGuage_6061(i-1))/ClipGuage_6061(1);
% end

simga_7075 = ForceApplied_7075/Area_7075; % This is not length! It's area.
% Epsilon = DeltaDeflection/Length
epsilon_7075 = (ClipGuage_7075-ClipGuage_7075(1))/ClipGuage_7075(1);

%% Reading Youngs Mod
% We use the Data Cursor to read off our stress/strain graph
YoungMod_6061 = 2.7522e+05/0.0038;%0.001506/0.00439; %0.001506/0.00439 %0.00439/0.001506
YoungMod_7075 = 4.909e+05/0.007079;%2.72/0.007781;%0.002768/0.008235; 

 
%% Plotting our data
% Plot our data using out PlotSvS Function
PlotSvS(epsilon_6061,simga_6061,YoungMod_6061,1);
PlotSvS(epsilon_7075,simga_7075,YoungMod_7075,2);