f=imread('Cachorro.png');

%Conversão RGB para Grayscale
R=f(:,:,1); % matriz correspondente a componente RED
G=f(:,:,2); % matriz correspondente a componente GREEN
B=f(:,:,3); % matriz correspondente a componenteBLUE
f2=0.299 * R + 0.587 * G + 0.114 * B;
figure, imshow(f2)

% Cálculo do negativo
L = 256; % número de níveis de cinza (para imagens de 8 bits)
f_negativo = L - 1 - f2; % cálculo do negativo da imagem
figure, imshow(f_negativo)

%imwrite(f_negativo, 'cachorro_negativo.png');