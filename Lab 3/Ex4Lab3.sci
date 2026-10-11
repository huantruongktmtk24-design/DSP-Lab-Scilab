function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    // 1. Tao truc thoi gian rieng cho tung tin hieu
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    // 2. Tim ranh gioi chung (min, max) cua truc thoi gian moi
    n_min = min(n1(1), n2(1));
    n_max = max(n1($), n2($));
    n_y = n_min:n_max; // Truc thoi gian tong hop cho y(n)
    
    // 3. Xac dinh vi tri goc toa do moi yorigin
    // Goc toa do nam o dau cham 0 cua truc thoi gian n_y
    yorigin = find(n_y == 0);
    
    // 4. Mo rong va dong bo 2 mang du lieu bang cach chen so 0 (Zero-padding)
    // Khoi tao mang toan so 0 co cung do dai voi truc n_y
    y1 = zeros(1, length(n_y));
    y2 = zeros(1, length(n_y));
    
    // Dong bo chi so (index) bang cach xac dinh vi tri bat dau
    idx1_start = find(n_y == n1(1)); 
    idx2_start = find(n_y == n2(1));
    
    // Gan gia tri cua x1 va x2 vao dung khoang tuong ung tren mang mo rong
    y1(idx1_start : idx1_start + length(x1n) - 1) = x1n;
    y2(idx2_start : idx2_start + length(x2n) - 1) = x2n;
    
    // 5. Thuc hien phep cong 2 mang da duoc dong bo
    yn = y1 + y2;
    
    // 6. Ve do thi (hien thi 3 tin hieu tren cung mot cua so)
    clf; 
    
    subplot(3,1,1);
    plot2d3(n1, x1n, 2); plot(n1, x1n, "b.");
    title("Signal x1(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();
    
    subplot(3,1,2);
    plot2d3(n2, x2n, 5); plot(n2, x2n, "r.");
    title("Signal x2(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();
    
    subplot(3,1,3);
    plot2d3(n_y, yn, 3); plot(n_y, yn, "g."); // Mau xanh la cho tin hieu tong
    title("Added Signal y(n) = x1(n) + x2(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();
endfunction
