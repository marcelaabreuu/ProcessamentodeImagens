filename = 'TPDI.xlsx';
sheetNames = sheetnames(filename);
SheetRMSE = sheetNames{1}; % Seleciona a primeira aba

RMSEdata = readtable(filename, 'Sheet', SheetRMSE);

figure;
    plot(RMSEdata.MinMax, RMSEdata.Imagens, '-o', 'LineWidth', 1.5);
    title('Gráfico de RMSE');
    xlabel('Imagens');
    ylabel('RMSE');
    grid on;