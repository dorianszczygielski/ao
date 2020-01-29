function out = czyszczenie(img)

ramka=img;   
ramka(2:end-1,2:end-1)=0;

se=true(3);

for i=0:500
    ramka=logical(imdilate(ramka,se));
    ramka=logical(bitand(ramka,img));
end

out=logical(img-ramka);
