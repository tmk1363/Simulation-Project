xmin=0;
xmax=2;
N= 200;
dt =0.001;
t=0;
tmax=0.5;
Tau=1;
D=0.01;
A=1;
%discretize the domain
dx=(xmax-xmin)/N;
x= xmin-dx:dx:xmax+dx;
%set initial condition
p0=exp(-((x-1).^2)/(2*Tau*D));

f1= figure;
h1= plot(x,p0);
xlabel("x")
ylabel("y")
title('p0')
shg

p=p0;
pnp1=p0;

% loop through time
nsteps= tmax/dt;
for n=1 : nsteps
    % calculate boundary condition
    %p(1)=-p(N+2);
    % calculate the FOU
    for i = 2: N+2
        pnp1(i)=p(i)+dt*(p(i)/Tau)+ dt*(x(i)/Tau)*((p(i+1)-p(i))/dx)+ dt*D*((p(i+1)-2*p(i)+p(i-1))/(dx^2))-dt*(A*x(i)*p(i));

    end
    
    t=t+dt
    p=pnp1

    plot(x,p,'bo-','markerfacecolor','b');
    shg
    %pause(dt);
   
    %D=0.005*randn();
    
    
end;
