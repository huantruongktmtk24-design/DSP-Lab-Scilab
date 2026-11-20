clear; clc;

// Tao truc tan so omega trong khoang [-pi, pi]
w = linspace(-%pi, %pi, 1001);

// 1. Tin hieu x1(n) = 0.1^n * u(n)
X1 = 1 ./ (1 - 0.1 * exp(-%i * w));
amp_X1 = abs(X1);
phase_X1 = atan(imag(X1), real(X1));

scf(1); clf(1);
subplot(2, 1, 1);
plot(w, amp_X1, 'b', 'LineWidth', 2);
xgrid();
title('$\text{Amplitude Spectrum of } x_1(n) = 0.1^n u(n)$');
xlabel('$\text{Frequency } \omega \text{ (rad/sample)}$');
ylabel('$|X_1(\omega)|$');

subplot(2, 1, 2);
plot(w, phase_X1, 'r', 'LineWidth', 2);
xgrid();
title('$\text{Phase Spectrum of } x_1(n) = 0.1^n u(n)$');
xlabel('$\text{Frequency } \omega \text{ (rad/sample)}$');
ylabel('$\angle X_1(\omega) \text{ (rad)}$');

// 2. Tin hieu x2(n) = delta(n) + delta(n-1) + delta(n-2) + delta(n-3)
X2 = 1 + exp(-%i * w) + exp(-%i * 2 * w) + exp(-%i * 3 * w);
amp_X2 = abs(X2);
phase_X2 = atan(imag(X2), real(X2));

scf(2); clf(2);
subplot(2, 1, 1);
plot(w, amp_X2, 'b', 'LineWidth', 2);
xgrid();
title('$\text{Amplitude Spectrum of } x_2(n)$');
xlabel('$\text{Frequency } \omega \text{ (rad/sample)}$');
ylabel('$|X_2(\omega)|$');

subplot(2, 1, 2);
plot(w, phase_X2, 'r', 'LineWidth', 2);
xgrid();
title('$\text{Phase Spectrum of } x_2(n)$');
xlabel('$\text{Frequency } \omega \text{ (rad/sample)}$');
ylabel('$\angle X_2(\omega) \text{ (rad)}$');
