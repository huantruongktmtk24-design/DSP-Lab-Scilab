// Ham phu tro de lay gia tri tin hieu x(k) tai vi tri k bat ky
function val = get_x(k)
    val = zeros(1, length(k));
    val(find(k == -2)) = 1;
    val(find(k == -1)) = -2;
    val(find(k == 0))  = 3;
    val(find(k == 1))  = 6;
endfunction

// Chon truc thoi gian rong de bao phu toan bo cac phep dich
n = -6:4;

// Tinh toan cac tin hieu dua tren ham phu tro
x_n  = get_x(n);
y1_n = get_x(-n);
y2_n = get_x(n + 3);
y3_n = 2 * get_x(-n - 2);

// ==============================================
// Cua so 1: x(n) va y1(n)
scf(1); clf;
subplot(2, 1, 1);
plot2d3(n, x_n); plot(n, x_n, "r.");
title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();
subplot(2, 1, 2);
plot2d3(n, y1_n); plot(n, y1_n, "r.");
title("Signal y_1(n) = x(-n)"); xlabel("n"); ylabel("Amplitude"); xgrid();

// ==============================================
// Cua so 2: x(n) va y2(n)
scf(2); clf;
subplot(2, 1, 1);
plot2d3(n, x_n); plot(n, x_n, "r.");
title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();
subplot(2, 1, 2);
plot2d3(n, y2_n); plot(n, y2_n, "r.");
title("Signal y_2(n) = x(n + 3)"); xlabel("n"); ylabel("Amplitude"); xgrid();

// ==============================================
// Cua so 3: x(n) va y3(n)
scf(3); clf;
subplot(2, 1, 1);
plot2d3(n, x_n); plot(n, x_n, "r.");
title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();
subplot(2, 1, 2);
plot2d3(n, y3_n); plot(n, y3_n, "r.");
title("Signal y_3(n) = 2x(-n - 2)"); xlabel("n"); ylabel("Amplitude"); xgrid();
