% Author: Shiraz Qayyum %

% --------------------------------------------------
% Application of MEME: video sharing using clusters %
% --------------------------------------------------

% MEME running or not?
MEME = 0;

load('trace.mat');

% MEME memory %
mem = 3;

% Communication range
RANGE = 100;

% Should be equal to the number of rows in trace.mat %
total_nodes = size(trace, 1);

% Service up-time 
service = ones(1, size(trace, 2));
SERVICE_UP = 1;
SERVICE_DOWN = 0;

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
     
     if ( MEME )

         % [1 1 1 0 0 0] if sum is taken of last three (memory) terms and
         % is zero; means moving away. If that is the case, we are in a bad
         % situation and try doing something about it
         s = sum(distances_diff(helper, time - mem : time - 1)); 
         if ( s == 0 )
             within_range = ( distances(:, time) <= RANGE) & ( distances(:, time) > 0 );         % nodes that are within range
             continuous_closer = sum(distances_diff(:, time - mem : time - 1), 2) == mem;       % nodes that are continuous moving closer
             candidates = find(within_range & continuous_closer);                               % intersection of above two (the good candidates)

             if ( ~isempty(candidates) )
                 display('non-empty');
                 [min_val min_index] = min(distances(candidates, time) - (RANGE/2) );           % among candidates find a helper closest to mid range
                 helper = candidates(min_index); 
             end
         end
     
     end
     
     
     
     % Bad times - no one is in the range to share the burden %
     if ( distances(helper, time) > RANGE )
        display('bad times, helper is not in range');
        service(time) = SERVICE_DOWN;
         
        % try getting any helper within range
        possible_back_ups = find( (distances(:, time) <= RANGE) & ( distances(:, time) > 0 ));
        
        if ( ~isempty(possible_back_ups) )
            display('atleast someone else is found in bad times');
            helper = possible_back_ups(1);
        end
         
     end
         
         
     %scatter(trace(:,ctr,1), trace(:,ctr,2),s ,c,'LineWidth',1.5)
     %pause(.5);
 end
 
 result = service(1, mem + 1: end);