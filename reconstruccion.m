function h = reconstruccion(f, g)
% Sintaxis
% h = reconstruccion(f, g)
%
% Descripción
% Reconstruye los elementos de una imagen binaria (mascara) g,
% a partir de los marcadores f de esos elementos
%
% Argumentos de entrada
% f: marcador
% g: imagen binaria original (máscara)
%
% Argumento de salida
% h: imagen binaria reconstruida únicamente con los elementos marcados

h = f;
B = ones(3);

while true
    r = imdilate(h, B) & g;
    if r == h
        break
    end
    h = r;
end