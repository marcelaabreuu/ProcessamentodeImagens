% Leitura de uma imagem
f = imread('1014_629904228.png');
f_gray = im2gray(f); % Converte para escala de cinza

f_filtered = medfilt2(f_gray);

%subplot(1, 2, 1), imshow(f_gray), title('Imagem Original');
%subplot(1, 2, 2), imshow(f_filtered), title('Filtro Ajustado');
%imwrite(f_filtered, 'breast_median.png');

calculatePSNR = 10 * log10(255^2 / mean((double(f_gray(:)) - double(f_filtered(:))).^2))
