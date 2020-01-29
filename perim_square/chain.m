function out=chain(img)

[y,x]=find(img);
code=[0 1;1 1;1 0;1 -1;0 -1;-1 -1;-1 0;-1 1];

pkt=[y(1),x(1)];
out=[];
i=7;

while 1
    tmp=[pkt(1)+code(i+1,1),pkt(2)+code(i+1,2)];
    if img(tmp(1),tmp(2))
        out=[out,i];
        pkt=tmp;
        i=mod(i-2,8);
        continue;
    end
    i=mod(i+1,8);
    if pkt(1)==y(1) && pkt(2)==x(1) && i==7
        break;
    end
end