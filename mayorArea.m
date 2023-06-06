function g = mayorArea(f, n)
% Sintaxis:
% g = mayorArea(f, n)
% 
% Descripcion:
% Funci�n que selecciona los n objetos de mayor �rea de una imagen binaria
% f y devuelve una nueva imagen g con los objetos seleccionados.

% Obtener componentes de la imagen
[L, n_obj] = bwlabel(f);

if n > n_obj
   error('n supera la cantidad m�xima de componentes');
end 

% Obtener las propiedades de los objetos en la imagen binaria f
stats = regionprops(L, 'Area', 'PixelIdxList');

% Ordenar los objetos seg�n su �rea, de mayor a menor
[B, I] = sort([stats.Area], 'descend');

% Seleccionar los n objetos de mayor �rea
idx = I(1:n);

% Crear una imagen binaria vac�a del mismo tama�o que la imagen f
g = zeros(size(f));

% Seleccionar los objetos en la imagen g
for i = 1:length(idx)
    g(stats(idx(i)).PixelIdxList) = 1;
end

imshow(~g)

end