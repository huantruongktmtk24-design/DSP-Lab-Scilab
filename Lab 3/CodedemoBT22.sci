// 1. Khoi tao tin hieu goc x(n)
n = -5:10; // Truc thoi gian du rong de chua cac phep dich
x = zeros(1, length(n));
for i = 1:length(n)
    if (n(i) >= -2) & (n(i) <= 2) then
        x(i) = 1;
    elseif (n(i) == 3) | (n(i) == 4) then
        x(i) = 0.5;
    end
end

// 2. Tinh toan cac tin hieu bien doi
// (a) x(n-2): Dich tre 2 mau (Shift right)
n_a = n + 2; 

// (b) x(4-n) = x(-(n-4)): Gap roi dich tre 4 mau
x_fold = x($:-1:1);
n_fold = -n($:-1:1);
n_b = n_fold + 4;

// (c) x(n+2): Dich som 2 mau (Shift left)
n_c = n - 2;

// (d) x(n) * u(2-n)
// u(2-n) la buoc nhay don vi bi gap va dich tre 2 (chi co gia tri 1 khi n <= 2)
u_2_minus_n = bool2s(n <= 2);
x_d = x .* u_2_minus_n;

// (e) x(n-1) * delta(n-3)
// delta(n-3) chi = 1 tai n = 3, cac cho khac = 0.
x_delay1 = zeros(1, length(n));
x_delay1(2:$) = x(1:$-1); // Dich mang sang phai 1 vi tri
delta_n_minus_3 = bool2s(n == 3);
x_e = x_delay1 .* delta_n_minus_3;

// (f) x(n^2)
// Chi nhung n nao ma n^2 thuoc tap index cua x khac 0 moi ton tai
x_f = zeros(1, length(n));
for i = 1:length(n)
    n_sq = n(i)^2;
    // Tim xem n_sq co nam trong truc n goc hay khong
    idx = find(n == n_sq);
    if ~isempty(idx) then
        x_f(i) = x(idx);
    end
end

// (g) Thanh phan chan: x_e(n) = 0.5 * (x(n) + x(-n))
// Dong bo truc thoi gian cua x(n) va x(-n) truoc khi cong
n_min_g = min(min(n), min(n_fold));
n_max_g = max(max(n), max(n_fold));
n_g = n_min_g : n_max_g;
x_g1 = zeros(1, length(n_g)); x_g2 = zeros(1, length(n_g));
x_g1(find(n_g == n(1)) : find(n_g == n($))) = x;
x_g2(find(n_g == n_fold(1)) : find(n_g == n_fold($))) = x_fold;
x_even = 0.5 * (x_g1 + x_g2);

// (h) Thanh phan le: x_o(n) = 0.5 * (x(n) - x(-n))
x_odd = 0.5 * (x_g1 - x_g2);

// 3. Ve do thi (Chia lam 2 figure cho do bi roi mat)
// Figure 1: Tu (a) den (d)
scf(1); clf;
subplot(4,1,1); plot2d3(n_a, x, 2); title("(a) x(n-2)");
subplot(4,1,2); plot2d3(n_b, x_fold, 5); title("(b) x(4-n)");
subplot(4,1,3); plot2d3(n_c, x, 3); title("(c) x(n+2)");
subplot(4,1,4); plot2d3(n, x_d, 6); title("(d) x(n)u(2-n)");

// Figure 2: Tu (e) den (h)
scf(2); clf;
subplot(4,1,1); plot2d3(n, x_e, 2); title("(e) x(n-1)\delta(n-3)");
subplot(4,1,2); plot2d3(n, x_f, 5); title("(f) x(n^2)");
subplot(4,1,3); plot2d3(n_g, x_even, 3); title("(g) Even part xe(n)");
subplot(4,1,4); plot2d3(n_g, x_odd, 6); title("(h) Odd part xo(n)");
