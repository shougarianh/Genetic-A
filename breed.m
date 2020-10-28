function [child] = breed(parent1_index,parent2_index,population,Target,generation)
parent1 = char(population{parent1_index,generation}); %Parent 1 is called 
parent2 = char(population{parent2_index,generation}); %Parent 2 is called
midpoint = randi([1,length(Target)]); % Randmon midpoint is chosen
child = [parent1(1:midpoint),parent2((midpoint+1):length(Target))]; 
% the child is a combination of the two parents staring at a randomn midpoint point

% NOTE: I was not able to get the second method to function
%parent1 = char(population{parent1_index,generation});
%parent2 = char(population{parent2_index,generation});
%for i = 1:length(Target)
    %a = randi(1,length(Target));
    %if mod(a,2) == 0
        %child(i) = parent1(a);
    %else
        %child(i) = parent2(a);
    %end
%end
end
