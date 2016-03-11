im=imread('lenna.jpg');
figure;
imshow(im);
red = im(:, :, 1);
green = im(:, :, 2);
blue = im(:, :, 3);
ared = 0.2990;
agreen = 0.587;
ablue = 0.114;

y = ared * red + agreen * green + ablue * blue;
cb = (blue - y) / (2 - 2 * ablue);
cr = (red - y) / (2 - 2 * ared);

r_red = cr * (2 - 2 * ared) + y;
r_green = (y - ablue * blue - ared * red) / agreen;
r_blue = cb * (2 - 2 * ablue ) + y;

myImg = im;
myImg(:,:,1) = r_red;
myImg(:,:,2) = r_green;
myImg(:,:,3) = r_blue;
figure;
imshow(myImg);

imwrite(y, 'lenna_ycbcr_to_rgb.jpg');
