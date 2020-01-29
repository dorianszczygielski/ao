function out=srodek(img);

s=size(img);
k=0;
l=0;
pp=sum(img(:));

for i=1:s(1)
    for j=1:s(2)
        if img(i,j)>0
            k=k+i;
            l=l+j;
        end
    end
end

out=[k/pp,l/pp];