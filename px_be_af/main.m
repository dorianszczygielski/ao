clear all;

img = imread('A19.bmp');

% Negacja
% img_negative = ~img;
% imshow(img_negative);

% Maska
se = strel('square',5); % maska 'kwadratowa' o rozmiarze 5x5
%se = ones(7);

% Do wyboru operacja
% ZW = max(img,imopen(imclose(imopen(img,se),se),se));
% OW = min(img,imclose(imopen(imclose(img,se),se),se));
 otw_morf = imopen(img, se);
%zam_morf = imclose(img, se);

% Ilosc pikseli na wybranym zdjeciu
sum_orginal = sum(img(:));
sum_po_konwersji = sum(otw_morf(:));

% Roznica pikseli z wybranych zdjec
roznica = sum_orginal - sum_po_konwersji;
zmienna = img - otw_morf;
sum_zmienna = sum(zmienna(:));

