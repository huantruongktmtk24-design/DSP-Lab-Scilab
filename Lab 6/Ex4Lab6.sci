clear; clc;

// Tao truc tan so omega trong khoang [-pi, pi]
w = linspace(-%pi, %pi, 1001);

// Dap ung tan so H(w) = 1 / (1 + 0.1*e^(-jw) + 0.2*e^(-j2w))
H = 1 ./ (1 + 0.1 * exp(-%i * w) + 0.2 * exp(-%i * 2 * w));
amp_H = abs(H);
phase_H = atan(imag(H), real(H));

scf(1); clf(1);
subplot(2, 1, 1);
plot(w, amp_H, 'b', 'LineWidth', 2);
xgrid();
title('$\text{Amplitude Spectrum of } H(\omega)$');
xlabel('$\text{Frequency } \omega \text{ (rad/sample)}$');
ylabel('$\vert{}H(\omega)\vert{}$');

subplot(2, 1, 2);
plot(w, phase_H, 'r', 'LineWidth', 2);
xgrid();
title('$\text{Phase Spectrum of } H(\omega)$');
xlabel('$\text{Frequency } \omega \text{ (rad/sample)}$');
ylabel('$\angle H(\omega) \text{ (rad)}$');
