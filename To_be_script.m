%Haik Shougarian 
%Zagrodsky, section:112
%Main script for "To be or not to be" assignment
%Create population
clear ; clc
%Defining a Target 
tic;
% prompt for target phrase
Target = 'To be or not to be'; % string is saved as Target
%Build initial population
popsize = input('Enter the size of initial population: '); % prompt for pop size
MaximumGen = input('Enter maximum number of generations: ');
generation = 1; % first generation of population
%%buildPopulation function takes inputs; popsize,Target,generation, and
%%creates a population of randomn data sets in size of popsize with elements in it of size of
%%the Target string
population = buildPopulation(popsize,Target,generation);
pop_fit = zeros(popsize);
most_fit = 0;
avgfit = zeros(MaximumGen);
%While generation is less than maximum generation and target is not found
avgfit = 0;
while generation <= MaximumGen  && most_fit ~= 1
    %Calculate Fitness of population
    % This function compares each member of the population to the Target
    % string. If there is a match in elemental data of a particular member
    % of population, one is added to a running score. Once all data has
    % been compared to the target, the running score (number of matches) is
    % divided by the number of elements of the member of population to get
    % a fitness score which is stored in cell array pop_fit
    pop_fit = calculateFitness(Target,population,popsize,generation);
    avgfit(generation,1) = (sum(pop_fit))/popsize;
    mostfit(generation,1) = max(pop_fit);
    most_fit = mostfit(generation,1);
    mostfitmember = find(pop_fit == most_fit);
    bestString{generation} = population{mostfitmember,generation};
    fprintf('Most fit member: %s\n  Generation: %d\n',bestString{generation},generation);
    %Build mating pool
    % A mating pool is created by giving each member of the population a
    % certain number of "tickets". This is done based on fitness, the
    % higher the fitness, the greater the amount of tickets the member has.
    tickets = 10 ;
    MatingPool = buildMatingPool(pop_fit,tickets,Target);
    NumTicks = length(MatingPool);
    %Two parents are selected at randomn from the mating pool
    for i = 1:popsize
        parent1index = randi([1   NumTicks]);
        parent2index = randi([1   NumTicks]);
        if parent1index == parent2index
            parent2index = randi([1  NumTicks]);
        end
        parent1_index = MatingPool(1,parent1index);
        parent2_index = MatingPool(1,parent2index);
    %Breed child
    %A child is bread from two uniquely and randomly chosen parents 
    child = breed(parent1_index,parent2_index,population,Target,generation);
    %Mutate Child
    % Cause mutation function is a function that may or may not cause a
    % mutation in the child based on a mutation rate.
    mutation_rate = .01;
    mutated_child = causeMutation(child,mutation_rate);
    %Build new population
    population{i,generation+1} = char(mutated_child);
    end
    generation = generation + 1;
end
toc;
%Plot of average and maximum fitness per generation is created in this
%section
fprintf('Total Generations: %.d',generation-1);
figure
plot(1:generation-1,avgfit)
xlabel('Generation');
ylabel('Average Fitness');
title('Avg. and Maximum Fitness Vs. Generation');
hold on
plot(1:generation-1,mostfit)
legend('Average Fitness','Maximum Fitness');
%Genetic diversity is defined by the difference between maximum fitness and
%average fitness. Plot of genetic diversity per generation is then created
figure
Diversity = mostfit - avgfit;
plot(1:generation-1,Diversity)
xlabel('Generation');
ylabel('Genetic Diversity');
title('Genetic Diversity Vs. Generation');
%Typewrtiter is created
fileID = fopen('Typewriter.txt','w');
%Generation, maximum fitness, average fitness and the best strings from
%each generation are put into a file
fprintf(fileID, '%10s %15s %15s %15s %24s\n','Generation', 'Max Fitness','Avg Fitness','Diversity','Best String');
for i = 1:generation-1
    fprintf(fileID, '%10d %15.3f %15.3f %15.3f %24s\n',i,mostfit(i),avgfit(i),Diversity(i), bestString{i});
end
fclose(fileID);

