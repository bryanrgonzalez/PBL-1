%% SIRsolver.m
% Owner: Team 6
% Date initiated: 8/13/2020
% Date last modified: 10/17/2021

%% Workspace initiation
clear, format short e, figure(1), clf

%% Establishing constants
umax = 0.75; %growth rate, inverse hrs
yxs = 0.45; %yield of biomass over substrate, g/g
kd = 0.018; %death rate, inverse hrs
f=1; %flow rate into the bioreactor, L/hr
c = 10; %concentration of glucose in the bioreactor, g/L
a = 0.22; %yield of product over biomass, g/g
b = 0; %change in product per E. coli, assumed to be zero
ks = 67e-6; %substrate concentration at which growth rate is half of the maximum, g/L
Const = [umax,yxs,f,a,b,kd,ks,c]; %C(1)=umax, C(2)=yxs, C(3) = flow rate (f), C(4) = a, C(5) = b, C(6)= kd, C(7) = ks, C(8) = c
tspan = linspace(0,15,1000); %Creates timespan for reaction (15hrs)       
yinit = [1,5,0,10];  %[g/L,g/L,g/L,L] %x(1)=X, x(2)=S,x(3)=P, x(4)=V

%% Solving ODE system
DiffFileName = 'fedbatchglucose';
DE = eval(sprintf('@(t,x,C) %s(t,x,C)', DiffFileName));
[tout, yout] = ode45(@(t,x) DE(t,x,Const), tspan, yinit);

%Plotting the figures
figure
hold on
plot(tout,yout(:,1),'k-')

plot(tout,yout(:,2),'b-')

plot(tout,yout(:,3),'r-')
hold off
title('Concentration of E.coli, galactose, L-DOPA (Fed-batch)')
xlabel('Time (hrs)')
ylabel('Concentration (g/L)')
legend('E.coli','galactose','L-DOPA')

figure
plot(tout,yout(:,3).*yout(:,4),'r-')
title('Total product formation utilizing galactose (Fed-batch)')
xlabel('Time (hrs)')
ylabel('Amount of L-Dopa (g)')

%Calculating the masses & concentrations at steady-state
b = yout(:,1);
p = yout(:,3);
V = yout(:,4);
Ecoli = b(end)*V(end) %mass of E.Coli at steady state
Ecolic = b(end)      %concentration of E.Coli at steady state
product = p(end)*V(end) %mass of product at steady state
productc = p(end) %concentration of product at steady state