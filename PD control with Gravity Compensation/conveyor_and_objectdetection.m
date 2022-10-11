clf;clc;clear all;

%% Setting Conveyer Params
v_belt = 0.3; width = 1; time_update = 0.1;

%% initialisation of variables
blocks = 0;
x = zeros(20,2);
count=0;
x_prop(1,1) = 'r';x_prop(1,2) = 'o';
A = ['r','g','b','b'];
B = ['o','s','^','d'];

%% Initialize video
Conveyer_Video = VideoWriter('Conveyervideo','MPEG-4');
Conveyer_Video.FrameRate = 10;
open(Conveyer_Video)

%% Generating blocks and moving them

while (count<100)
    if (rand()>0.8) %20 percent chance of block generation
        blocks=blocks+1;
        x(blocks,:) = [0,0.9*rand()+0.1]; %placement on the y axis
        x_prop(blocks+1,1) = randsample(A,1);x_prop(blocks+1,2) = randsample(B,1);
    end
    x(:,1)=x(:,1)+v_belt*time_update;
    pause(time_update)
    for c=1:blocks
        s = scatter(x(c,1),x(c,2),char(x_prop(c,1)),"filled",char(x_prop(c,2)));
        s.SizeData = 1000;
        xlim([0 1]);
        ylim([0 1]);
        drawnow
        hold on
    end
    % Writing the video
    set(gca, 'Visible', 'off')
    frame = getframe(gcf); %get frame
    writeVideo(Conveyer_Video, frame);
    %exportgraphics(gcf,'conveyer.gif','Resolution',300,'Append',true)
    hold off;
    count=count+1;
end

%% exporting the final image of the conveyer at end of simulation
% set(gca, 'Visible', 'off')
% exportgraphics(gcf,'conveyer.png','Resolution',50,'BackgroundColor','black','ContentType','image')

%% Channel Separation and saving into component images
A = imread("conveyer.png");
argb = rgb2gray(A);
R = A(:,:,1);
imwrite(R,'rimage.png','png')
G = A(:,:,2);
imwrite(G,'gimage.png','png')
B = A(:,:,3);
imwrite(B,'bimage.png','png')
[centers, radii] = imfindcircles(B,[10 150],'ObjectPolarity','bright','Sensitivity',0.92);
numCircles = size(centers,1);
originalImage = argb;
[labeledImage, numberOfBlobs] = bwlabel(originalImage, 8);
props = regionprops(labeledImage, originalImage, 'all');