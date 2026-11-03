// 1. Khoi tao tin hieu
nx = 0:4; x = [1, 2, -3, 2, 1];
nh = 0:2; h = [1, 0, -1];

// Tinh toan truc thoi gian ngo ra y(n)
ny = min(nx)+min(nh) : max(nx)+max(nh);
L_y = length(x) + length(h) - 1;

// PHUONG PHAP 1: (Folding and Shifting)

y_shift = zeros(1, L_y);
for n = 1:L_y
    for k = 1:length(h)
        idx_x = n - k + 1; // Chi so cua x(n-k)
        if (idx_x > 0) & (idx_x <= length(x)) then
            y_shift(n) = y_shift(n) + h(k) * x(idx_x);
        end
    end
end
disp("Ket qua theo phuong phap Fold & Shift: ");
disp(y_shift);

// PHUONG PHAP 2: Ma tran (Matrix Method)

// Tao ma tran Toeplitz tu h(n) kich thuoc (L_y x length(x))
H_matrix = zeros(L_y, length(x));
for i = 1:length(x)
    H_matrix(i:i+length(h)-1, i) = h';
end
// Nhan ma tran H voi vector x de ra y
y_matrix = (H_matrix * x')'; 
disp("Ket qua theo phuong phap Ma tran: ");
disp(y_matrix);

// --------------------------------------------------------------------
// VE DO THI TIN HIEU VA NANG LUONG (Energy)
// --------------------------------------------------------------------
// Tinh nang luong tich luy (Cumulative Energy) cua x va y
E_x = cumsum(x.^2);
E_y = cumsum(y_shift.^2);

clf();
// Do thi x(n)
subplot(2, 2, 1);
plot2d3(nx, x); plot(nx, x, "r.");
xtitle("Tin hieu x(n)", "n", "Bien do"); xgrid();

// Do thi y(n)
subplot(2, 2, 2);
plot2d3(ny, y_shift); plot(ny, y_shift, "b.");
xtitle("Tich chap y(n)", "n", "Bien do"); xgrid();

// Do thi nang luong E_x
subplot(2, 2, 3);
plot2d3(nx, E_x); plot(nx, E_x, "m*");
xtitle("Nang luong cua x(n)", "n", "Energy"); xgrid();

// Do thi nang luong E_y
subplot(2, 2, 4);
plot2d3(ny, E_y); plot(ny, E_y, "g*");
xtitle("Nang luong cua y(n)", "n", "Energy"); xgrid();
