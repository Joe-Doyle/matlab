%This is an image processing program that uses a photo of a standard
% schlage sc1 key and user input to determine key bitting

%terrible right now but works on high res photos pretty well
%To do: clean up the loops with vectors,
%plot full key, add user directions and comment code, clean up config with
%loops and vectors to minimize user effort and error
clear
try
    %key style config block
    numPins     = 10
    bladeWidth  = 0.343;
    depthTol    = 0.002;
    root0       = 0.335;
    root1       = 0.320;
    root2       = 0.305;
    root3       = 0.290;
    root4       = 0.275;
    root5       = 0.260;
    root6       = 0.245;
    root7       = 0.230;
    root8       = 0.215;
    root9       = 0.200;
    
    betRoot01   = 0.3275
    betRoot12   = 0.3125
    betRoot23   = 0.2975
    betRoot34   = 0.2825
    betRoot45   = 0.2675
    betRoot56   = 0.2525
    betRoot67   = 0.2375
    betRoot78   = 0.2225
    betRoot89   = 0.2075
    
    %open photo of key profile
    keyImage = imread('picOfKey.jpg');
    imshow(keyImage)
    hold on;
    
    %pixel to inch calibration
    [xblade1,yblade1] = ginput(1)
    plot(xblade1,yblade1,'g+','LineWidth',2)
    [xblade2,yblade2] = ginput(1)
    plot(xblade2,yblade2,'g+','LineWidth',2)
    plot([xblade1 xblade2],[yblade1 yblade2],'g','LineWidth',2)
    %change in x,y, to pixel distance
    pixWidth = sqrt((xblade1 - xblade2)^2 + (yblade1 - yblade2)^2)
    ppi = pixWidth/bladeWidth
    
    %loop number of pins
    for i = 1:numPins
        [xtop,ytop] = ginput(1);
        plot(xtop,ytop,'r+','LineWidth',2)
        [xbot,ybot] = ginput(1);
        plot(xbot,ybot,'r+','LineWidth',2)
        plot([xtop xbot],[ytop ybot],'r','LineWidth',2)
        pixWidth = sqrt((xtop - xbot)^2 + (ytop - ybot)^2)
        pix = pixWidth/ppi
        if pix > betRoot01
            text(xtop,ytop-50,'0','Color','red','FontSize',25)
            test(i) = 0
        elseif pix > betRoot12
            text(xtop,ytop-50,'1','Color','red','FontSize',25)
            test(i) = 1
        elseif pix > betRoot23
            text(xtop,ytop-50,'2','Color','red','FontSize',25)
            test(i) = 2
        elseif pix > betRoot34
            text(xtop,ytop-50,'3','Color','red','FontSize',25)
            test(i) = 3
        elseif pix > betRoot45
            text(xtop,ytop-50,'4','Color','red','FontSize',25)
            test(i) = 4
        elseif pix > betRoot56
            text(xtop,ytop-50,'5','Color','red','FontSize',25)
            test(i) = 5
        elseif pix > betRoot67
            text(xtop,ytop-50,'6','Color','red','FontSize',25)
            test(i) = 6
        elseif pix > betRoot78
            text(xtop,ytop-50,'7','Color','red','FontSize',25)
            test(i) = 7
        elseif pix > betRoot89
            text(xtop,ytop-50,'8','Color','red','FontSize',25)
            test(i) = 8
        else
            text(xtop,ytop-50,'9','Color','red','FontSize',25)
            test(i) = 9
        end
    end
catch ME
    close
    ME.message
end