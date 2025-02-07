% Leitura de uma imagem
f = imread('1014_629904228.png');
f_gray = im2gray(f); % Converte para escala de cinza
se = strel('cube',3);
f_final = imerode(f_gray,se);

subplot(2, 2, 3), imshow(f_gray), title('Imagem Equalizada');
subplot(2, 2, 4), imshow(f_final), title('Histograma Equalizado');


calculatePSNR = 10 * log10(255^2 / mean((double(f_gray(:)) - double(f_final(:))).^2))
