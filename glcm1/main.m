%% Zad 1
obraz1 = imread('A09.bmp');
elem_strukt = cv.getStructuringElement('Shape','Rect', 'KSize', [5,5]);

%otwarcie
obrazOtw = cv.erode(obraz1, 'Element', elem_strukt, 'Iterations', 1);
obrazOtw = cv.dilate(obrazOtw, 'Element', elem_strukt, 'Iterations', 1);
obrazOtw = logical(obrazOtw);
ilosc1 = sum(sum(obraz1 - obrazOtw));
tekst1 = ['Iloœæ zmienionych pikseli po otwarciu: ', num2str(ilosc1)];
disp(tekst1)

%zamkniecie
obrazZam = cv.dilate(obraz1, 'Element', elem_strukt, 'Iterations', 1);
obrazZam = cv.erode(obrazZam, 'Element', elem_strukt, 'Iterations', 1);
obrazZam = logical(obrazZam);
ilosc2 = abs(sum(sum(obraz1 - obrazZam)));
tekst2 = ['Iloœæ zmienionych pikseli po zakmniêciu: ', num2str(ilosc2)];
disp(tekst2)

%% Zad 2
obraz2 = imread('E19.bmp');

ramka = obraz2;
ramka(2:end-1,2:end-1) = 0;
po_dylatacji = ramka;
for i = 1 : 1 : 100
    po_dylatacji = cv.dilate(po_dylatacji) & obraz2;
end
lacznie = size(obraz2,1)*size(obraz2,2);
brzeg = sum(sum(po_dylatacji));
procent = (brzeg/lacznie)*100;
tekst3 = ['Procent ca³kowitej powierzchni obrazu zajmowanego przez obiekty dotykaj¹ce brzegu: ', num2str(procent),'%'];
disp(tekst3)

%% Zad 3
obraz3 = imread('T29.bmp');
prog = 10;

glcm_poziomy = glcm_poz(obraz3);
glcm_pionowy = glcm_pion(obraz3);
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