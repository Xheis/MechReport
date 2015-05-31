function PlotSvS(Data1,Data2)
%% Plotting our data
%plot our data
figure('Name','Stress Vs Strain Graph','NumberTitle','off', 'Toolbar','none');
plot(Data1,Data2);
hold all
title('Stress Vs Strain Graph');
axis([0 0.052 0 2*10^-3])
xlabel('Stress (%)');
ylabel('Strain (MPa)');

%% Reading Youngs Mod
% We use the Data Cursor to read off our stress/strain graph
YoungMod = 0.001506/0.00439; %0.001506/0.00439 %0.00439/0.001506


%% Reading & Plotting the Intersection
% We are able to read off our intersection of <0.007985,0.001541>
% EDIT: We want to use the function 'intersections' to grab our
% intersections.

% Plot Proportional Limit and Modulus line
A = linspace(0,0.006,100); 
B = A.*(YoungMod);

% Plot 0.02% Yield line
C = A+0.002; 
D = (A).*(YoungMod);


% Plot LOAD Yield line
E = A + 0.005;
F = A.*(YoungMod);

[x_int,y_int] = intersections(C,D,Data1,Data2,1);
[x_int2,y_int2] = intersections(A,B,Data1,Data2,1); %This is for reading off the first point. 
[x_int3,y_int3] = intersections(E,F,Data1,Data2,1); %This is for reading off the first point. 
plot(x_int(end),y_int(end), 'k*');
plot(x_int2(end),y_int2(end), 'k*');
plot(x_int3(end),y_int3(end), 'k*');

plot(A,B,'g'); %Green is Proportional
plot(C,D,'r'); %Red is 2%
plot(E,F,'b'); %Blue is Under Load
YieldStrength_2Percent = [x_int y_int];
YieldStrength_Load = [x_int3 y_int3];
%str1 = '\leftarrow 2% Yield @' num2str(x_int)  ','  num2str(y_int);
str1 = sprintf('2%% Yield \n@ [%0.2d , %0.2d]', x_int,y_int);
str2 = sprintf('Proportional Limit \n & modulus \n@ [%0.2d , %0.2d]', x_int2(end),y_int2(end));
str3 = sprintf('Yield Strength 0.5%% \n Extention Under Load \n@ [%0.2d , %0.2d]', x_int3,y_int3);
Text_X = 0.0502319971911861*0.65
Base_Y = 0.00157664491666667*1.65
Text_Y1 = Base_Y*0.7
Text_Y2 = Base_Y*0.5
Text_Y3 = Base_Y*0.3
t1 = text(Text_X,Text_Y1, str1,'Color', 'red');
%t1.color = 'red'
t2 = text(Text_X,Text_Y2,str2,'Color', 'green');
t3 = text(Text_X,Text_Y3,str3,'Color', 'blue');

% text(x_int*1.2,y_int*1.05,str1);
% text(x_int2(end),y_int2(end)*0.9,str2);
% text(x_int3*1.2,y_int3*1.05,str3);