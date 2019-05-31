clc,clear,close all
I=imread('06.png');
I=rgb2gray(I);
I_out=ydmh(I,0.07,0.02,1);
imshow(I_out)
title('motion')