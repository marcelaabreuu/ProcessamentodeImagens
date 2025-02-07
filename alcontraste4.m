%Leitura de uma imagem colorida
f=imread('Cachorro.png');
%Conversão RGB para Grayscale
R=f(:,:,1); % matriz correspondente a componente RED
G=f(:,:,2); % matriz correspondente a componente GREEN
B=f(:,:,3); % matriz correspondente a componenteBLUE
f2=0.299 * R + 0.587 * G + 0.114 * B;

f_double = double(f2);
% Encontrar o valor mínimo (rmin) e máximo (rmax) de intensidade da imagem
rmin = min(f_double(:));
rmax = max(f_double(:));

L = 256;  % Número de níveis de cinza para imagens de 8 bits

% Definir os valores de r1, s1, r2, s2 conforme o alargamento de contraste

r1 = rmin;
r2 = rmax;
s1 = 0;
s2 = L - 1;

% Aplica a transformação de alargamento de contraste
    img_transformada = (f_double - r1) * (s2 - s1) / (r2 - r1) + s1;
    
% Normaliza para o intervalo [0, 255] e converte para uint8
    img_transformada = uint8(img_transformada);

figure, imshow(img_transformada)