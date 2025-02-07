% Código para conversão de uma imagem colorida para transformação
% logaritmica
%Leitura de uma imagem colorida
f=imread('Cachorro.png');
%figure, imshow(f)
%Conversão RGB para Grayscale
R=f(:,:,1); % matriz correspondente a componente RED
G=f(:,:,2); % matriz correspondente a componente GREEN
B=f(:,:,3); % matriz correspondente a componenteBLUE
f2=0.299 * R + 0.587 * G + 0.114 * B;

imagemDouble = double(f2);
% Cálculo do log
c = 5; 
imgLog = uint8(c * log(1 + imagemDouble)); % cálculo do log da imagem

figure, imshow(imgLog)

imwrite(imgLog, 'cachorro_2log65.png');