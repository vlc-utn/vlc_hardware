%% Analisis de todas las mediciones de los distintos circuitos
clc; clear; close all;

fsize1 = 32;
fsize2 = 48;
lwidth = 2;
msize1 = 16;
mindex = 10;
plotPDF = true;

if (plotPDF)
    window="maximized";
else
    window="normal";
end
blue1 = [0, 0 ,1];
%blue1 = [0.3010, 0.7450, 0.9330];
blue2 = [0, 0.4470, 0.7410];
red1 = [0.8500, 0.3250, 0.0980];
red2 = [0.6350, 0.0780, 0.1840];
green1 = [0.4660, 0.6740, 0.1880];
green2 = [0, 0.5, 0];
violet1 = [0.4940, 0.1840, 0.5560];
violet2 = [0.75, 0, 0.75];

%% Filtro T
[freq_t1, s11_t1, s21_t1] = file2s("mediciones/individuales/t1_microstrip.s2p");
[freq_t2, s11_t2, s21_t2] = file2s("mediciones/individuales/t2_microstrip.s2p");
[freq_t3, s11_t3, s21_t3] = file2s("mediciones/individuales/t3_microstrip.s2p");

fig1 = figure(WindowState=window);
plot(freq_t1, s11_t1, ...
    LineWidth=lwidth, Marker="square", MarkerSize=msize1, Color=blue2, ...
    DisplayName="T1: $|S_{11}|$", MarkerIndices=1:mindex:length(freq_t1)); hold on;
plot(freq_t2, s11_t2, ...
    LineWidth=lwidth, Marker="diamond", MarkerSize=msize1, Color=red2, ...
    DisplayName="T2: $|S_{11}|$", MarkerIndices=1:mindex:length(freq_t2)); hold on;
plot(freq_t3, s11_t3, ...
    LineWidth=lwidth, Marker="^", MarkerSize=msize1, Color=green2, ...
    DisplayName="T3: $|S_{11}|$", MarkerIndices=1:mindex:length(freq_t3)); hold on;

plot(freq_t1, s21_t1, ...
    LineWidth=lwidth, Marker="x", MarkerSize=msize1, Color=blue1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_t1)); hold on;
plot(freq_t2, s21_t2, ...
    LineWidth=lwidth, Marker=".", MarkerSize=msize1, Color=red1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_t2)); hold on;
plot(freq_t3, s21_t3, ...
    LineWidth=lwidth, Marker="v", MarkerSize=msize1, Color=green1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_t3)); hold on;

lgd = legend(Interpreter="latex", FontSize=fsize1, Location="southeast");
lgd.NumColumns = 2;
title(lgd, "Filtros T", Interpreter="latex");
ylabel("Par\'ametros S [dB]", FontSize=fsize1, Interpreter="latex");
xlabel("Frecuencia [MHz]", FontSize=fsize1, Interpreter="latex");
xlim([min(freq_t1), max(freq_t1)])
grid on;
fontsize(gca, fsize1, "points");
set(gca,'TickLabelInterpreter','latex');

%% Amplificador BGA
[freq_bga, s11_bga, s21_bga, s22_bga, s12_bga] = file2s("mediciones/individuales/bga616_a_5v.s2p");

fig2 = figure(WindowState=window);
plot(freq_bga, s11_bga, ...
    LineWidth=lwidth, Marker="square", MarkerSize=msize1, ...
    DisplayName="$|S_{11}|$", MarkerIndices=1:mindex:length(freq_bga)); hold on;
plot(freq_bga, s21_bga, ...
    LineWidth=lwidth, Marker="x", MarkerSize=msize1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_bga)); hold on;
plot(freq_bga, s22_bga, ...
    LineWidth=lwidth, Marker="^", MarkerSize=msize1, ...
    DisplayName="$|S_{22}|$", MarkerIndices=1:mindex:length(freq_bga)); hold on;

lgd = legend(Interpreter="latex", FontSize=fsize2, Location="east");
lgd.NumColumns = 3;
title(lgd, "Amp. BGA616", Interpreter="latex");
ylabel("Par\'ametros S [dB]", FontSize=fsize2, Interpreter="latex");
xlabel("Frecuencia [MHz]", FontSize=fsize2, Interpreter="latex");
xlim([min(freq_bga), max(freq_bga)])
grid on;
fontsize(gca, fsize2, "points");
set(gca,'TickLabelInterpreter','latex');

