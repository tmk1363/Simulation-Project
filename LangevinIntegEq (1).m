clc

%define Gaussian white noise
mu=0; % mu is the mean of the gaussian 
sigma= 0; % standard deviation of the gaussian
L= 1000; % dimension of the gaussian noise in this case a vector with 100 elements
noise = sigma+ randn(L,1)+mu;
%plot(noise)

% Define Varaibles
% t, Tau, D , White noise , x
x0=0;
Tau=0.5;
D=1;

dt=0.1;
% Differential equation
% x(t0)= dt *(x(t0)/Tau +2*sqr(t)*D*white noise)
% Discretize t
dt=0.01;
t= 0:dt:10;

x=x0;
nx=x0;

for j=1:1000
    u=0;
    nx=0;
    x=0;
for i = 1:j
nx= x+ exp(u/Tau)*dt*noise(i);
x=nx;
u=u+dt;
end
xx(j)=exp(-u/Tau)*x;
end

f1 = figure;            %Create figure and save handle
h1 = plot( xx);        %Plot the data vector against the time vector
xlabel('Time (s)')     %Label the horizontal axis
ylabel('X (t)')         %Label the vertical axis
title('X vs. Time')     %Give the plot a title
mean(xx)
std(xx)
