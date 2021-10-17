%% SIRsolver.m
% Owner: Team 6
% Date initiated: 8/13/2020
% Date last modified: 10/17/2021

%% Workspace initiation
clear, format short e, figure(1), clf

%% Establishing constants
umax = 0.78; %growth rate (inverse hrs)
yxs = 0.3; % yield of biomass over substrate (g/g)
kd = 0.018; % death rate (inverse hrs)
r=0; % replacement rate (g/hr); 0 in batch reactions
a = 1.02; %yield of product over biomass (g/g)
b = 0; %neglected in production formation equation
ks = 0.08; %substrate concentration at which growth rate is half the maximum growth rate (g/L)
V = 25; %volume (L)
Const = [umax,yxs,r,a,b,kd,ks]; %C(1)=umax, C(2)=yxs, C(3) = replacement rate (r), C(4) = a, C(5) = b, C(6)= kd, C(7) = ks
tspan = linspace(0,5,150); %create a time span for reaction       
yinit = [1,5,0];  %[initial bacterial concentration (g/L),initial sugar concentration (g/L),initial product concentration (g/L)]              %x(1)=X, x(2)=S,x(3) =P

%% Solving ODE system
DiffFileName = 'batchglucose';
DE = eval(sprintf('@(t,x,C) %s(t,x,C)', DiffFileName));
[tout, yout] = ode45(@(t,x) DE(t,x,Const), tspan, yinit);

%plotting the figures
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

%calculating the values at steady state
b = yout(:,1);
p = yout(:,3);
Ecoli = b(end)*V %mass of E.Coli at steady state
Ecolic = b(end)  %concentration of E.Coli at steady state
product = p(end)*V %mass of product at steady state
productc = p(end)  %concentration of product at steady state
