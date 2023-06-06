function caracteristicas = extraercaracteristicas(bw_image)
    %Funcion que extrae caracteristicas de Hu de una imagen.
    
    contornos = bwboundaries(bw_image);
    hu_momentos = [];
    
    for i = 1:length(contornos)
        contorno = contornos{i,1};
        hu_momentos_i = invmoments(contorno);
        hu_momentos = [hu_momentos; hu_momentos_i];
    end
    
    caracteristicas = hu_momentos;
end