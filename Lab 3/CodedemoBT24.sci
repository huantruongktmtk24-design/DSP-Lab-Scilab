// 1. Khoi tao tin hieu x(n)
n = -2:2;
x = [2, 3, 4, 5, 6];

// 2. Tao tin hieu gap x(-n)
x_fold = x($:-1:1);
n_fold = -n($:-1:1);

// 3. Tinh thanh phan chan va le (Truc thoi gian da dong bo do doi xung)
x_even = 0.5 * (x + x_fold);
x_odd = 0.5 * (x - x_fold);

// 4. Ve do thi kiem chung
clf;
subplot(3,1,1);
plot2d3(n, x, 2); plot(n, x, "b.");
title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();

subplot(3,1,2);
plot2d3(n, x_even, 3); plot(n, x_even, "g.");
title("Even Component xe(n) = 0.5 * [x(n) + x(-n)]"); xlabel("n"); ylabel("Amplitude"); xgrid();

subplot(3,1,3);
plot2d3(n, x_odd, 6); plot(n, x_odd, "m.");
title("Odd Component xo(n) = 0.5 * [x(n) - x(-n)]"); xlabel("n"); ylabel("Amplitude"); xgrid();
