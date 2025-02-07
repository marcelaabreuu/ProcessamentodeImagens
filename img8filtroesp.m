f=imread('artePB.png');

%Conversão RGB para Grayscale
R=f(:,:,1); % matriz correspondente a componente RED
G=f(:,:,2); % matriz correspondente a componente GREEN
B=f(:,:,3); % matriz correspondente a componenteBLUE
f2=0.299 * R + 0.587 * G + 0.114 * B;

tamanho_janela = 7;

% Caso seja escala de cinza
% Criação do filtro de média
h = ones(tamanho_janela) / (tamanho_janela^2);

% Aplicação do filtro
f_suavizada = uint8(conv2(double(f2), h, 'same'));
figure, imshow(f_suavizada)