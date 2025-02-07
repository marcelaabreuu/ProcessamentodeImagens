% Leitura de uma imagem
f = imread('breast.png');
f_gray = im2gray(f); % Converte para escala de cinza, se necessário

% Tamanho da máscara (3x3)
mask_size = 3;

% Adiciona padding à imagem para lidar com bordas
pad_size = floor(mask_size / 2);
f_padded = padarray(f_gray, [pad_size, pad_size], 'replicate');

% Inicializa a imagem de saída
f_median = zeros(size(f_gray), 'uint8');

% Aplicação do filtro de mediana
for i = 1:size(f_gray, 1)
    for j = 1:size(f_gray, 2)
        % Extrai a vizinhança da máscara
        neighborhood = f_padded(i:i+mask_size-1, j:j+mask_size-1);
        
        % Calcula a mediana da vizinhança
        f_median(i, j) = median(neighborhood(:));
    end
end

% Exibição da imagem original e da imagem processada
figure, imshow(f_gray);
figure, imshow(f_median)
imwrite(f_median, 'breast_median.png');