%% SIRsolver.m
% Owner: Team 6
% Date initiated: 8/13/2020
% Date last modified: 9/12/2020

%% Workspace initiation
clear, format short e, figure(1), clf

%% Establishing constants
umax = 0.75; %inverse hrs
yxs = 0.45; %g/g
kd = 0.018; %inverse hrs
f=1; %L/hr
c = 10; %g/L
a = 0.22 %no unit
b = 0; %no unit
ks = 67e-6; %g/L
Const = [umax,yxs,f,a,b,kd,ks,c];         %C(1)=umax, C(2)=yxs, C(3) = flow rate (f), C(4) = a, C(5) = b,
%C(6)= kd, C(8) = ks
tspan = linspace(0,15,1000);        
yinit = [1,5,0,10];  %[g/L,g/L,g/L,L]              %x(1)=X, x(2)=S,x(3) =P

%% Solving ODE system
DiffFileName = 'fedbatchglucose';
DE = eval(sprintf('@(t,x,C) %s(t,x,C)', DiffFileName));
[tout, yout] = ode45(@(t,x) DE(t,x,Const), tspan, yinit);

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

b = yout(:,1);
p = yout(:,3);
V = yout(:,4);
Ecoli = b(end)*V(end) %mass of E.Coli at steady state
Ecolic = b(end)      %concentration of E.Coli at steady state
product = p(end)*V(end) %mass of product at steady state
productc = p(end) %concentration of product at steady state