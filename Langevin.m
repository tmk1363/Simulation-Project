
%define Gaussian white noise
mu=0; % mu is the mean of the gaussian 
sigma= 1; % standard deviation of the gaussian
L= 100; % dimension of the gaussian noise in this case a vector with 100 elements
noise = sigma+ randn(L,1)+mu
plot(noise)

% Define Varaibles
% t, Tau, D , White noise , x
x0=0.8;
Tau=0.15;
D=2.5;

dt=0.1;
% Differential equation
% x(t0)= dt *(x(t0)/Tau +2*sqr(t)*D*white noise)
% Discretize t
dt=0.1;
t= 0 :dt:6;

x=x0;
for i = 1:60
x(i+1)=x(i)+ dt* (-(x(i)/Tau) + (2*sqrt(2*D)*noise(i)))

end

f1 = figure;            %Create figure and save handle
h1 = bar(t, x);        %Plot the data vector against the time vector
xlabel('Time (s)')     %Label the horizontal axis
ylabel('X (t)')         %Label the vertical axis
title('X vs. Time')     %Give the plot a title



% In this part of the code I am putting some filters on the above time
% serries to 
A=1;
xtresh=1.3;

for i = 1:60
   
        
        if x(i) >= xtresh
            y(i) = A*x(i);
        else
            y(i)=0;
        
        end
        
   
end



f2 = figure;            %Create figure and save handle
h2 = bar (y);        %Plot the data vector against the time vector
xlabel('Time (s)')     %Label the horizontal axis
ylabel('y (t)')         %Label the vertical axis
title('y vs. Time')     %Give the plot a title
