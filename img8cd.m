f=imread('girassolPB.png');

%Conversão RGB para Grayscale
R=f(:,:,1); % matriz correspondente a componente RED
G=f(:,:,2); % matriz correspondente a componente GREEN
B=f(:,:,3); % matriz correspondente a componenteBLUE
f2=0.299 * R + 0.587 * G + 0.114 * B;


% Definição do filtro Laplaciano (8 vizinhos)
h = [0 -1 0; -1 4 -1; 0 -1 0];

% Aplicação do Laplaciano
laplaciano = conv2(f2, h, 'same');

% Normalização para valores válidos de intensidade
laplaciano = uint8(laplaciano);

% Criação da imagem aguçada (original + Laplaciano)
img_agucada = uint8(f2 + laplaciano);

figure, imshow(img_agucada)