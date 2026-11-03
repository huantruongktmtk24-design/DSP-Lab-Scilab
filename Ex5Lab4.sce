// 1. Khoi dong toolbox IPCV
atomsLoad('IPCV');

// 2. Doc anh mau
img_path = fullpath(getIPCVpath() + "/images/baboon.png");
img_rgb = imread(img_path);
img_gray = rgb2gray(img_rgb);

// 3. Hien thi anh xam goc (Figure 0)
figure(0);
imshow(img_gray);
title("Anh xam goc (Grayscale Image)");

// 4. Tinh toan va ve luoc do muc xam - Histogram (Figure 1)
figure(1);
// Lay du lieu histogram va ve thu cong bang plot2d3 de tranh loi trang man hinh
[counts, bins] = imhist(img_gray); 
plot2d3(bins, counts);
title("Luoc do muc xam (Histogram)");

// 5. Lam mo anh bang ma tran trung binh 5x5 (Figure 2)
figure(2);
// Tao ma tran loc thu cong de khong bi phu thuoc vao fspecial
h_blur = ones(5,5) / 25; 

// Dung conv2 (tich chap 2D he thong) thay cho imfilter de tranh loi sapt
img_blur_double = conv2(double(img_gray), h_blur, "same");
img_blurred = uint8(img_blur_double); // Ep kieu ve lai 8-bit

imshow(img_blurred);
title("Anh sau khi lam mo (Blurred Image)");
