%Script for Profit Calculations:
%Written by: Payton Schubel (10/17/21)

ldopa_g = [43.45 23.79 11.26 48.05]; 
%ldopa = g of LDOPA produced (Glu Batch, Glu Fed-Batch, Gal Batch, Gal Fed-Batch)
sugar_g = [125 65 125 65]; %g sugar used (glu Batch, Glu fed-batch, gal-batch, gal fed-bath)
molWeightSugar = 12.01*6+12*1.01+6*16; %molecular weight of sugar (both glu and gal)
sugar_mol = sugar_g ./ molWeightSugar;

revenue = ldopa_g .* 2.40; %revenue = amount of ldopa * $/g of ldopa
cost = [0 0 0 0];

for i = 1:length(cost)    
    %Glucose
    if i < 3
        ammonia_mol = 0.8*sugar_mol(i); %From balanced equation, mol(ammonia)/mol(glucose)
        sugar_cost = 0.000457; %glucose $/g
    end
    %Galactose
    if i >= 3
        ammonia_mol = 0.87*sugar_mol(i); %From balanced equation, mol(ammonia)/mol(galactose)
        sugar_cost = 0.057; %galactose $/g
    end
    ammonia_g = ammonia_mol*(14.01 + 1.01*3); %mol ammonia * molecular weight ammonia
    cost(i) = ammonia_g*(0.044)+sugar_g(i)*sugar_cost; %multiply both significant inputs by cost
end

profit = revenue-cost;
disp(cost);
disp(revenue);
disp(profit);