%% Amplificador TX AMP
[freq_tx_amp, s11_tx_amp, s21_tx_amp, s22_tx_amp, s12_tx_amp] = file2s("mediciones/individuales/tx_amp_b_12v.s2p");

fig3 = figure(WindowState=window);
plot(freq_tx_amp, s11_tx_amp, ...
    LineWidth=lwidth, Marker="square", MarkerSize=msize1, ...
    DisplayName="$|S_{11}|$", MarkerIndices=1:mindex:length(freq_tx_amp)); hold on;
plot(freq_tx_amp, s21_tx_amp, ...
    LineWidth=lwidth, Marker="x", MarkerSize=msize1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_tx_amp)); hold on;
plot(freq_tx_amp, s22_tx_amp, ...
    LineWidth=lwidth, Marker="^", MarkerSize=msize1, ...
    DisplayName="$|S_{22}|$", MarkerIndices=1:mindex:length(freq_tx_amp)); hold on;

lgd = legend(Interpreter="latex", FontSize=fsize2, Position=[0.69,0.6,0.1,0.1]);
lgd.NumColumns = 3;
title(lgd, "Amp. BRF740L3RH", Interpreter="latex");
ylabel("Par\'ametros S [dB]", FontSize=fsize2, Interpreter="latex");
xlabel("Frecuencia [MHz]", FontSize=fsize2, Interpreter="latex");
xlim([min(freq_tx_amp), max(freq_tx_amp)])
grid on;
fontsize(gca, fsize2, "points");
set(gca,'TickLabelInterpreter','latex');

%% Amplificador FCA
[freq_fca, s11_fca, s21_fca, s22_fca, s12_fca] = file2s("mediciones/individuales/fca_chb_00.s2p");

fig4 = figure(WindowState=window);
plot(freq_fca, s11_fca, ...
    LineWidth=lwidth, Marker="square", MarkerSize=msize1, ...
    DisplayName="$|S_{11}|$", MarkerIndices=1:mindex:length(freq_fca)); hold on;
plot(freq_fca, s21_fca, ...
    LineWidth=lwidth, Marker="x", MarkerSize=msize1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_fca)); hold on;
plot(freq_fca, s22_fca, ...
    LineWidth=lwidth, Marker="^", MarkerSize=msize1, ...
    DisplayName="$|S_{22}|$", MarkerIndices=1:mindex:length(freq_fca)); hold on;

lgd = legend(Interpreter="latex", FontSize=fsize2, Location="east");
lgd.NumColumns = 3;
title(lgd, "Amp. OPA2675", Interpreter="latex");
ylabel("Par\'ametros S [dB]", FontSize=fsize2, Interpreter="latex");
xlabel("Frecuencia [MHz]", FontSize=fsize2, Interpreter="latex");
xlim([min(freq_fca), max(freq_fca)])
grid on;
fontsize(gca, fsize2, "points");
set(gca,'TickLabelInterpreter','latex');

%% TIA LTC
[freq_ltc, s11_ltc, s21_ltc, s22_ltc, s12_ltc] = file2s("mediciones/individuales/tia_ltc_pd.s2p");

fig5 = figure(WindowState=window);
plot(freq_ltc, s11_ltc, ...
    LineWidth=lwidth, Marker="square", MarkerSize=msize1, ...
    DisplayName="$|S_{11}|$", MarkerIndices=1:mindex:length(freq_ltc)); hold on;
plot(freq_ltc, s21_ltc, ...
    LineWidth=lwidth, Marker="x", MarkerSize=msize1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_ltc)); hold on;
plot(freq_ltc, s22_ltc, ...
    LineWidth=lwidth, Marker="^", MarkerSize=msize1, ...
    DisplayName="$|S_{22}|$", MarkerIndices=1:mindex:length(freq_ltc)); hold on;

lgd = legend(Interpreter="latex", FontSize=fsize2, Location="southeast");
lgd.NumColumns = 3;
title(lgd, "TIA LTC6268-10", Interpreter="latex");
ylabel("Par\'ametros S [dB]", FontSize=fsize2, Interpreter="latex");
xlabel("Frecuencia [MHz]", FontSize=fsize2, Interpreter="latex");
xlim([min(freq_ltc), max(freq_ltc)])
grid on;
fontsize(gca, fsize2, "points");
set(gca,'TickLabelInterpreter','latex');

%% TIA LMH
[freq_lmh, s11_lmh, s21_lmh, s22_lmh, s12_lmh] = file2s("mediciones/individuales/lmh34400_pd.s2p");

