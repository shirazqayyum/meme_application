% Author: Shiraz Qayyum %

function [ res ] = euclidean_distance( pivot, all )

    pivot_matrix = repmat(pivot, size(all, 1), 1);
    x = all - pivot_matrix;
    res = sqrt(sum(x.^2,2));
end

