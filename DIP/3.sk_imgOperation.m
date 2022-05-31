clc
clear all
close all

% Arithmatic and logical operatoin on images
% Suraj Kumar Saini
% 2015KUEC2015
tic ;
R = imread('ritik1.jpg');
subplot(1,2,1)
imshow(R)
title('R');

D = imread('dhoni.jpg');
subplot(1,2,2)
imshow(D)
title('D');

% Arithmatic Operation on imagesk
add_img = imadd(R,D);       % addition
figure('Name','Arithmatic Operation'),
subplot(3,3,1)
imshow(uint8(add_img))
title('R + D');

sub_img = imsubtract(R,D);      % subtraction
subplot(3,3,2)
imshow(uint8(sub_img))
title('R - D');

absoluteDiff_img = imabsdiff(R,D);  % absolute difference
subplot(3,3,3)
imshow(uint8(absoluteDiff_img))
title('|R - D|');

multi_img = immultiply(R,D);    % multiplication
subplot(3,3,4)
imshow(uint8(multi_img));
title('R*D')

divi_img = imdivide(R,D);             % division
% figure('Name','Arithmatic Operation'),
subplot(3,3,5)
imshow(uint8(divi_img));
title('R / D')

comp_img1 = imcomplement(R);    % complement 
subplot(3,3,6)
imshow(uint8(comp_img1));
title('R complement')

comp_img2 = imcomplement(D);    % complement 
subplot(3,3,7)
imshow(uint8(comp_img2));
title('D complement')

% logical operation on images
bit_and = bitand(R,D);       % AND
figure('Name','logical operation'),
subplot(2,3,1)
imshow(bit_and)
title('R && D');

bit_or = bitor(R,D);       % OR
subplot(2,3,2)
imshow(bit_or)
title('R || D');

bit_xor = bitxor(R,D);       % XOR
subplot(2,3,3)
imshow(bit_xor)
title('R xor D');

bit_cmp1 = bitcmp(R);       % NOT
subplot(2,3,4)
imshow(bit_cmp1)
title('not R');

bit_cmp2 = bitcmp(D);       % NOT
subplot(2,3,5)
imshow(bit_cmp2)
title('not D');
toc;


