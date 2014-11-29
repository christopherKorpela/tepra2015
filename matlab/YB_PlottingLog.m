clear all
close all
clc

%set(0,'DefaultTextFontName','Times',...
%'DefaultTextFontSize',18,...
%'DefaultAxesFontName','Times',...
%'DefaultAxesFontSize',18,...
%'DefaultLineLineWidth',1,...
%'DefaultLineMarkerSize',7.75);

% References
% http://www.ece.utah.edu/~harrison/ece6721/MATLAB_curve_fitting.pdf
% http://gubner.ece.wisc.edu/matlabLaTeXandIEEE/matlabPlotForIEEEtran.pdf

%% Quick & dirty data plotting..why the fuck is it named this??
[FileName,PathName] = uigetfile('*.xlsx','Select the Log File to Import');
fileToRead= [PathName,FileName];
Log = xlsread(fileToRead);
%Log = textread(fileToRead);
clear fileToRead1 PathName FileName 

%% Plot
%sampling = 0.05;
%[row,~] = size(Log)
%t = 0:sampling:row*sampling-sampling;

x = Log(:,2);
gas_actual = Log(:,3);
figure(1)
fit1 = polyfit(x, gas_actual, 1);
plot(x, gas_actual, 'o', x, fit1(1)*x+fit1(2));
hold on; grid on;
% With 24 hour preheat
title('Methane(CH4) Test1')
legend('Gas (Actual)','Gas (Fitted)');
xlabel('Sensor Output [raw]');
ylabel('Gas Concentration [ppm]');
hold off

lethal = Log(:,5);
figure(2)
fit2 = polyfit(x, lethal, 1);
plot(x, lethal, 'o', x, fit2(1)*x+fit2(2));
hold on; grid on;
title('Methane(CH4) - Toxic Level Test1')
legend('Gas (Actual)','Gas (Fitted)');
xlabel('Sensor Output [raw]');
ylabel('Gas Concentration [ppm]');
hold off