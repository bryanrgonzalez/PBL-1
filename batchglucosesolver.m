%% SIRsolver.m
% Owner: Team 6
% Date initiated: 8/13/2020
% Date last modified: 9/12/2020

%% Workspace initiation
clear, format short e, figure(1), clf

%% Establishing constants
umax = 0.78; %inverse hrs
yxs = 0.3; % g/g
kd = 0.018; %inverse hrs
r=0; % g/hr
a = 1.02; %no unit
b = 0; %no unit
ks = 0.08; % g/L
V = 25; %L
Const = [umax,yxs,r,a,b,kd,ks];         %C(1)=umax, C(2)=yxs, C(3) = replacement rate (r), C(4) = a, C(5) = b,
%C(6)= kd, C(8) = ks
tspan = linspace(0,5,150);        
yinit = [1,5,0];  %[g/L,g/L,g/L]              %x(1)=X, x(2)=S,x(3) =P

%% Solving ODE system
DiffFileName = 'batchglucose';
DE = eval(sprintf('@(t,x,C) %s(t,x,C)', DiffFileName));
[tout, yout] = ode45(@(t,x) DE(t,x,Const), tspan, yinit);

figure
hold on
plot(tout,yout(:,1),'k-')

plot(tout,yout(:,2),'b-')

plot(tout,yout(:,3),'r-')
hold off

title('Concentration of E.coli, glucose, and L-DOPA (Batch)')
xlabel('Time (hrs)')
ylabel('Concentration (g/L)')
legend('Bacteria', 'glucose', 'L-DOPA')


figure
plot(tout, V*yout(:,3),'k-')
title('Total product formation utilizing glucose (Batch)')
xlabel('Time (hrs)')
ylabel('Amount of L-Dopa (g)')

b = yout(:,1);
p = yout(:,3);
Ecoli = b(end)*V %mass of E.Coli at steady state
Ecolic = b(end)  %concentration of E.Coli at steady state
product = p(end)*V %mass of product at steady state
productc = p(end)  %concentration of product at steady state
