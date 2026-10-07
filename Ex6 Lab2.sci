clf; // Xoa khung do hoa hien tai

// Chon truc n mo rong tu -2 den 4 de de quan sat
n = -2:4;

// Dinh nghia x1(n) va x2(n) theo truc n chung
// Voi n = [-2, -1, 0, 1, 2, 3, 4]
x1 = [0,  0,  0, 1, 3, -2, 0];
x2 = [0,  0,  1, 2, 3,  0, 0];

// Tinh y(n) = x1(n) + x2(n)
y = x1 + x2;

// Ve do thi 1: x1(n)
subplot(3, 1, 1);
plot2d3(n, x1);
plot(n, x1, "r.");
title("Signal x_1(n)");
xlabel("Sample index n");
ylabel("Amplitude");
xgrid();

// Ve do thi 2: x2(n)
subplot(3, 1, 2);
plot2d3(n, x2);
plot(n, x2, "r.");
title("Signal x_2(n)");
xlabel("Sample index n");
ylabel("Amplitude");
xgrid();

// Ve do thi 3: y(n)
subplot(3, 1, 3);
plot2d3(n, y);
plot(n, y, "r.");
title("Sum Signal y(n) = x_1(n) + x_2(n)");
xlabel("Sample index n");
ylabel("Amplitude");
xgrid();
