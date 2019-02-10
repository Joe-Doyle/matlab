try
    %first try at edge detection to learn more and figure out if it
    %might be useable in automating the process
    RGB = imread('testPicOfKey.jpg');
    %imshow(RGB)
    I = rgb2gray(RGB);
    %figure, imshow(I), title('original image');
    [~, threshold] = edge(I, 'canny');
    fudgeFactor = .5;
    BWs = edge(I,'canny', threshold * fudgeFactor);
    %figure, imshow(BWs), title('binary gradient mask');
    se90 = strel('line', 3, 90);
    se0 = strel('line', 3, 0);
    BWsdil = imdilate(BWs, [se90 se0]);
    %figure, imshow(BWsdil), title('dilated gradient mask');
    BWdfill = imfill(BWsdil, 'holes');
    figure, imshow(BWdfill);
    title('binary image with filled holes');
    BWnobord = imclearborder(BWdfill, 4);
    %figure, imshow(BWnobord), title('cleared border image');
    seD = strel('diamond',1);
    BWfinal = imerode(BWnobord,seD);
    BWfinal = imerode(BWfinal,seD);
    figure, imshow(BWfinal), title('segmented image');
    
    bw2 = imcomplement(BWfinal);
    imshowpair(BWfinal,bw2,'montage')
    
    
catch ME
    %close
    ME.message
end