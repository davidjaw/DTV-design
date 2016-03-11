im=imread('lenna.jpg');
figure;
imshow(im);
red = im(:,:,1);
green = im(:, :, 2);
blue = im(:, :, 3);
ared = 0.2990;
agreen = 0.587;
ablue = 0.114;

y = ared * red + agreen * green + ablue * blue;
cb = (blue - y) / (2 - 2 * ablue);
cr = (red - y) / (2 - 2 * ared);

redImg = im;
redImg(:,:,1) = cr;
redImg(:,:,2) = 0;
redImg(:,:,3) = 0;
figure;
imshow(redImg);
imwrite(blueImg, 'lenna_ycbcr_red.jpg');

blueImg = im;
blueImg(:,:,1) = 0;
blueImg(:,:,2) = 0;
blueImg(:,:,3) = cb;
figure;
imshow(blueImg);

imwrite(blueImg, 'lenna_ycbcr_blue.jpg');
