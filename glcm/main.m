clear all;

img = imread('T29.bmp');

luv=cv.cvtColor(img,'RGB2Luv');
zmienna = luv(:,:,1);
[obraz, obraz1] = glcm2(zmienna,[0 1]);
obraz3 = obraz - obraz1;
a=0;
for i=1:255
    for j=1:255
        if obraz3(i,j)~=0
            a=a+1;
        end
    end
end

% ------------- Sposób nr 2 ----------------

% imgLuv=cv.cvtColor(img,'RGB2Luv');
% imgL = luv(:,:,1);
% 
% imgHLS=cv.cvtColor(img,'RGB2HLS');
% imgH = hls(:,:,2);

% imgGray = cv.cvtColor(img,'RGB2XYZ');
% imgG = imgGray(:,:,2);

% ***************** TO JEST ZLE *******
% [obraz1, obraz2] = glcm2(img,[0 1]);
% obraz1_sum = sum(obraz1(:));
% obraz2_sum = sum(obraz2(:));
% **************************************

% tableGLCM = GLCM(imgG,[0 1]);
% tableGLCMT = GLCMT(imgG,[0 1]);
% wyn = tableGLCM >10;
% wynt = tableGLCMT >10;
% suma = sum(wyn(:));
% sumat = sum(wynt(:));
