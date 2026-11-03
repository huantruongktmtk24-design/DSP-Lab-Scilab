// 1. Khoi tao tin hieu
x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
N = 5; // Chieu dai chu ky co ban
n_idx = 0:N-1;

// PHUONG PHAP 1: Lat va dich vong (Folding and Circular Shifting)
y_circ = zeros(1, N);
for n = 0:N-1
    for k = 0:N-1
        // SU DUNG pmodulo THAY VI modulo DE TRANH INDEX AM
        idx_x = pmodulo(n - k, N) + 1;
        idx_h = k + 1;
        y_circ(n+1) = y_circ(n+1) + h(idx_h) * x(idx_x);
    end
end
disp("Ket qua Tich chap vong (Fold & Shift): ");
disp(y_circ);

// PHUONG PHAP 2: Ma tran (Matrix Method)
// Tao ma tran tuan hoan (Circulant Matrix) tu x(n)
X_matrix = zeros(N, N);
for i = 1:N
    for j = 1:N
        // SU DUNG pmodulo THAY VI modulo
        X_matrix(i, j) = x(pmodulo(i - j, N) + 1);
    end
end
// Nhan ma tran tuan hoan X voi vector h
y_matrix = (X_matrix * h')';
disp("Ket qua Tich chap vong (Matrix Method): ");
disp(y_matrix);

// VE DO THI TIN HIEU VA NANG LUONG (Energy)
// Tinh nang luong tich luy
E_x = cumsum(x.^2);
E_y = cumsum(y_circ.^2);

clf();
// Do thi x(n)
subplot(2, 2, 1);
plot2d3(n_idx, x); plot(n_idx, x, "r.");
xtitle("Tin hieu x(n)", "n", "Bien do"); xgrid();

// Do thi y(n)
subplot(2, 2, 2);
plot2d3(n_idx, y_circ); plot(n_idx, y_circ, "b.");
xtitle("Tich chap vong y(n)", "n", "Bien do"); xgrid();

// Do thi nang luong E_x
subplot(2, 2, 3);
plot2d3(n_idx, E_x); plot(n_idx, E_x, "m*");
xtitle("Nang luong cua x(n)", "n", "Energy"); xgrid();

// Do thi nang luong E_y
subplot(2, 2, 4);
plot2d3(n_idx, E_y); plot(n_idx, E_y, "g*");
xtitle("Nang luong cua y(n)", "n", "Energy"); xgrid();
