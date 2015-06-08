%% Residual Strain Measurements
% We will record and graph the residual strain found in the 2 alumnium
% samples

%% Neutron Wavelength
% Neutron = 1.73 Angstroms, or 1.73 * 10^-10 metres
NetronWL = 1.73;
NetronWL_std = 1.73*10^-10; 

%% Gauge Volume
% Gauge volume was contant at
GaugeVolume = 2*2*20; %mm

%% Reference D Spacings
% Measurement in Angstroms (*10^-10)
Reference_D_Spacing_6061    =   1.2181161; %plus or minus uncertainity 
Reference_uncertainity_6061 =   8*10^-6;
Reference_D_Spacing_7075    =   1.2188861; %plus or minus uncertainity 
Reference_uncertainity_7075 =   5*10^-6;

%% Method
% Calculate the Residue stress. We can use the formula
%%
% 
% $$TOTAL STRESS = RESIDUAL STRESS + APPLIED STRESS$$
% 


%% Miller Spacing
% 311 Latice planes, aka, 
x_int = 1/3;
y_int = 1;  
z_int = 1;
Lattice_spacing = 1/(11^-0.5);

%% Import Data
% Importing data using the importdata command
D = importdata('Data\Diffraction_Data_6061.txt','\t',1); % read tab delimited data with 1 header line
ymm_6061 = D.data(:,1); % extract the first column into the array Col1
Axial_D_spacing_6061 = D.data(:,2); % extract the second column into the array Col2
Axial_error_6061 = D.data(:,3);
Transverse_D_spacing_6061 = D.data(:,4);
Transverse_error_6061 = D.data(:,5);

E = importdata('Data\Diffraction_Data_7075.txt','\t',1); % read tab delimited data with 1 header line
ymm_7075 = E.data(:,1); % extract the first column into the array Col1
Axial_D_spacing_7075 = E.data(:,2); % extract the second column into the array Col2
Axial_error_7075 = E.data(:,3);
Transverse_D_spacing_7075 = E.data(:,4);
Transverse_error_7075 = E.data(:,5);

%% Setting Up Our Variables
% Epsilon = DeltaDeflection/Length
Epsilon_Axial_6061 = (Axial_D_spacing_6061 - Reference_D_Spacing_6061)/Reference_D_Spacing_6061; %We also have Axial_error_6061 to account for
Epsilon_Axial_7075 = (Axial_D_spacing_7075 - Reference_D_Spacing_7075)/Reference_D_Spacing_7075;
Epsilon_Transverse_6061 = (Transverse_D_spacing_6061 - Reference_D_Spacing_6061)/Reference_D_Spacing_6061; %We also have Axial_error_6061 to account for
Epsilon_Transverse_7075 = (Transverse_D_spacing_7075 - Reference_D_Spacing_7075)/Reference_D_Spacing_7075;

Sigma_Axial_6061 = (69*10^9)*(Epsilon_Axial_6061);
xs = linspace()
scatter(Sigma_Axial_6061,ymm_6061);
%surf(Epsilon_Axial_6061, Epsilon_Transverse_6061, ymm_6061);