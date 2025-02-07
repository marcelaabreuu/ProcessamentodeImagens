f=imread('Cachorro.png');

%Conversão RGB para Grayscale
R=f(:,:,1); % matriz correspondente a componente RED
G=f(:,:,2); % matriz correspondente a componente GREEN
B=f(:,:,3); % matriz correspondente a componenteBLUE
f2=0.299 * R + 0.587 * G + 0.114 * B;

[rows, cols] = size(f2);

% Inicializa o vetor de histograma (256 níveis de intensidade)
    hist_original = zeros(256, 1);
    
    % Percorre cada pixel da imagem e conta as intensidades
    for i = 1:size(f2, 1)
        for j = 1:size(f2, 2)
            intensidade = f2(i, j); % Valor do pixel
            hist_original(intensidade + 1) = hist_original(intensidade + 1) + 1; % Incrementa a contagem
        end
    end

cdf = cumsum(hist_original) / (rows * cols);

% Normaliza o CDF para o intervalo [0, 255]
cdf_normalizado = uint8(255 * cdf);

img_equalizada = cdf_normalizado(double(f2) + 1); % Ajusta os índices
    
% Inicializa o vetor de histograma equalizada (256 níveis de intensidade)
    hist_equalizado = zeros(256, 1);
    
    % Percorre cada pixel da imagem e conta as intensidades
    for i = 1:size(img_equalizada, 1)
        for j = 1:size(img_equalizada, 2)
            intensidade2 = img_equalizada(i, j); % Valor do pixel
            hist_equalizado(intensidade2 + 1) = hist_equalizado(intensidade2 + 1) + 1; % Incrementa a contagem
        end
    end

% Imagem Original
    subplot(2, 2, 1), imshow(f2), title('Imagem Original');
    subplot(2, 2, 2), bar(hist_original), title('Histograma Original');
    
% Imagem Equalizada
subplot(2, 2, 3), imshow(img_equalizada), title('Imagem Equalizada');
subplot(2, 2, 4), bar(hist_equalizado), title('Histograma Equalizado');

