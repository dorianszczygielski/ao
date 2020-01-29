function [out,out2]=glcm2(img,v)

%img=rgb2gray(img);

mat=zeros(255);
mat1=zeros(255);
[J,K]=size(img);

for j=1:J-v(1)
    for k=1:K-v(2)
        y=img(j,k)+1;
        x=img(j+v(1),k+v(2))+1;
        mat(y,x)=mat(y,x)+1;
        mat(x,y)=mat(x,y)+1;    % przy niesymetrycznej usunac
    end
end

for j=1:J-v(2) 
    for k=1:K-v(1)       
        y=img(j,k)+1;
        x=img(j+v(2),k+v(1))+1;
        mat1(y,x)=mat1(y,x)+1;
        mat1(x,y)=mat1(x,y)+1;    % przy niesymetrycznej usunac
    end
end

out=mat;
out2=mat1;