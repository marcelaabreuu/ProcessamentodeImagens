f=imread('artePB.png');

%Conversão RGB para Grayscale
R=f(:,:,1); % matriz correspondente a componente RED
G=f(:,:,2); % matriz correspondente a componente GREEN
B=f(:,:,3); % matriz correspondente a componenteBLUE
f2=0.299 * R + 0.587 * G + 0.114 * B;
tamanho_janela = 3;

% Dimensões da imagem
[m, n] = size(f2);

% Tamanho da máscara e meio dela
pad = floor(tamanho_janela / 2);

% Criar uma imagem com padding (borda replicada)
f_padded = padarray(f2, [pad pad], 'replicate');

% Inicializa a imagem de saída
f_mediana = zeros(m, n);

% Iterar sobre cada pixel da imagem original
for i = 1:m
    for j = 1:n
        % Extrair a janela local da imagem com padding
        janela = f_padded(i:i+tamanho_janela-1, j:j+tamanho_janela-1);
        
        % Transformar a janela em um vetor e ordenar
        vetor_janela = sort(janela(:));
        
        % Calcular a mediana (elemento do meio)
        % Para tamanhos ímpares, a mediana é o elemento central
        f_mediana(i, j) = vetor_janela(ceil(numel(vetor_janela) / 2));
    end
end

% Conversão para uint8 para exibir a imagem
f_mediana = uint8(f_mediana);
figure, imshow(f_mediana)