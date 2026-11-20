clear; clc;

// Tao truc tan so omega trong khoang [-pi, pi]
w = linspace(-%pi, %pi, 1001);

// H(w) = 1 + e^(-jw) va X(w) = 1 / (1 - 0.5*e^(-jw))
H = 1 + exp(-%i * w);
X = 1 ./ (1 - 0.5 * exp(-%i * w));
Y = H .* X;

amp_Y = abs(Y);
phase_Y = atan(imag(Y), real(Y));

scf(1); clf(1);
subplot(2, 1, 1);
plot(w, amp_Y, 'b', 'LineWidth', 2);
xgrid();
title('$\text{Amplitude Spectrum of Output } Y(\omega)$');
xlabel('$\text{Frequency } \omega \text{ (rad/sample)}$');
ylabel('$|Y(\omega)|$');

subplot(2, 1, 2);
plot(w, phase_Y, 'r', 'LineWidth', 2);
xgrid();
title('$\text{Phase Spectrum of Output } Y(\omega)$');
xlabel('$\text{Frequency } \omega \text{ (rad/sample)}$');
ylabel('$\angle Y(\omega) \text{ (rad)}$');
