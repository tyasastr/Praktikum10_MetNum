% Tyasastri Hning Kurniasih - L0325034
% Praktikum 9
% Perbandingan Metode Euler, Heun, RK4, dan Analitik - Galat

clc;
clear;

% Persamaan Diferensial
f = @(x,y) (4*x.^3 - 2*x + 1)./(2+y);

% Parameter
a = 0;
b = 2;
y0 = 1;
N = 15;

% Menghitung nilai eksak
yEksak = Eksak(b);

fprintf('\n========================================\n');
fprintf('       PENYELESAIAN PDB METODE NUMERIK\n');
fprintf('========================================\n');

% 1. Metode Analitik
fprintf('\nHasil Perhitungan Metode Analitik\n');
fprintf('y(2) = %.10f\n', yEksak);

% 2. Metode Euler
[xE, yE] = Euler(f,a,b,y0,N);
yEuler = yE(end);

% 3. Metode Heun
yHeun = Heun(f,a,b,y0,N);

% 4. Metode Runge-Kutta Orde 4
yRK4 = Runge4(f,a,b,y0,N);

% Menggabungkan hasil seluruh metode
hasilNumerik = [yEuler, yHeun, yRK4];

namaMetode = {'Euler', 'Heun', 'Runge-Kutta 4'};

% Menghitung galat
galatAbsolut = abs(yEksak - hasilNumerik);

galatRelatif = galatAbsolut / abs(yEksak);

galatPersentase = galatRelatif * 100;

% Menampilkan perbandingan hasil
fprintf('\n========================================\n');
fprintf('       PERBANDINGAN HASIL METODE\n');
fprintf('========================================\n');

fprintf('%-18s %-15s\n', 'Metode', 'Nilai y(2)');
fprintf('----------------------------------------\n');

for i = 1:3
  fprintf('%-18s %-15.10f\n', ...
          namaMetode{i}, hasilNumerik(i));
endfor

fprintf('%-18s %-15.10f\n', 'Analitik', yEksak);

% Menampilkan hasil galat
fprintf('\n========================================\n');
fprintf('             HASIL PERHITUNGAN GALAT\n');
fprintf('========================================\n');

fprintf('%-18s %-15s %-15s %-15s\n', ...
        'Metode', 'Galat Absolut', ...
        'Galat Relatif', 'Galat (%)');

fprintf('---------------------------------------------------------------\n');

for i = 1:3
  fprintf('%-18s %-15.10f %-15.10f %-15.6f\n', ...
          namaMetode{i}, ...
          galatAbsolut(i), ...
          galatRelatif(i), ...
          galatPersentase(i));
endfor

fprintf('---------------------------------------------------------------\n');
