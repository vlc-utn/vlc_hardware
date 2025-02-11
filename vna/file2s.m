function [freq, s11, s21, s22, s12] = file2s(file)
%FILE2S Convert S parameter file (s2p) to S parameters
    s = sparameters(file);
    freq = s.Frequencies*1e-6;
    s11 = s.Parameters(1,1,:);
    s11 = 20*log10(abs(s11(:)));

    s21 = s.Parameters(2,1,:);
    s21 = 20*log10(abs(s21(:)));

    s12 = s.Parameters(1,2,:);
    s12 = 20*log10(abs(s12(:)));

    s22 = s.Parameters(2,2,:);
    s22 = 20*log10(abs(s22(:)));
end

