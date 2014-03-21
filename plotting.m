% Author: Shiraz Qayyum %
% Plotting results

load('results_mem_range_50.mat');
load('results_mem_range_100.mat');
load('results_mem_range_150.mat');
load('results_simple_range_50.mat');
load('results_simple_range_100.mat');
load('results_simple_range_150.mat');

r = eye(6);
b=[r(2,:); r(1,:); r(3:end, :)];

mem_max = 6;
% ############### plot range 50 ################## %

avg_mem_range_50 = zeros(1000, mem_max);
x = 1 : mem_max;
for i = 1 : mem_max
    val = sum(results_mem_range_50(:, :, i), 2);
    val = val ./ size(results_mem_range_50,2);
    avg_mem_range_50(:, i) = val;
end
avg_mem_range_50 = avg_mem_range_50 * 100;


avg_simple_range_50 = zeros(1000, mem_max);
x = 1 : mem_max;
for i = 1 : mem_max
    val = sum(results_simple_range_50(:, :, i), 2);
    val = val ./ size(results_simple_range_50,2);
    avg_simple_range_50(:, i) = val;
end
avg_simple_range_50 = avg_simple_range_50 * 100;

figure
hold on
errorbar(x, mean(avg_mem_range_50, 1)*b, std(avg_mem_range_50, 0,1)/8,'-.bs', 'MarkerSize' , 10, 'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.1,0.56,0.61]);
errorbar(x, mean(avg_simple_range_50, 1)*b, std(avg_simple_range_50, 0,1)/8,'r--o', 'MarkerSize' , 10, 'MarkerEdgeColor','k',...
    'MarkerFaceColor',[.94,0.99,0.0]);
xlabel('no. of memory values used','FontSize', 15) % x-axis label
ylabel('% of successful downloads','FontSize', 15) % y-
hold off
                                                                        

%ciplot(mean(avg_mem_range_50, 1), -1*mean(avg_mem_range_50, 1))