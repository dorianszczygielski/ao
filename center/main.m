clear all;

img = imread('A19.bmp');


% Maska - taka zasada, ze 3 na 3
se = ones(3, 3);


% Do wyboru operacja
% ZW = max(img,imopen(imclose(imopen(img,se),se),se));
OW = min(img,imclose(imopen(imclose(img,se),se),se));
% otw_morf = imopen(img, se);
% zam_morf = imclose(img, se);

% Pierwsza wartoœæ to Y, druga to X!!
srodek = srodek(OW);