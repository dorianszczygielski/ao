function [glcm] = glcm_poz( ob_norm )
%Opis funkcji:
%  Transformacja symetryczna pozioma glcm ze zwyk³ego obrazu

ob_grey = cv.cvtColor(ob_norm, 'RGB2GRAY');
glcm = zeros(256);
y = size(ob_grey,1);
x = size(ob_grey,2);
for i = 1 :  y
    for j = 1 : x - 1
        temp = ob_grey(i,j);
        temp1 = ob_grey(i,j + 1);
        glcm(temp+1,temp1+1) = glcm(temp+1,temp1+1) + 1;   
        glcm(temp1+1,temp+1) = glcm(temp1+1,temp+1) + 1;   
    end
end

end

