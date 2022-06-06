clc;clear all;
A = imread("conveyer.png");
argb = rgb2gray(A);
R = A(:,:,1);
imwrite(R,'rimage.png','png')
G = A(:,:,2);
imwrite(G,'gimage.png','png')
B = A(:,:,3);
imwrite(B,'bimage.png','png')
[centers, radii] = imfindcircles(R,[10 150],'ObjectPolarity','bright','Sensitivity',0.92);
numCircles = length(centers)
% originalImage = imread('conveyer.png');
originalImage = argb;
[labeledImage, numberOfBlobs] = bwlabel(originalImage, 8);
props = regionprops(labeledImage, originalImage, 'all');


