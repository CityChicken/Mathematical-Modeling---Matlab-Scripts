%%HW 5 Problem 3%%%
function str = Program_Risk_Quantification
Program_Elem = {'Performance Requirements'; 'Performance Architecture Design Solutions'; 'Cost'; 'Schedule'};
Characteristics = {'Weights'; 'Likelihood'; 'Consequence'};
Weights = [0.10 0.15 0.50 0.25];
Likelihood = [4 3 2 1];
Consequence = [1 2 5 3];
T = table(Weights', Likelihood', Consequence', 'RowNames', Program_Elem, 'VariableNames', Characteristics)
EL = Weights*Likelihood'
EC = Weights*(Likelihood.*Consequence)'/EL

PRMM(EL,EC)     