clear all;

img = imread('A19.bmp');

% pole powierzchni
pp = sum(img(:));


% ----------- Sposob nr 1 ZLE ----------
% vect = chain(img);
% even = mod(vect,2)==0; % parzysty/pionowe-poziome
% odd = mod(vect,2)~=0; % nieparzyste/skoœne
% oeven = sum(even); 
% oodd = sum(odd);
% % obwod
% obw = oeven + oodd;
% Wynik obwodu z pierwiastkiem
% zapisac na kartce w postaci:
% oodd*pierwiastek + oeven


% ----------- Sposob nr 2 ----------
% i = imdilate(img,strel('square',11)); % dodajemy dylatacje z maska kwadratowa o rozmiarze 7 
i = imerode(img,strel('square',7));  % dodajemy erozje z maska kwadratowa o rozmiarze 7 
imob = bwperim(i); % tworzymy obwod obiektu
kl = chain(imob);  % ³añcuchujemy zobwodowany obiekt

nieparz = sum(mod(kl,2));   % skoœne
parz = numel(kl) - nieparz; % pion-poziom

% Wynik obwodu z pierwiastkiem
% zapisac na kartce w postaci:
% nieparzyste*pierwiastek + parzyste

ob = bwperim(img);

ob2 = sum(ob(:));