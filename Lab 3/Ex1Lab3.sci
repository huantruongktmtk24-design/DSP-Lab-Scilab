function [yn, yorigin] = delay(xn, xorigin, k)
    // 1. Khoi tao mang yn va xac dinh vi tri goc moi
    yn = xn;
    yorigin = xorigin - k;
    
    // 2. Xu ly truong hop goc toa do bi day ra khoi mang (yorigin <= 0)
    // Can chen them cac so 0 vao dau mang de mo rong tin hieu
    if yorigin <= 0 then
        pad_length = abs(yorigin) + 1; //Ham Abs de lay gia tri tuyet doi, pad_length la so luong so 0 can duoc them vao o dang truoc
        yn = [zeros(1, pad_length), yn];//ham zeros de ket noi mang (1,pad) voi yn
        yorigin = 1; // Cap nhat lai goc toa do ve vi tri dau tien
    end
    
    // 3. Tao truc thoi gian n cho ca hai tin hieu de ve do thi
    n_x = (1:length(xn)) - xorigin;
    n_y = (1:length(yn)) - yorigin;
    
    // 4. Ve do thi (hien thi ca x(n) va y(n) tren cung 1 cua so)
    clf; 
    
    // Ve tin hieu goc x(n)
    subplot(2,1,1);
    plot2d3(n_x, xn, 2); 
    plot(n_x, xn, "b."); // "b." la cham tron mau blue
    title("Original Signal x(n)"); 
    xlabel("n"); 
    ylabel("Amplitude"); 
    xgrid();
    
    // Ve tin hieu dich tre y(n)
    subplot(2,1,2);
    plot2d3(n_y, yn, 5); 
    plot(n_y, yn, "r."); // "r." la cham tron mau red
    title("Delayed Signal y(n) = x(n - " + string(k) + ")"); 
    xlabel("n"); 
    ylabel("Amplitude"); 
    xgrid();
endfunction
