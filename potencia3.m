% Código para conversão de uma imagem colorida para transformação
% de potencia
%Leitura de uma imagem colorida
f=imread('Cachorro.png');
%figure, imshow(f)
%Conversão RGB para Grayscale
R=f(:,:,1); % matriz correspondente a componente RED
G=f(:,:,2); % matriz correspondente a componente GREEN
B=f(:,:,3); % matriz correspondente a componenteBLUE
f2=0.299 * R + 0.587 * G + 0.114 * B;

fdouble = double(f2);
% Cálculo da transformação
c = 100; %maior c maior intensidade
y = -1; %y positivos geram imagem escura e valores negativos 

img = uint8(c*(fdouble .^ y)); % cálculo do log da imagem

figure, imshow(img)

%imwrite(imgLog, 'cachorro_2log65.png');