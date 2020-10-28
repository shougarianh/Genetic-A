function [population] = buildPopulation(popsize,Target,generation)
char_val = [32 65:90 97:122]; %Char_val is created with numbers corresponding to letters in alphabet
for i = 1:popsize %for loop from 1:size of population
    population{i,generation} = char(char_val(randi([1 53],1,length(Target)))); %randomn numbers chosen from char_val are used to created strings
    % of length of Target string, char is used to convert numbers to
    % corresponding characters
end
population = population;
end
