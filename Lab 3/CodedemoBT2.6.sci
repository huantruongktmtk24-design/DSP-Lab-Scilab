n = -4:6; // Truc thoi gian

// (1) Tin hieu x(n)
x = zeros(1, length(n));
x(find((n >= 0) & (n <= 3))) = 1;

// (2) y(n) = x(n^2)
y = zeros(1, length(n));
for i = 1:length(n)
    n_sq = n(i)^2;
    idx = find(n == n_sq);
    if ~isempty(idx) then
        y(i) = x(idx);
    end
end

// (3) y'_2(n) = y(n-2): Dich tre ngo ra di 2 mau
y_delay_out = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == (n(i)-2));
    if ~isempty(idx) then
        y_delay_out(i) = y(idx);
    end
end

// (4) x2(n) = x(n-2): Dich tre ngo vao di 2 mau
x_delay_in = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == (n(i)-2));
    if ~isempty(idx) then
        x_delay_in(i) = x(idx);
    end
end

// (5) y2(n) = x2(n^2): Dap ung cua he thong voi ngo vao da dich tre
y2 = zeros(1, length(n));
for i = 1:length(n)
    n_sq = n(i)^2;
    idx = find(n == n_sq);
    if ~isempty(idx) then
        y2(i) = x_delay_in(idx);
    end
end

// (6) Ve do thi de so sanh
clf;
subplot(5,1,1); plot2d3(n, x, 2); title("(1) x(n)");
subplot(5,1,2); plot2d3(n, y, 5); title("(2) y(n) = x(n^2)");
subplot(5,1,3); plot2d3(n, y_delay_out, 3); title("(3) y_2'(n) = y(n-2) [Delay Output]");
subplot(5,1,4); plot2d3(n, x_delay_in, 2); title("(4) x_2(n) = x(n-2)");
subplot(5,1,5); plot2d3(n, y2, 6); title("(5) y_2(n) = x_2(n^2) [Delay Input]");
