% Leitura de uma imagem
f = imread('1014_629904228.png');
f_gray = im2gray(f); % Converte para escala de cinza, se necessário

% Remove o ruido com o filtro Wiener
Img_f = wiener2(f_gray,[3 3]);

figure;
subplot(1, 2, 1), imshow(f_gray), title('Imagem Original');
%subplot(1, 3, 2), imshow(J_img), title('Imagem com ruído');
subplot(1, 2, 2), imshow(Img_f), title('Filtro Wiener');

calculatePSNR = 10 * log10(255^2 / mean((double(f_gray(:)) - double(Img_f(:))).^2))
