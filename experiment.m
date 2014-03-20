% Author: Shiraz Qayyum

% Call the MEME_application a number of times with different parameters
load('trace.mat');

% Changing memory experiments %
max_mem = 7;
results_simple_range_150 = zeros(1000, size(trace, 2) - (max_mem - 1), max_mem - 1);

for i = 1 : max_mem - 1
    result = MEME_application(150, i, 0, trace);
    results_simple_range_150(:,:,i) = result(:, max_mem - i : end);
end

save('results_simple_range_150','results_simple_range_150');
