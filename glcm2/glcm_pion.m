function [glcm] = glcm_pion( ob_norm )
%Opis funkcji:
%  Transformacja symetryczna pionowa glcm ze zwyk³ego obrazu

ob_luv = cv.cvtColor(ob_norm, 'RGB2Luv');
ob_grey = ob_luv(:,:,1);
glcm = zeros(256);
y = size(ob_grey,1);
x = size(ob_grey,2);
for i = 1 :  y - 1
    for j = 1 : x
        temp = ob_grey(i,j);
        temp1 = ob_grey(i+1,j);
        glcm(temp, temp1) = glcm(temp, temp1) + 1;
        glcm(temp1, temp) = glcm(temp1, temp) + 1; 
    end
end

