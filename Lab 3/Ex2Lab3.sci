function [yn, yorigin] = advance(xn, xorigin, k)
    // 1. Khoi tao mang yn va xac dinh vi tri goc moi
    yn = xn;
    yorigin = xorigin + k;
    
    // 2. Xu ly truong hop goc toa do bi day ra khoi mang ben phai
    // Neu yorigin > chieu dai mang, can chen them so 0 vao cuoi
    if yorigin > length(yn) then
        pad_length = yorigin - length(yn);
        yn = [yn, zeros(1, pad_length)];
    end
    
    // 3. Tao truc thoi gian n dong bo cho ca hai tin hieu
    n_x = (1:length(xn)) - xorigin;
    n_y = (1:length(yn)) - yorigin;
    
    // 4. Ve do thi (Mau xanh cho tin hieu goc, mau do cho tin hieu dich)
    clf; 
    
    subplot(2,1,1);
    plot2d3(n_x, xn, 2); 
    plot(n_x, xn, "b.");
    title("Original Signal x(n)"); 
    xlabel("n"); 
    ylabel("Amplitude"); 
    xgrid();
    
    subplot(2,1,2);
    plot2d3(n_y, yn, 5); 
    plot(n_y, yn, "r.");
    title("Advanced Signal y(n) = x(n + " + string(k) + ")"); 
    xlabel("n"); 
    ylabel("Amplitude"); 
    xgrid();
endfunction
