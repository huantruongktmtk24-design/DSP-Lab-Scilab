clf; // Clear graphic window

// ==========================================
// 1. Analog signal xa(t) in 5 periods
// ==========================================
// xa(t) = 3*sin(100*pi*t)
// Frequency: F = 50 Hz, Fundamental period: T0 = 1/50 = 0.02 s
// Duration for 5 periods: 5 * 0.02 = 0.1 s
F0 = 50;
T0 = 1 / F0;
t = linspace(0, 5 * T0, 1000); // 1000 points for a smooth curve
xa = 3 * sin(100 * %pi * t);

subplot(3, 1, 1);
plot(t, xa, "b");
title("Analog signal x_a(t) over 5 periods");
xlabel("Time t (seconds)");
ylabel("Amplitude");
xgrid();

// ==========================================
// 2. Discrete-time signal x(n) in 5 periods
// ==========================================
// Sampling frequency: Fs = 300 samples/s
// x(n) = xa(n/Fs) = 3*sin(100*pi*n/300) = 3*sin((pi/3)*n)
// Frequency: f = (pi/3)/(2*pi) = 1/6 (rational number => periodic)
// Fundamental period: N = 6 samples/period
// Total samples for 5 periods: 5 * 6 = 30 samples (from n = 0 to 29)
N_period = 6;
n = 0:(5 * N_period - 1);
xn = 3 * sin((%pi / 3) * n);

subplot(3, 1, 2);
plot2d3(n, xn);        // Discrete stem plot
plot(n, xn, "r.");     // Red dots at the tips
title("Discrete-time signal x(n) over 5 periods (Period N = 6)");
xlabel("Sample index n");
ylabel("Amplitude");
xgrid();

// ==========================================
// 3. Quantized signal xq(n) using Truncation method
// ==========================================
// Step size: Delta = 0.1
// Truncation: xq(n) = Delta * floor(x(n) / Delta)
delta = 0.1;
xqn = delta * floor(xn / delta);

subplot(3, 1, 3);
plot2d3(n, xqn);       // Discrete stem plot
plot(n, xqn, "k.");    // Black dots at the tips
title("Quantized signal x_q(n) using truncation method (\Delta = 0.1)");
xlabel("Sample index n");
ylabel("Amplitude");
xgrid();
