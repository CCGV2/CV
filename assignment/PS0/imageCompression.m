% (a)
img = rgb2gray(imread('flower.bmp'));
% imshow(img);
img=double(img);
[U,S,V] = svd(img);

S;
top10 = zeros(10,1);
for i=1:10
    top10(i,1) = S(i,i);
end

top10;
% (a) end

% (b)

tmp1 = zeros(size(S,1)-10, 10);
tmp2 = zeros(10,size(S,2)-10);
tmp3 = zeros(size(S,1)-10, size(S,1)-10);
S2 = [S(1:10,1:10) tmp2; tmp1 tmp3];
img2 = U*S2*V';
size(S)
size(S2)
% imshow(uint8(img2));

tmp1 = zeros(size(S,1)-50, 50);
tmp2 = zeros(50,size(S,2)-50);
tmp3 = zeros(size(S,1)-50, size(S,1)-50);
S3 = [S(1:50,1:50) tmp2; tmp1 tmp3];
img3 = U*S3*V';

% imshow(uint8(img3));
tmp1 = zeros(size(S,1)-100, 100);
tmp2 = zeros(100,size(S,2)-100);
tmp3 = zeros(size(S,1)-100, size(S,1)-100);
S4 = [S(1:100,1:100) tmp2; tmp1 tmp3];
img4 = U*S4*V';
imshow(uint8(img4));
% (b) end
