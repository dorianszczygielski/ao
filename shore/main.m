clear all;



img = imread('E08.bmp');
img_clear = czyszczenie(img); % czyszczenie obrazka

imshow(img)
figure
imshow(img_clear);

img_sum = sum(img(:)); % sumowanie pixeli na obrazku
img_clear_sum = sum(img_clear(:)); % sumowanie pixeli na wyczyszczonym obrazku

roznica = img - img_clear;  % odjecie obrazka orginalnego od wyczyszczonego
roznica_sum = sum(roznica(:)); % wyliczenie sumy pixeli po odejmowaniu obrazkow

[rows,cols]=size(img); % pobranie wierszy i kolumn z oryginalnego obrazka
procenty = roznica_sum/(cols*rows)*100; % obiekty ktore stykaja sie z krawedzia
procenty2 = img_clear_sum/(cols*rows)*100; % obiekty ktore NIE stykaja sie z krawedzia



