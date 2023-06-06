clear all
clc
% Leer una imagen al azar
I = imread('circuit.tif');
% Agregar ruido para el test
I = imnoise(I, 'salt & pepper');
% Imprimir imagen con ruido
figure(1), imshow(I)
% Matriz de pesos
W = [1 2 1; 2 4 2; 1 2 1];
% Mediana
% J = mediana(I, W);
J = mediana(I, W);
% Imprimir imagen pos-filtrado
figure(2), imshow(J)