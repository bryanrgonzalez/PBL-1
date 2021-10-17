
% glucose
%Generalized formula for balanced glucose equation
% x1(C6H12O6) + x2(NH3) + x3(O2) = x4(C9H11NO4) + x5(CH1.77O0.49N0.24) +
% x6(H2O) + x7(CO2)

%Lines of A -
%First: Sets x1 = 1
%Second: Balances Carbons
%Third: Balanced Hydrogens
%Fourth: Balance Oxygens
%Fifth: Balance Nitrogens
%Sixth: Account for Respiratory Quotient (1.03 works)
%Seventh: Account for biomass yield of glucose
A = [1      0       0       0       0       0       0;
    6       0       0       -9      -1      0       -1;
    12      3       0       -11     -1.77   -2      0;
    6       0       2       -4      -0.49   -1      -2;
    0       1       0       -1      -0.24   0       0;
    0       0       1.03    0       0       0       -1;
    2.16    0       0       0       -1      0       0];

%1 sets biomass to 1, 0 says that everything else should balance
b = [1; 0; 0; 0; 0; 0; 0];

%Solve for coefficients
x = A\b;

% galactose
%Generalized balanced equation for galactose
% x1(C6H12O6) + x2(NH3) + x3(O2) = x4(C9H11NO4) + x5(CH1.77O0.49N0.24) +
% x6(H2O) + x7(CO2)

%First: Sets x1 = 1
%Second: Balances Carbons
%Third: Balanced Hydrogens
%Fourth: Balance Oxygens
%Fifth: Balance Nitrogens
%Sixth: Account for Respiratory Quotient (1.03 works)
%Seventh: Account for biomass yield of galactose
C = [1      0       0       0       0       0       0;
    6       0       0       -9      -1      0       -1;
    12      3       0       -11     -1.77   -2      0;
    6       0       2       -4      -0.49   -1      -2;
    0       1       0       -1      -0.24   0       0;
    0       0       1.03    0       0       0       -1;
    3.24    0       0       0       -1      0       0];

%1 sets biomass to 1, 0 says that everything else should balance
d = [1; 0; 0; 0; 0; 0; 0];

%Solve for coefficients
y = C\d;

%Displays results for easy viewing
disp("glucose eqn coeffs")
disp(x)
disp("galactose eqn coeffs")
disp(y)