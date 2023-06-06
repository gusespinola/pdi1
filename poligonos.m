function g = poligonos(f, n)
    %Funcion que recibe una imagen binaria f y un valor n y retorna las
    %figuras que tengan n vertices donde todos los vertices se desprenden
    %de una misma recta.
    % Verifica que la imagen de entrada sea binaria
    if ~islogical(f)
        error('La imagen de entrada debe ser binaria.');
    end

    % Etiquetar objetos en la imagen
    [L, num_objects] = bwlabel(f);

    % Obtener informaci�n de las propiedades de los objetos (�rea convexa y per�metro)
    properties = regionprops(L, 'ConvexHull', 'PixelIdxList');

    % Crear una matriz de ceros del mismo tama�o que la imagen original
    g = false(size(f));

    % Seleccionar los objetos que tengan n v�rtices
    for i = 1:num_objects
        vertices = properties(i).ConvexHull;
        num_vertices = size(vertices, 1);

        if num_vertices == n
            g(properties(i).PixelIdxList) = true;
        end
    end
end
