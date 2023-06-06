clear all
clc
BMP1 = imread('binumero.bmp');
BMP2 = imread('binumero-marcadores.bmp');
BW1 = im2bw(BMP1);
BW1 = ~BW1;
BW2 = im2bw(BMP2);
BW2 = ~BW2;
figure(1), imshow(~BW1)
figure(2), imshow(~BW2)
h = reconstruccion(BW2, BW1);
figure(3), imshow(~h)