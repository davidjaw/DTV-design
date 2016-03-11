im=imread('lenna.jpg');
figure;
imshow(im);
y = 0.2989 * im(:, :, 1) + 0.5870 * im(:, :, 2) + 0.1140 * im(:, :, 3);
figure;
imshow(y);
imwrite(y, 'lenna_gray.jpg');
