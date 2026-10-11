function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    // 1. Tinh toan bien do tich chap bang ham co san convol cua Scilab
    // Luu y trong Scilab, cu phap thuong dung la convol(hn, xn)
    yn = convol(hn, xn);
    
    // 2. Tinh toan vi tri goc toa do moi yorigin theo cong thuc
    yorigin = xorigin + horigin - 1;
    
    // 3. Tao truc thoi gian n rieng cho tung tin hieu de ve do thi
    n_x = (1:length(xn)) - xorigin;
    n_h = (1:length(hn)) - horigin;
    n_y = (1:length(yn)) - yorigin;
    
    // 4. Ve do thi (hien thi 3 tin hieu tren cung mot cua so)
    clf; 
    
    subplot(3,1,1);
    plot2d3(n_x, xn, 2); plot(n_x, xn, "b.");
    title("Input Signal x(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();
    
    subplot(3,1,2);
    plot2d3(n_h, hn, 5); plot(n_h, hn, "r.");
    title("Impulse Response h(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();
    
    subplot(3,1,3);
    plot2d3(n_y, yn, 6); plot(n_y, yn, "m.");
    title("Output Signal y(n) = x(n) * h(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();
endfunction
