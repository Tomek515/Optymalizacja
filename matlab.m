I = imread('SobelFilterImage_Inputt.bmp');
img = imresize(I, [768/4,1024/4]);
I_noise_gray = imnoise(rgb2gray(img),'salt & pepper',0.10);
se = strel('disk',4)
tic
for i=1:100
    
L = medfilt2(I_noise_gray,[3 3], "symmetric");
end
time=toc/100



