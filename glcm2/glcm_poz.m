function [glcm] = glcm_poz( ob_norm )
%Opis funkcji:
%  Transformacja symetryczna pozioma glcm ze zwyk³ego obrazu

ob_luv = cv.cvtColor(ob_norm, 'RGB2Luv');
ob_grey = ob_luv(:,:,1);
glcm = zeros(256);
y = size(ob_grey,1);
x = size(ob_grey,2);
for i = 1 :  y
    for j = 1 : x - 1
        temp = ob_grey(i,j);
        temp1 = ob_grey(i,j + 1);
        glcm(temp, temp1) = glcm(temp, temp1) + 1;   
        glcm(temp1, temp) = glcm(temp1, temp) + 1;   
    end
end