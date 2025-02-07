f=imread('artePB.png');

%Conversão RGB para Grayscale
R=f(:,:,1); % matriz correspondente a componente RED
G=f(:,:,2); % matriz correspondente a componente GREEN
B=f(:,:,3); % matriz correspondente a componenteBLUE
f2=0.299 * R + 0.587 * G + 0.114 * B;

% Conversão para tipo double para cálculos
f = double(f2);

% Dimensões da imagem
[m, n] = size(f2);
tamanho_janela =3;
% Inicializa a imagem de saída
f_max = zeros(m, n);

% Padding (bordas replicadas)
pad = floor(tamanho_janela / 2);
f_padded = padarray(f2, [pad pad], 'replicate');

% Aplica o filtro de máximo
for i = 1:m
    for j = 1:n
        % Obtém a janela 3x3 em torno de cada pixel
        janela = f_padded(i:i+tamanho_janela-1, j:j+tamanho_janela-1);
        
        % Substitui o pixel pela mediana da janela
        f_max(i, j) = max(janela(:)); % valor máximo
    end
end

figure, imshow(uint8(f_max))
