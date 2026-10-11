// Khoi tao truc thoi gian n cho tin hieu goc x(n) tu -4 den 5
n = -4:5;
x = zeros(1, length(n));

// Tinh toan gia tri x(n) theo cong thuc cau (a)
for i = 1:length(n)
    if (n(i) >= -3) & (n(i) <= -1) then
        x(i) = 1 + n(i)/3;
    elseif (n(i) >= 0) & (n(i) <= 3) then
        x(i) = 1;
    end
end

// Cau (b) - Truong hop 1: Gap roi Dich tre 4 mau -> x(-n+4)
// Buoc 1: Gap x(n) 
v1 = x($:-1:1);
n_v1 = -n($:-1:1);
// Buoc 2: Dich tre 4 (tru di 4 tren truc thoi gian hien tai)
n_y1 = n_v1 + 4; 

// Cau (b) - Truong hop 2: Dich tre 4 roi Gap -> x(-n-4)
// Buoc 1: Dich tre 4 mau
v2 = x;
n_v2 = n + 4;
// Buoc 2: Gap tin hieu
y2 = v2($:-1:1);
n_y2 = -n_v2($:-1:1);

// Ve do thi kiem chung 
clf;
subplot(3,1,1);
plot2d3(n, x, 2); plot(n, x, "b.");
title("(a) Original Signal x(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();

subplot(3,1,2);
plot2d3(n_y1, v1, 5); plot(n_y1, v1, "r.");
title("(b.1 & c) x(-n+4): Fold then Delay by 4"); xlabel("n"); ylabel("Amplitude"); xgrid();

subplot(3,1,3);
plot2d3(n_y2, y2, 6); plot(n_y2, y2, "m.");
title("(b.2) x(-n-4): Delay by 4 then Fold"); xlabel("n"); ylabel("Amplitude"); xgrid();
