function J = mediana(I,W)
% Sintaxis
% J = mediana (I, W)
%
% DescripciÛn
% Realiza un filtrado de mediana ponderada de la imagen I en dos dimensiones. Cada pÌxel de salida contiene el valor de la mediana ponderada de un entorno W alrededor del pÌxel correspondiente de la imagen de entrada.
%
% Argumentos de entrada
% I: imagen en escala de grises
% W: entorno de tamaÒo m-por-n, con m, n impares
%
% Argumento de salida
% J: imagen filtrada del mismo tamaÒo que la imagen de entrada
%%
u = 0;
v = 0;
[u,v] = size(I);
J = uint8(zeros(u,v));

m = 0;
n = 0;
[m,n] = size(W);

%Verificamos que la dimensiùn de de J sea impar para m y n
aux1 = floor(m/2);
aux2 = floor(n/2);

if mod(aux1,2) ~= 1 || mod(aux2,2) ~= 1
    error('la dimension de la matriz m,n debe ser impar');
end

%Centro de la matriz W
dm = floor(m/2);
dn = floor(n/2);

%Padding a la imagen
%I2 = padarray(I, [dm, dn]);

%Creamos el vector a almacenar.
H = zeros(100,1);

%Recorremos la imagen I, cargamos la cantidad de veces que tenga la matriz
%W y lo asignamos al vector J.

I2 = zeros(m, n);
%disp(dm)
%disp(dn)

% Para cada pixel de I excepto los bordes
for x = 1+dm:u-dm
    for y = 1+dn:v-dn
        % subimagen de I del tamaùo de la ventana
        I2 = I(x-dm:x+dm, y-dn:y+dn);
        %reiniciar el buffer H
        contador = 1;
        % cargar el buffer H
        % por cada entrada de la ventana W
        for z=1:m
            for t = 1:n
                aux3 = W(z,t);
                % if aux3 ~= 0 %solo en el caso de que sea distinto de 0 insertamos.
                for w = 1:aux3
                    H(contador,1) = I2(z,t); %asignamos en un vector temporal
                    contador = contador + 1;
                end
                
            end
        end
        contador = contador - 1; 
        % ordenar el buffer
        H(1:contador,1) = sort(H(1:contador,1),'ascend');
        % nuevo valor del pixel
        J(x,y) = median(H(1:contador,1));
    end
end