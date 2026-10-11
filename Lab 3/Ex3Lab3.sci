function [yn, yorigin] = fold(xn, xorigin)
    // 1. Dao nguoc toan bo mang du lieu de tao tin hieu y(n)
    // Cu phap xn($:-1:1) nghia la lay tu phan tu cuoi ($) nguoc ve phan tu dau (1)
    yn = xn($:-1:1);
    
    // 2. Xac dinh vi tri goc toa do moi
    // Goc toa do se bi lat doi xung qua tam cua mang
    yorigin = length(xn) - xorigin + 1;
    
    // 3. Tao truc thoi gian n dong bo cho ca hai tin hieu
    n_x = (1:length(xn)) - xorigin;
    n_y = (1:length(yn)) - yorigin;
    
    // 4. Ve do thi 
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
    title("Folded Signal y(n) = x(-n)"); 
    xlabel("n"); 
    ylabel("Amplitude"); 
    xgrid();
endfunction
