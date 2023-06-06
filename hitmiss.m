clear all
clc
im = imread('binbola2populacoes.bmp');
im = im2bw(im);
im = ~im;
b1 = [1 1 1; 1 1 1; 0 1 1];
b2 = [0 0 0; 0 0 0; 1 0 0];
% Transformada hit-or-miss
g = imerode(im, b1) & imerode(~im, b2);
h = reconstruccion(g, im);
figure(1), imshow(im)
figure(2), imshow(h)