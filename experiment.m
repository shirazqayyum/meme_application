% Author: Shiraz Qayyum

% Call the MEME_application a number of times with different parameters
load('trace.mat');

% Changing memory experiments %
max_mem = 7;
results_mem_range_100 = zeros(max_mem - 1, 1);
for i = 1 : max_mem - 1
    result = MEME_application(150, i, 0, trace);
    results_mem_range_100(i, 1) = sum(sum(result(:, max_mem - i : end)));
end