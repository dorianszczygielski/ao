%% Zad 1
obraz1 = imread('E11.bmp');

ramka = obraz1;
ramka(2:end-1,2:end-1) = 0;
po_dylatacji = ramka;
for i = 1 : 1 : 150
    po_dylatacji = cv.dilate(po_dylatacji) & obraz1;
end
lacznie = size(obraz1,1)*size(obraz1,2);
brzeg = sum(sum(po_dylatacji));
procent = (brzeg/lacznie)*100;
tekst3 = ['Procent ca³kowitej powierzchni obrazu zajmowanego przez obiekty dotykaj¹ce brzegu: ', num2str(procent),'%'];
disp(tekst3)
imageview(obraz1)
imageview(po_dylatacji)

%% Zad 2
obraz2 = imread('T17.bmp');
prog = 10;

glcm_poziomy = glcm_poz(obraz2);
glcm_pionowy = glcm_pion(obraz2);
poz = 0;
pion = 0;
for i = 1 : 256
	for j = 1 : 256
      if(glcm_poziomy(i,j) > prog)
         poz = poz +1;
      end
	end
end
for i = 1 : 256
	for j = 1 : 256
		if (glcm_pionowy(i,j) > prog)
         pion = pion +1;
      end
	end
end
tekst4 = ['Liczba dla poziomej macierzy GLCM: ', num2str(poz)];
disp(tekst4)
tekst5 = ['Liczba dla pionowej macierzy GLCM: ', num2str(pion)];
disp(tekst5)

%% Zad 3
obraz3 = imread('A05.bmp');

pole = sum(obraz3(:));
tekst6 = ['Pole: ', num2str(pole)];
disp(tekst6); %sum(sum(obraz_2))  %dwa sposoby na obliczenie pola
ramka2 = obraz3 - logical(cv.erode(obraz3)); %stworzenie ramki obiektu
[py, px] = find(ramka2);
p = [py, px]; %wektor z obrazu

%wektor przesuniêæ
directions = [ 0, 1;
               1, 1;
               1, 0;
               1,-1;
               0,-1;
              -1,-1;
              -1, 0;
              -1, 1];

pt = p(1,:); %punkt startowy
code = []; %The chain code
dir = 7; %poczatkowe przesuniecie
%sz = imsize(ramka)


%nie ogarniam tego ni¿ej
while 1
    newpt = pt + directions(dir+1,:);
   if newpt == any(p) %poprawiæ to
      cc = [cc,dir];
      pt = newpt;
      dir = mod(dir+2,8);
   else
      dir = mod(dir-1,8);
   end
   if all(pt) && dir==1 % back to starting situation
      break;
   end
end