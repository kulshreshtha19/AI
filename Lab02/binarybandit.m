Q = zeros(1,2);
N = zeros(1,2);
global W
W = [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1];
epsilon = 0.1;
x = zeros(1,1000);
r = zeros(1,1000);
sumr = 0;
for iter = 1:10000
    x(iter) = iter;
    if rand>epsilon
        [m,id] = max(Q);
        A = id;
    else 
        temp = randperm(2);
        A = temp(1);
    end
    for temp= 1:length(W)
        W(temp) = W(temp) + 0.01*randn;
    end
     
    R = W(A);
    sumr = sumr + R;
    r(iter) = sumr/iter;
    N(A) = N(A)+1;
    Q(A) = Q(A)+(R-Q(A))/N(A);
end
disp(W)
plot(x,r)