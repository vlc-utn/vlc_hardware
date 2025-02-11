%% Analizador de espectro
% Ploteo de las mediciones del analizador de espectro
clc; clear; close all;

fsize = 48;
lwidth = 2;
msize=16;
window="maximized";
mindex=20;

blue1 = [0, 0 ,1];
%blue1 = [0.3010, 0.7450, 0.9330];
blue2 = [0, 0.4470, 0.7410];
red1 = [0.8500, 0.3250, 0.0980];
red2 = [0.6350, 0.0780, 0.1840];
green1 = [0.4660, 0.6740, 0.1880];
green2 = [0, 0.5, 0];
violet1 = [0.4940, 0.1840, 0.5560];
violet2 = [0.75, 0, 0.75];

%% Medición de la salida de la red pitaya

file_input = "mediciones/ae/input.CSV";
file_t3 = "mediciones/ae/T3.CSV";
file_t2_t3 = "mediciones/ae/T2_T3.CSV";

matrix_input = readmatrix(file_input);
freq_input = matrix_input(:,2)*1e-6;
amplitude_input = matrix_input(:,4);

matrix_t3 = readmatrix(file_t3);
freq_t3 = matrix_t3(:,2)*1e-6;
amplitude_t3 = matrix_t3(:,4);

matrix_t2_t3 = readmatrix(file_t2_t3);
freq_t2_t3 = matrix_t2_t3(:,2)*1e-6;
amplitude_t2_t3 = matrix_t2_t3(:,4);

%% Medición del sistema completo con T3
fig1 = figure(WindowState=window);
plot(freq_input, amplitude_input, ...
    LineWidth=2, Marker="square", MarkerSize=msize, Color=blue2, ...
    DisplayName="Entrada", MarkerIndices=1:mindex:length(freq_input)); hold on;
plot(freq_t3, amplitude_t3, ...
    LineWidth=2, Marker="x", MarkerSize=msize, Color=red1, ...
    DisplayName="Salida", MarkerIndices=1:mindex:length(freq_input)); hold on;

lgd = legend(Interpreter="latex", FontSize=fsize, Location="northeast");
lgd.NumColumns = 2;
title(lgd, "Se\~nal OFDM con filtro T3", Interpreter="latex");
ylabel("Amplitud [dBm]", Interpreter="latex", FontSize=fsize);
xlabel("Frecuencia [MHz]", Interpreter="latex", FontSize=fsize);
xlim([min(freq_input), max(freq_input)]);
ylim([-80, -0]);
grid on;
fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

%% Medición del sistema completo con T2 + T3
fig2 = figure(WindowState=window);
plot(freq_input, amplitude_input, ...
    LineWidth=2, Marker="square", MarkerSize=msize, Color=blue2, ...
    DisplayName="Entrada", MarkerIndices=1:mindex:length(freq_input)); hold on;
plot(freq_t2_t3, amplitude_t2_t3, ...
    LineWidth=2, Marker="o", MarkerSize=msize, Color=green2, ...
    DisplayName="Salida", MarkerIndices=1:mindex:length(freq_input)); hold on;

lgd = legend(Interpreter="latex", FontSize=fsize, Location="northeast");
lgd.NumColumns = 2;
title(lgd, "Se\~nal OFDM del sistema completo", Interpreter="latex");
ylabel("Amplitud [dBm]", Interpreter="latex", FontSize=fsize);
xlabel("Frecuencia [MHz]", Interpreter="latex", FontSize=fsize);
xlim([min(freq_input), max(freq_input)]);
ylim([-80, -0]);
grid on;
fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

exportgraphics(fig1, 'pdf/ofdm_t3.pdf', ContentType='vector');
exportgraphics(fig2, 'pdf/ofdm_t2_t3.pdf', ContentType='vector');