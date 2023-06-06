clear all
clc
img1 = ~im2bw(imread('akeht.png'));     %Ankh:      A
img2 = ~im2bw(imread('ankh.png'));      %Akhet:     K
img3 = ~im2bw(imread('djed.png'));      %Djed:      D
img4 = ~im2bw(imread('scarab.png'));    %Scarab:    S
img5 = ~im2bw(imread('was.png'));       %Was:       W
img6 = ~im2bw(imread('wedjat.png'));    %Wedjat:    J

%caracteristicas_img1 = extraercaracteristicas(img1);
contornos = bwboundaries(img1);
hu_momentos = [];
    
for i = 1:length(contornos)
    contorno = contornos{i,1};
    hu_momentos_i = invmoments(double(contorno));
    hu_momentos = [hu_momentos; hu_momentos_i];
end