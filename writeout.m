% This file is used to direct the traces obtained after running the SLAW
% mobility model to an output data file (one file at a time)

C = trace (2,:,:);

fd = fopen ('2.dat','w');

for i = 1:240
    for j = 1:3
        fprintf (fd, '%8.2f\t', C(1,i,j));
    end
    fprintf (fd, '\n');
end

fclose (fd);
        