close all
clear all
t = 10000; 

P = [0.25, 0.45, 0.3;
    0.8, 0.15, 0.05;
    0.1, 0.75, 0.15];

first_pos = 1;
first_vec = [1 0 0];
actual_pos = first_pos;

first_pos = actual_pos;
    actual_vec = zeros(1,t);
    for i =1:t
        actual_vec(i) = first_pos;
        rand_num = rand(1,1); 
        P_sum = 0; 
        for j = 1:length(P(first_pos,:)) 
            P_sum = P_sum + P(first_pos,j); 
            if rand_num < P_sum  
                first_pos = j; 
                break;
            end
        end
    end
    
statDis = zeros(1,3);

statDis(1) = sum(actual_vec(:) == 1);
statDis(2) = sum(actual_vec(:) == 2);
statDis(3) = sum(actual_vec(:) == 3);

statDis(:) = statDis(:) / t;

disp('pract') 
disp(statDis)


theor = first_vec * P ^ 1000; 
disp('theor')
disp(theor(1,:))