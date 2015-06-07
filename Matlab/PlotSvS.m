function PlotSvS(Data1,Data2, Data3,Data4)
%% Plotting our data
%plot our data
tempFig = figure('Name','Stress Vs Strain Graph','NumberTitle','off', 'Toolbar','none');
plot(Data1,Data2);
hold all
if Data4 == 1
    axis([0 0.052 0 3.35*10^5])
    title('6061: Stress Vs Strain Graph');
    else
    axis([0 0.052 0 6*10^5])
    title('7075: Stress Vs Strain Graph');
end
%axis([0 0.052 0 0.052]) %Debug
xlabel('Stress (%)');
ylabel('Strain (MPa)');

%% Reading Youngs Mod
% We use the Data Cursor to read off our stress/strain graph
YoungMod = Data3; %0.001506/0.00439 %0.00439/0.001506


%% Reading & Plotting the Intersection
% We are able to read off our intersection of <0.007985,0.001541>
% EDIT: We want to use the function 'intersections' to grab our
% intersections.

% Plot Proportional Limit and Modulus line
A = linspace(0,0.4,200); 
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
hold on
% line(C,D)
% line(A,B)
% line(E,F)
plot(x_int(end),y_int(end), 'k*');
plot(x_int2(end),y_int2(end), 'k*');
plot(x_int3(end),y_int3(end), 'k*');

plot(A,B,'g'); %Green is Proportional
plot(C,D,'r'); %Red is 2%
plot(E,F,'b'); %Blue is Under Load
YieldStrength_2Percent = [x_int y_int];
YieldStrength_Load = [x_int3 y_int3];
%str1 = '\leftarrow 2% Yield @' num2str(x_int)  ','  num2str(y_int);
str1 = sprintf('Proportional Limit \n & modulus \n@ [%0.4f , %0.2f]', x_int2(end),y_int2(end));
str2 = sprintf('2%% Yield \n@ [%0.4f , %0.2f]', x_int,y_int);
str3 = sprintf('Yield Strength 0.5%% \n Extention Under Load \n@ [%0.4f , %0.2f]', x_int3,y_int3);

str4 = sprintf('Youngs Modulus \n %3.2f GPa', Data3*10^-6);

Text_X = 0.0327
Base_Y = 260139

if Data4 == 1
    Text_Y1 = Base_Y*0.7
    Text_Y2 = Base_Y*0.5
    Text_Y3 = Base_Y*0.3
else
    Text_Y1 = Base_Y*0.7*2
    Text_Y2 = Base_Y*0.5*2
    Text_Y3 = Base_Y*0.3*2
end

t2 = text(Text_X,Text_Y1,str1,'Color', 'green');
t1 = text(Text_X,Text_Y2, str2,'Color', 'red');
t3 = text(Text_X,Text_Y3,str3,'Color', 'blue');

t4 = text(Text_X*0.5,Text_Y1,str4,'Color','green')


%% Let's Save the figures
% We save the images using the saveas function

if Data4 == 1
    saveas(tempFig,'Output\6061_Figure','bmp');
    saveas(tempFig,'Output\6061_Figure','jpg');
else
    saveas(tempFig,'Output\7075_Figure','bmp');
    saveas(tempFig,'Output\7075_Figure','jpg');
end


