function [MatingPool] = buildMatingPool(pop_fit,tickets,Target)
%This function normalizes fitness values in-order to give fitter members
%more probability of being chosen. Each element of the mating pool is a
%'ticket' and also contains an index to the member of population in
%question
normFit = pop_fit/(max(pop_fit)); %Normalizes fitness, fittest mebers get maximum amount of tickets
MatingPool = []; %Preallocates mating pool vector
PoolTickets = normFit*tickets; % Determines amount of tickets given to each member
for i = 1:length(PoolTickets)
    for j = 1:PoolTickets(i,1)
        MatingPool = [MatingPool   i]; % Each element in mating pool is an index to a member of current generation
    end
end
end