clc,clear,close all
I=imread('06.png');
I=rgb2gray(I);
I_out=ydmh(I,0.02,0.02,1);
%%
%pinpu
f=double(I_out);
[row,col]=size(f);
M=2*row-1;
N=2*col-1;
%%
F=fft2(f,M,N);
imshow(log(fftshift(abs(F))),[])