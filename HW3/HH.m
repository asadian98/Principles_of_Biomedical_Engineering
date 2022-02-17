% Hodgkin-Huxley model using Euler's method

clear; close; clf;

% maximal conductances (mS/cm^2); 1=K, 2=Na, 3=lk;
% membrane capacitance is 1 uF/cm^2
g_bar(1)=36; g_bar(2)=120; g_bar(3)=0.3;
% Voltage (mV) relative to resting potential; 1=K, 2=Na; 3=lk
E(1)=-12; E(2)=115; E(3)=10.613;
% variable initialization I_ext is in microamps/cm^2
% x(i): 1=K, 2=Na, 3=lk;
I_ext=0; V=-10; x=zeros(1,3); x(3)=1; t_rec=0;
t_final=40; % t_final sets the time span of the simulation

% Applied pulses parameters; T1=on time for pulse 1.
% Tw1 is the width of pulse 1. 
% I_on1 is the amplitude of pulse 1 in microamps/square cm.
% All times are in milliseconds.
I_on1=3; T1=10; Tw1=10;

% time step in milliseconds for integration by Euler's method
dt=0.01;
% computations for t < 0 establish initial conditions at t = 0.
for t=-30:dt:t_final
    if t==T1; I_ext=I_on1; end %turns on external current at t=T1
    if t>T1+Tw1; I_ext=0; end %turns off external current
    %alpha parameters in H-H model
    alpha(1)= ;
    alpha(2)= ;
    alpha(3)= ;
    %beta parameters in H-H model
    beta(1)=  ;
    beta(2)= ;
    beta(3)= ;
    %time constants (msec) and asymptotic values
    tau=1./(alpha+beta);
    x_0=alpha.*tau;
    %Euler integration
    x=(1-dt./tau).*x+dt./tau.*x_0;
    %conductance calculations
    gnmh(1)= ; % GK
    gnmh(2)= ; % GNa
    gnmh(3)= ; % Glk
    %membrane voltage update
    I=gnmh.*(V-E);
    V=V+dt*(I_ext-sum(I));
    %plotting records
    if t>=0
        t_rec=t_rec+1;
        x_plot(t_rec)=t;
        y_plot(t_rec)=V;
        G(t_rec,1)=gnmh(1); % GK
        G(t_rec,2)=gnmh(2); % GNa
        I_ext_plot(t_rec) = I_ext;
    end
end

subplot(2, 1, 1);
plot(x_plot,y_plot); xlabel('Time (ms)'); ('Relative Membrane Voltage (mV)');
hold on
plot(x_plot,I_ext_plot);
subplot(2, 1, 2);
plot(x_plot,G); xlabel('Time (ms)'); ylabel('Conductance(mS/cm^2)');


