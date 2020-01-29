function out=glcm(img,v)

img=rgb2gray(img);

mat=zeros(255);
[J,K]=size(img);

for j=1:J-v(1)
    for k=1:K-v(2)
        y=img(j,k)+1;
        x=img(j+v(1),k+v(2))+1;
        mat(y,x)=mat(y,x)+1;        
    end
end

out=mat;