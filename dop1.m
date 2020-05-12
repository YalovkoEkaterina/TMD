close all
clear all
t = 5; 
N = 10000;

P = [0.3 0.7;
    0.1 0.9];

P_pract = zeros(2, t); 
P_theor = zeros(2, t);

first_pos = 1; 
first_vec = [1 0]; 
actual_pos = first_pos;  

for i=1:N
    first_pos = actual_pos;
    actual_vec = zeros(1,t);
    for j =1:t
        actual_vec(j) = first_pos;
        rand_num = rand(1,1); 
        P_sum = 0; 
        for k = 1:length(P(first_pos,:))
            P_sum = P_sum + P(first_pos,k); 
            if rand_num < P_sum 
                first_pos = k; 
                break;
            end
        end
    end
    for j=1:t
        P_pract(actual_vec(j),j) = P_pract(actual_vec(j),j) + 1;
    end    
end

P_pract(1,:) = P_pract(1,:) / N;
P_pract(2,:) = P_pract(2,:) / N;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vec = first_vec;
for i = 1:t 
    P_theor(1,i) = vec(1); 
    P_theor(2,i) = vec(2); 
    vec = vec * P; 
end
    
figure;
xlabel('t');
ylabel('p');
plot(1:t,P_pract(1,:),'g',1:t,P_theor(1,:),'b',1:t,P_pract(2,:),'c',1:t,P_theor(2,:),'r');
legend('p0','p0 th','p1','p1 th');
grid on;