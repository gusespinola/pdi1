function imgRelleno = rellenar_espacios(imagenBinaria)
    %Preprocesamiento de la imagen, el mismo rellena los espacios en las
    %imagenes.
    % Comprobar si la imagen es binaria
    if ~islogical(imagenBinaria)
        error('La imagen proporcionada debe ser binaria.');
    end

    % Identificar bordes utilizando el operador de Canny
    bordes = edge(double(imagenBinaria), 'Canny');

    % Rellenar huecos en la imagen utilizando la función imfill
    imgRelleno = imfill(bordes, 'holes');

    % Combinar la imagen binaria original y la imagen rellena
    imgRelleno = imgRelleno | imagenBinaria;
end