fig6 = figure(WindowState=window);
plot(freq_lmh, s11_lmh, ...
    LineWidth=lwidth, Marker="square", MarkerSize=msize1, ...
    DisplayName="$|S_{11}|$", MarkerIndices=1:mindex:length(freq_lmh)); hold on;
plot(freq_lmh, s21_lmh, ...
    LineWidth=lwidth, Marker="x", MarkerSize=msize1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_lmh)); hold on;
plot(freq_lmh, s22_lmh, ...
    LineWidth=lwidth, Marker="^", MarkerSize=msize1, ...
    DisplayName="$|S_{22}|$", MarkerIndices=1:mindex:length(freq_lmh)); hold on;

lgd = legend(Interpreter="latex", FontSize=fsize2, Location="southeast");
lgd.NumColumns = 3;
title(lgd, "TIA LMH34400", Interpreter="latex");
ylabel("Par\'ametros S [dB]", FontSize=fsize2, Interpreter="latex");
xlabel("Frecuencia [MHz]", FontSize=fsize2, Interpreter="latex");
xlim([min(freq_lmh), max(freq_lmh)])
grid on;
fontsize(gca, fsize2, "points");
set(gca,'TickLabelInterpreter','latex');

%% Parcial tx - error
[freq_t3_fca, s11_t3_fca, s21_t3_fca] = file2s("mediciones/parciales_tx/t3__fca_12v.s2p");
[freq_t3_bga_fca, s11_t3_bga_fca, s21_t3_bga_fca] = file2s("mediciones/parciales_tx/t3__bga__fca_12v.s2p");

fig7 = figure(WindowState=window);
plot(freq_t3_fca, s11_t3_fca, ...
    LineWidth=lwidth, Marker="square", MarkerSize=msize1, Color=blue2, ...
    DisplayName="T3 + OPA2675: $|S_{11}|$", MarkerIndices=1:mindex:length(freq_t3_fca)); hold on;
plot(freq_t3_bga_fca, s11_t3_bga_fca, ...
    LineWidth=lwidth, Marker="diamond", MarkerSize=msize1, Color=red2, ...
    DisplayName="T3 + BGA + OPA2675: $|S_{11}|$", MarkerIndices=1:mindex:length(freq_t3_bga_fca)); hold on;

plot(freq_t3_fca, s21_t3_fca, ...
    LineWidth=lwidth, Marker="x", MarkerSize=msize1, Color=blue1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_t3_fca)); hold on;
plot(freq_t3_bga_fca, s21_t3_bga_fca, ...
    LineWidth=lwidth, Marker=".", MarkerSize=msize1, Color=red1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_t3_bga_fca)); hold on;

lgd = legend(Interpreter="latex", FontSize=fsize1, Location="southeast");
lgd.NumColumns = 2;
title(lgd, "Iteraciones del Tx", Interpreter="latex");
ylabel("Par\'ametros S [dB]", FontSize=fsize1, Interpreter="latex");
xlabel("Frecuencia [MHz]", FontSize=fsize1, Interpreter="latex");
xlim([min(freq_lmh), max(freq_lmh)])
grid on;
fontsize(gca, fsize1, "points");
set(gca,'TickLabelInterpreter','latex');

%% Parcial tx - correcto
[freq_t2_bga_t3_fca, s11_t2_bga_t3_fca, s21_t2_bga_t3_fca] = file2s("mediciones/parciales_tx/t2__bga__t3__fca12v.s2p");

fig8 = figure(WindowState=window);
plot(freq_t2_bga_t3_fca, s11_t2_bga_t3_fca, ...
    LineWidth=lwidth, Marker="square", MarkerSize=msize1, ...
    DisplayName="$|S_{11}|$", MarkerIndices=1:mindex:length(freq_t2_bga_t3_fca)); hold on;
plot(freq_t2_bga_t3_fca, s21_t2_bga_t3_fca, ...
    LineWidth=lwidth, Marker="x", MarkerSize=msize1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_t2_bga_t3_fca)); hold on;

lgd = legend(Interpreter="latex", FontSize=fsize1, Location="southeast");
lgd.NumColumns = 2;
title(lgd, "Tx completo (T2+T3)", Interpreter="latex");
ylabel("Par\'ametros S [dB]", FontSize=fsize1, Interpreter="latex");
xlabel("Frecuencia [MHz]", FontSize=fsize1, Interpreter="latex");
xlim([min(freq_lmh), max(freq_lmh)])
grid on;
fontsize(gca, fsize1, "points");
set(gca,'TickLabelInterpreter','latex');

