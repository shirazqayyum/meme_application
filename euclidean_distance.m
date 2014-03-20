function [ res ] = euclidean_distance( pivot, all )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    pivot_matrix = repmat(pivot, size(all, 1), 1);
    x = all - pivot_matrix;
    res = sqrt(sum(x.^2,2));
end

