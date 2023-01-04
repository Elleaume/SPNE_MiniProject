function [vector, indexes] = shuffle(v)
    indexes = randperm(length(v));
    vector= v(indexes);
end