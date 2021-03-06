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

h_50 = figure
hold on
errorbar(x, mean(avg_mem_range_50, 1)*b, std(avg_mem_range_50, 0,1)/8,'-bs', 'MarkerSize' , 10, 'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.1,0.56,0.61]);
errorbar(x, mean(avg_simple_range_50, 1)*b, std(avg_simple_range_50, 0,1)/8,'r-o', 'MarkerSize' , 10, 'MarkerEdgeColor','k',...
    'MarkerFaceColor',[.94,0.99,0.0]);
xlabel('same consecutive direction prediction','FontSize', 15) % x-axis label
ylabel('% of successful downloads','FontSize', 15) % y-

legend('MEME','Without direction knowledge','FontSize', 20)
annotation('textbox', [0.58,0.6,0.1,0.1],...
           'String', 'Communication range = 50m');
set(gca,'FontSize',15);
hold off
        

saveas(h_50,'plot_range_50','pdf')






% ############### plot range 100 ################## %

avg_mem_range_100 = zeros(1000, mem_max);
x = 1 : mem_max;
for i = 1 : mem_max
    val = sum(results_mem_range_100(:, :, i), 2);
    val = val ./ size(results_mem_range_100,2);
    avg_mem_range_100(:, i) = val;
end
avg_mem_range_100 = avg_mem_range_100 * 100;


avg_simple_range_100 = zeros(1000, mem_max);
x = 1 : mem_max;
for i = 1 : mem_max
    val = sum(results_simple_range_100(:, :, i), 2);
    val = val ./ size(results_simple_range_100,2);
    avg_simple_range_100(:, i) = val;
end
avg_simple_range_100 = avg_simple_range_100 * 100;

h_100 = figure
hold on
errorbar(x, mean(avg_mem_range_100, 1)*b, std(avg_mem_range_100, 0,1)/8,'-bs', 'MarkerSize' , 10, 'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.1,0.56,0.61]);
errorbar(x, mean(avg_simple_range_100, 1)*b, std(avg_simple_range_100, 0,1)/8,'r-o', 'MarkerSize' , 10, 'MarkerEdgeColor','k',...
    'MarkerFaceColor',[.94,0.99,0.0]);
xlabel('same consecutive direction prediction','FontSize', 15) % x-axis label
ylabel('% of successful downloads','FontSize', 15) % y-

legend('MEME','Without direction knowledge','FontSize', 20)
annotation('textbox', [0.58,0.6,0.1,0.1],...
           'String', 'Communication range = 100m');

set(gca,'FontSize',15);       
hold off


saveas(h_100,'plot_range_100','pdf')


% ############### plot range 50 ################## %

avg_mem_range_150 = zeros(1000, mem_max);
x = 1 : mem_max;
for i = 1 : mem_max
    val = sum(results_mem_range_150(:, :, i), 2);
    val = val ./ size(results_mem_range_150,2);
    avg_mem_range_150(:, i) = val;
end
avg_mem_range_150 = avg_mem_range_150 * 100;


avg_simple_range_150 = zeros(1000, mem_max);
x = 1 : mem_max;
for i = 1 : mem_max
    val = sum(results_simple_range_150(:, :, i), 2);
    val = val ./ size(results_simple_range_150,2);
    avg_simple_range_150(:, i) = val;
end
avg_simple_range_150 = avg_simple_range_150 * 100;

h_150 = figure
hold on
errorbar(x, mean(avg_mem_range_150, 1)*b, std(avg_mem_range_150, 0,1)/8,'-bs', 'MarkerSize' , 10, 'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.1,0.56,0.61]);
errorbar(x, mean(avg_simple_range_150, 1)*b, std(avg_simple_range_150, 0,1)/8,'r-o', 'MarkerSize' , 10, 'MarkerEdgeColor','k',...
    'MarkerFaceColor',[.94,0.99,0.0]);
xlabel('same consecutive direction prediction','FontSize', 15) % x-axis label
ylabel('% of successful downloads','FontSize', 15) % y-

legend('MEME','Without direction knowledge','FontSize', 20)
annotation('textbox', [0.58,0.6,0.1,0.1],...
           'String', 'Communication range = 150m');
set(gca,'FontSize',15);
hold off

saveas(h_150,'plot_range_150','pdf')

%ciplot(mean(avg_mem_range_50, 1), -1*mean(avg_mem_range_50, 1))