function [ out ] = GLCM_EMI( in,offset )

[M,N] = size(in);
table = zeros(256);

for y = 1:M
for x = 1:N
    i=in(y,x)+1;
    
    jy= y+offset(1);
    jx = x+offset(2);
    if jy>M || jx>N
        continue;
    end
    j=in(jy,jx)+1;
    table(i,j)=table(i,j)+1;
   % table(in(y,x)+1,in(y,x+1)+1) = table(in(y,x)+1,in(y,x+1)+1)+1 ;
end
end

out = table;

end

