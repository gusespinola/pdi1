clear all
clc

% Leer imagen
imagen = imread('formaspoligonos.jpeg'); %Aca se debe poner la direccion de la imagen.

% Convertir la imagen a binaria si es necesario
imagenBinaria = im2bw(rgb2gray(imagen));
figure(1), imshow(imagenBinaria)

% Llamar a la función para rellenar espacios
imagenRellenada = rellenar_espacios(~imagenBinaria);
figure(2), imshow(~imagenRellenada)

%Mostramos todas las imagenes que tengan 4 vértices (aristas).
g = poligonos(imagenRellenada,24);


% f = imagenRellenada;
% [L, num_objects] = bwlabel(f);
% %disp(g);
% properties = regionprops(L, 'ConvexHull', 'PixelIdxList');
% 
% g = false(size(f));
% for i = 1:num_objects
%     vertices = properties(i).ConvexHull;
%     num_vertices = size(vertices, 1);
% 
%     if num_vertices == n
%             g(properties(i).PixelIdxList) = true;
%     end
% end

% Mostrar resultados
figure;
%imshow(imagenBinaria); title('Imagen binaria original');
%imshow(imagenRellenada); title('Imagen con espacios rellenos');
imshow(g); title('Imagen que tengan n vértices(aristas)');