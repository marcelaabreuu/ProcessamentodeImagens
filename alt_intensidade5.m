%Leitura de uma imagem colorida
f=imread('Cachorro.png');
%Conversão RGB para Grayscale
R=f(:,:,1); % matriz correspondente a componente RED
G=f(:,:,2); % matriz correspondente a componente GREEN
B=f(:,:,3); % matriz correspondente a componenteBLUE
f2=0.299 * R + 0.587 * G + 0.114 * B;

f_double = double(f2);
% inicializar imagem de saída
s = zeros(size(f_double));
% limite inferior e superior da faixa de intensidades
A = 10;
B = 40;
% valor da intensidade a ser atribuída à faixa de interesse
T = 250;
% valor de intensidade para fora da faixa definida
t = 1;

% Aplica o Gray Level Slicing
    for i = 1:numel(f_double)
        if f_double(i) >= A && f_double(i) <= B
            s(i) = T;
        else
            s(i) = t; % Ou outro valor de fundo
        end
    end
s = uint8(s);

figure, imshow(s)