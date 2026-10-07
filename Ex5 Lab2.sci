clf; // Xoa khung do hoa hien tai

// Khoi tao truc thoi gian n tu -3 den 3 de quan sat ro tin hieu
n = -3:3;

// Dinh nghia tin hieu x(n) tuong ung voi truc n
// n = [-3, -2, -1, 0, 1, 2, 3] -> x = [0, 0, 1, 3, -2, 0, 0]
x = [0, 0, 1, 3, -2, 0, 0];

// Tinh x(-n) bang cach dao nguoc mang x
// (Vi truc n doi xung qua 0 nen co the dung cach nay)
x_minus_n = x($:-1:1);

// Tinh thanh phan chan (Even) va le (Odd)
xe = 0.5 * (x + x_minus_n);
xo = 0.5 * (x - x_minus_n);

// Ve do thi 1: Tin hieu goc x(n)
subplot(3, 1, 1);
plot2d3(n, x);
plot(n, x, "r.");
title("Original Signal x(n)");
xlabel("Sample index n");
ylabel("Amplitude");
xgrid();

// Ve do thi 2: Thanh phan chan x_e(n)
subplot(3, 1, 2);
plot2d3(n, xe);
plot(n, xe, "r.");
title("Even Component x_e(n)");
xlabel("Sample index n");
ylabel("Amplitude");
xgrid();

// Ve do thi 3: Thanh phan le x_o(n)
subplot(3, 1, 3);
plot2d3(n, xo);
plot(n, xo, "r.");
title("Odd Component x_o(n)");
xlabel("Sample index n");
ylabel("Amplitude");
xgrid();
