// Bai tap 4: Tin hieu ham doc don vi u_r(n)
clf; // Xoa khung do hoa cu
n = -5:5;

// Tinh toan u_r(n) = n * u(n)
ur = n .* bool2s(n >= 0);

// Ve do thi
plot2d3(n, ur);
plot(n, ur, "r."); // Them cham tron mau do o dinh
title("Discrete-time Unit Ramp Signal u_r[n]");
xlabel("Sample index n");
ylabel("Amplitude");
xgrid();