%% Full lowpasss
[freq_t3_bga_fca_led_sfh_ltc_bga, s11_t3_bga_fca_led_sfh_ltc_bga, s21_t3_bga_fca_led_sfh_ltc_bga] = file2s("mediciones/full/t3__bga__fca12v__led21__sfh203__ltc__bga.s2p");

fig9 = figure(WindowState=window);
plot(freq_t3_bga_fca_led_sfh_ltc_bga, s11_t3_bga_fca_led_sfh_ltc_bga, ...
    LineWidth=lwidth, Marker="square", MarkerSize=msize1, ...
    DisplayName="$|S_{11}|$", MarkerIndices=1:mindex:length(freq_t3_bga_fca_led_sfh_ltc_bga)); hold on;
plot(freq_t3_bga_fca_led_sfh_ltc_bga, s21_t3_bga_fca_led_sfh_ltc_bga, ...
    LineWidth=lwidth, Marker="x", MarkerSize=msize1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_t3_bga_fca_led_sfh_ltc_bga)); hold on;

lgd = legend(Interpreter="latex", FontSize=fsize1, Location="southeast");
lgd.NumColumns = 2;
title(lgd, "Tx-Rx (solo T3)", Interpreter="latex");
ylabel("Par\'ametros S [dB]", FontSize=fsize1, Interpreter="latex");
xlabel("Frecuencia [MHz]", FontSize=fsize1, Interpreter="latex");
xlim([min(freq_t3_bga_fca_led_sfh_ltc_bga), max(freq_t3_bga_fca_led_sfh_ltc_bga)])
grid on;
fontsize(gca, fsize1, "points");
set(gca,'TickLabelInterpreter','latex');

%% Full final
[freq_t2_bga_t3_fca_led_sfh_ltc_bga, s11_t2_bga_t3_fca_led_sfh_ltc_bga, s21_t2_bga_t3_fca_led_sfh_ltc_bga] = file2s("mediciones/full/t2__bga__t3__fca12v__led21__sfh203__ltc__bga.s2p");

fig10 = figure(WindowState=window);
plot(freq_t2_bga_t3_fca_led_sfh_ltc_bga, s11_t2_bga_t3_fca_led_sfh_ltc_bga, ...
    LineWidth=lwidth, Marker="square", MarkerSize=msize1, ...
    DisplayName="$|S_{11}|$", MarkerIndices=1:mindex:length(freq_t2_bga_t3_fca_led_sfh_ltc_bga)); hold on;
plot(freq_t2_bga_t3_fca_led_sfh_ltc_bga, s21_t2_bga_t3_fca_led_sfh_ltc_bga, ...
    LineWidth=lwidth, Marker="x", MarkerSize=msize1, ...
    DisplayName="$|S_{21}|$", MarkerIndices=1:mindex:length(freq_t2_bga_t3_fca_led_sfh_ltc_bga)); hold on;

lgd = legend(Interpreter="latex", FontSize=fsize1, Location="southeast");
lgd.NumColumns = 2;
title(lgd, "Sistema completo", Interpreter="latex");
ylabel("Par\'ametros S [dB]", FontSize=fsize1, Interpreter="latex");
xlabel("Frecuencia [MHz]", FontSize=fsize1, Interpreter="latex");
xlim([min(freq_t3_bga_fca_led_sfh_ltc_bga), max(freq_t3_bga_fca_led_sfh_ltc_bga)])
grid on;
fontsize(gca, fsize1, "points");
set(gca,'TickLabelInterpreter','latex');

%% Saving as pdf
if (plotPDF)
    exportgraphics(fig1, 'pdf/filtro_t.pdf', ContentType='vector');
    exportgraphics(fig2, 'pdf/amp_bga.pdf', ContentType='vector');
    exportgraphics(fig3, 'pdf/amp_brf.pdf', ContentType='vector');
    exportgraphics(fig4, 'pdf/fca.pdf', ContentType='vector');
    exportgraphics(fig5, 'pdf/tia_ltc.pdf', ContentType='vector');
    exportgraphics(fig6, 'pdf/tia_lmh.pdf', ContentType='vector');
    exportgraphics(fig7, 'pdf/parcial_tx_error.pdf', ContentType='vector');
    exportgraphics(fig8, 'pdf/parcial_tx_ok.pdf', ContentType='vector');
    exportgraphics(fig9, 'pdf/full_error.pdf', ContentType='vector');
    exportgraphics(fig10, 'pdf/full_ok.pdf', ContentType='vector');
end