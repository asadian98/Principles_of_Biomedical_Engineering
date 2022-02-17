% Question 5 - Answer

clc; clear;
close all

V = (-100:0.01:20) + 70;
Vplot = V - 70;

an = (0.1 - 0.01 .* V) ./ (exp(1 - 0.1 .* V) - 1);
bn = 0.125 .* exp(-V ./ 80);
n_inf = an ./ (an + bn);
T_n = 1 ./ (an + bn);

am = (2.5 - 0.1 .* V) ./ (exp(2.5 - 0.1 .* V)-1);
bm = 4 .* exp(-V ./ 18);
m_inf = am ./ (am + bm);
T_m = 1 ./ (am + bm);

ah = 0.07 * exp(-V ./ 20);
bh = 1 ./ (exp(3 - 0.1 .* V) + 1);
h_inf = ah ./ (ah + bh);
T_h = 1 ./ (ah + bh);

figure()
subplot(2, 1, 1)
plot(Vplot, n_inf);
hold on
plot(Vplot, m_inf);
plot(Vplot, h_inf);
xlabel('V(mV)');
title('Steady-State values');
legend('n\infty','m\infty','h\infty');
xlim([-100, 20]);
subplot(2, 1, 2)
plot(Vplot, T_n);
hold on
plot(Vplot, T_m);
plot(Vplot, T_h);
xlabel('V(mV)');
ylabel('\tau(ms)');
title('Time constants');
legend('n','m','h');
xlim([-100, 20]);