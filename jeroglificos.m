function salida = jeroglificos(imagen)
    %Funcion que reconoce una imagen de entrada perteneciente a uno o
    %varios caracteres Egipcios.
    
    %cargamos las imagenes que corresponden a los caracteres.
    img1 = imread('aheht.png');     %Ankh:      A
    img2 = imread('ankh.png');      %Akhet:     K
    img3 = imread('djed.png');      %Djed:      D
    img4 = imread('scarab.png');    %Scarab:    S
    img5 = imread('was.png');       %Was:       W
    img6 = imread('wedjat.png');    %Wedjat:    J

    %Convertir las imagenes en escala de grises y hacer que sea binario
    %mediante el comando imbinarize.
    
    bw_img1 = imbinarize(rgb2gray(img1));
    bw_img2 = imbinarize(rgb2gray(img2));
    bw_img3 = imbinarize(rgb2gray(img3));
    bw_img4 = imbinarize(rgb2gray(img4));
    bw_img5 = imbinarize(rgb2gray(img5));
    bw_img6 = imbinarize(rgb2gray(img6));
    
    %llamamos a una funcion que extrae caracteristicas de la imagen.
    caracteristicas_img1 = extraercaracteristicas(bw_img1);
    caracteristicas_img2 = extraercaracteristicas(bw_img2);
    caracteristicas_img3 = extraercaracteristicas(bw_img3);
    caracteristicas_img4 = extraercaracteristicas(bw_img4);
    caracteristicas_img5 = extraercaracteristicas(bw_img5);
    caracteristicas_img6 = extraercaracteristicas(bw_img6);
    
    %Gustavo aquí deberiamos buscar la forma de segmentar las imagenes que
    %tiene una imagen en varias imagenes y que pueda leer uno a uno, te
    %llamo para explicar esta parte.
    
    %aqui segmentamos la imagen en varias imagenes y después recorremos el
    %mismo
    
    objetos_recortados = segmentar_objetos(imagen);
    numel(objetos_recortados)
    
    for i = 1:numel(objetos_recortados)
        
        %Aquí lo que hacemos es convertir la imagen de entrada en binaria,
        %binarizarla y luego extraer sus características.
        
        %si da error, fijate en el parametro objetos_recortados{i}
        bw_imagen = imbinarize(rgb2gray(objetos_recortados{i}));
        caracteristicas_imagen = extraercaracteristicas(bw_imagen);

        %Compara las características de la nueva imagen con las características
        %de las imágenes de entrenamiento utilizando la métrica de distancia
        %euclidiana y selecciona la imagen con la menor distancia.

        distancias = [];
        for i = 1:6
            caracteristica_img = eval(['bw_imagen', num2str(i)]);
            distancia = pdist2(caracteristicas_imagen, caracteristica_img, 'euclidean');
            distancias = [distancias; distancia];
        end

        [~, imagenreconocida] = min(distancias);

        %El valor de imagenreconocida será un número entre 1 y 6 que representa
        %la imagen reconocida.

        %Guaramos en salida el valor que corresponde al jeroglifico.
        switch imagenreconocida
            case 1
                salida = strcat(salida,'A');
            case 2
                salida = strcat(salida,'K');
            case 3
                salida = strcat(salida,'D');
            case 4
                salida = strcat(salida,'S');
            case 5
                salida = strcat(salida,'W');
            case 6
                salida = strcat(salida,'J');
        end
        
    end

end