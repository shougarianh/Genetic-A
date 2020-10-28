function [mutated_child] = causeMutation(child,mutation_rate)
for i = 1:length(child) %For every character making up variable child
    a = randi([1,100]); % a equals a randomn number in range of 1 to 100
    b = ceil(100*mutation_rate); %b is the mutation rate times 100 
    if a == b %if a and b are the same
        characters = [32 65:90 97:122]; %specifies available characters
        new_char = randi(length(characters));% picks randomn character
        child(i) = char(characters(new_char)); %replaces one character of child with a randomn character
    end
end
mutated_child = child;
end
    
    