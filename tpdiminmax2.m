% Leitura de uma imagem
f = imread('breast2.png');
f_gray = im2gray(f); % Converte para escala de cinza

% Definição do tamanho da máscara (3x3)
mask_size = 3;

% Padding da imagem (replicação de bordas)
pad_size = floor(mask_size / 2);
f_padded = padarray(f_gray, [pad_size, pad_size], 'replicate');

% Inicializa a imagem de saída
f_output = zeros(size(f_gray), 'uint8');

% Aplicação do filtro descrito
for i = 1:size(f_gray, 1)
    for j = 1:size(f_gray, 2)
        % Extrai a vizinhança da máscara
        neighborhood = f_padded(i:i+mask_size-1, j:j+mask_size-1);
        
        % Remove o elemento central da vizinhança
        neighborhood_excl_central = neighborhood(:);
        neighborhood_excl_central(pad_size * mask_size + pad_size + 1) = [];
        
        % Calcula os valores mínimo e máximo na vizinhança (excluindo o central)
        min_val = min(neighborhood_excl_central);
        max_val = max(neighborhood_excl_central);
        
        % Valor do elemento central
        central_val = f_padded(i+pad_size, j+pad_size);
        
        % Ajusta o valor do elemento central
        if central_val < min_val
            f_output(i, j) = min_val;
        elseif central_val > max_val
            f_output(i, j) = max_val;
        else
            f_output(i, j) = central_val;
        end
    end
end

subplot(2, 2, 3), imshow(f_gray), title('Imagem Equalizada');
subplot(2, 2, 4), imshow(f_output), title('Histograma Equalizado');
