function [pop_fit] = calculateFitness(Target,population,popsize,generation)
a = length(population); % Finds length of population and saves it to var a
pop_fit = zeros(a,1); % preallocates popfit cell in size of original population
pop = char(population); % converts population into type char and saves it to var pop
strings_compared = zeros(size(Target)); % preallocates strings compared with all zeros in size of length of target phrase
for i = 1:popsize
    size_match = 0; %preallocates size_match to zero every time i is ittirated 
    cell_index = population{i,generation}; %Cell_index is a particular row of a cell in population
    for j = 1:length(Target) 
        strings_compared = (strcmp(cell_index(1,j),Target(1,j))); %elementaly compares population and Target phrase
        if strings_compared == 1
            size_match = size_match + 1; %size_match increases by 1 every time there is a match to the target phrase
        else
            size_match = size_match; %if there is no match, size_match doesnt change
        end
    end
    pop_fit(i) = (size_match)/(length(Target)); %calculates fitness of each row in cell by dividing the amount of matches by the length of the target
end 
end