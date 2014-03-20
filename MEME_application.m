% Author: Shiraz Qayyum %

% Application of MEME: video sharing using clusters %

load('trace.mat');

% MEME memory %
mem = 3;

% Communication range

RANGE = 100;

% Should be equal to the number of rows in trace.mat %
total_nodes = size(trace, 1)

% Generate the pivot node %
pivot = randi(total_nodes);
pivot = 2;

% Calculate the euclidean distance of pivot from all other nodes
% for the entire simulation run
distances = zeros(total_nodes, size(trace, 2));


for i = 1 : size(trace, 2)
    x = trace(:, i, 1:2);
    y = reshape(x, total_nodes, 2);
    res = euclidean_distance([trace(pivot, i, 1) trace(pivot, i, 2)], y);
    distances(:, i) = res;
end 

% Calculate the direction of motion
% 1 means closer or stationary.
% The num of columns will one less than that
% of distances.
distances_diff = diff(distances, 1, 2) <= 0;

% Generate the initial helper node %
close_nodes = find((distances(:, mem + 1) <= RANGE) & (distances(:, mem + 1) > 0));
helper = close_nodes(1, 1);

% figure;
% c = linspace(1,40,20);
% s = 60;
% 
 for time = (mem + 1) : size(trace,2)
     
     % [1 1 1 0 0 0] if sum is taken of last three (memory) terms and
     % is zero; means moving away. If that is the case, we are in a bad
     % situation and try doing something about it
     s = sum(distances_diff(helper, time - mem : time - 1)); 
     if ( s == 0 )
         within_range = (distances(:, time) <= RANGE) & ( distances(:, time) > 0 );         % nodes that are within range
         continuous_closer = sum(distances_diff(:, time - mem : time - 1), 2) == mem;       % nodes that are continuous moving closer
         candidates = find(within_range & continuous_closer);                               % intersection of above two (the good candidates)
         
         if ( ~isempty(candidates) )
             display('non-empty');
             
         end
     end
         
         
     %scatter(trace(:,ctr,1), trace(:,ctr,2),s ,c,'LineWidth',1.5)
     %pause(.5);
 end