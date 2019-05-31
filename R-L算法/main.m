clc,clear,close all
I=imread('1.tif');
% imshow(I)
%%
var1=0.003;
I_noise=imnoise(I,'gaussian',0,var1);
% imshow(I_noise)
%%
var2=70;
n=19;
PSF=fspecial('gaussian',n,var2);
I_blur=imfilter(I_noise,PSF);
subplot(1,2,1)
imshow(I_blur)
title('blurwithniose')
%%
I_blur=double(I_blur);
V = .0001;
LIM=ceil(size(PSF,1)/2);
WEIGHT=zeros(size(I_blur));
WEIGHT(1+LIM:end-LIM,1+LIM:end-LIM)=1;
g=deconvlucy(I_blur,PSF,20,sqrt(V),WEIGHT);

subplot(1,2,2)
imshow(uint8(g))