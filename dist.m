%dist(pausept(newmember(1),:), pausept(idx(i),:)')


function r = dist(a,b)

r = sqrt(sum((a-b').^2));

end