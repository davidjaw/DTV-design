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

blueImg = im;
blueImg(:,:,1) = 0;
blueImg(:,:,2) = 0;
blueImg(:,:,3) = cb;
redImg = im;
redImg(:,:,1) = cr;
redImg(:,:,2) = 0;
redImg(:,:,3) = 0;

newBlueImg = zeros(256,256,3, 'uint8');
newRedImg = zeros(256,256,3, 'uint8');
for i = 1:255
    for j = 1:255
        newBlueImg(i, j, 3) = (blueImg(i * 2, j * 2, 3) + blueImg(i * 2 + 1, j * 2 + 1, 3)) / 2;
        newRedImg(i, j, 1) = (redImg(i * 2, j * 2, 1) + redImg(i * 2 + 1, j * 2 + 1, 1)) / 2;
    end
end


finalBlueImg = zeros(512,512,3, 'uint8');
finalRedImg = zeros(512,512,3, 'uint8');
for i = 1:255
    for j = 1:255
        finalBlueImg(i * 2, j * 2, 3) = newBlueImg(i, j, 3);
        finalBlueImg(i * 2 + 1, j * 2 + 1, 3) = newBlueImg(i, j, 3);
        finalRedImg(i * 2, j * 2, 1) = newRedImg(i, j, 1);
        finalRedImg(i * 2 + 1, j * 2 + 1, 1) = newRedImg(i, j, 1);
    end
end
figure;
imshow(finalBlueImg);
figure;
imshow(finalRedImg);
finalImg = zeros(512,512,3, 'uint8');
for i = 1:512
    for j = 1:512
        r = finalRedImg(i, j, 1);
        b = finalBlueImg(i, j, 3); 
        finalRed = r * (2 - 2 * ared) + y(i, j);
        finalBlue = b * (2 - 2 * ablue) + y(i, j);
        finalGreen = (y(i, j) - ablue * finalBlue - ared * finalRed) / agreen;
        finalImg(i,j,1) = finalRed;
        finalImg(i,j,2) = finalGreen;
        finalImg(i,j,3) = finalBlue;
    end
end

figure;
imshow(finalImg);

imwrite(finalImg, 'lenna_final.jpg');
