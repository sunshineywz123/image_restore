function g = ydmh( im,a,b,T )
%a水平
%b竖直
%T曝光
%%
f=double(im);
[row,col]=size(f);
M=2*row-1;
N=2*col-1;
%%
F=fft2(f,M,N);
% imshow(fftshift(log(abs(F))),[])
%%
%attention:sinx/x
H=zeros(M,N);
[U,V]=dftuv(M,N);
x=pi*(U*a+V*b);
for m=1:M
    for n=1:N
        if x(m,n)==0
            H(m,n)=1;
        else
            H(m,n)=T.*sin(x(m,n)).*exp(-1i*x(m,n))./x(m,n);
        end
    end
end
% imshow(abs(fftshift(H)),[])
% mesh(fftshift(abs((H(1:4:M,1:4:N)))))
%%
G=H.*F;
g=ifft2(G);
g=abs(g(1:row,1:col));
g=uint8(g);
end