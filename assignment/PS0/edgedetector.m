% This function calls the functions below and displays their results.
% You don't need to edit it.
function edgedetector()
    img = double(rgb2gray(imread('buoys.jpg')));

    edges = DetectVerticalEdges(img);
    blurred_edges = BoxBlur(edges);
    
    figure('Name','Original Image')
    imshow(img, []);
    
    figure('Name','Edges')
    imshow(edges, []);
    
    
    figure('Name','Blurred Edges')
    imshow(blurred_edges, []);
end


% Returns a matrix containing the horizontal component of the gradient at every
% image location.
function edges = DetectVerticalEdges(img)
    % MATLAB images use matrix indices, so the order is (y,x), and the +y
    % direction is downward.
    width = size(img, 2);
    height = size(img, 1);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%% Your part (a) code here. You can accomplish part (a) with
    %%%%%%%%%% nested "for" loops, but an easier way is to use matrix 
    %%%%%%%%%% indexing to make a matrix of the "left" pixels and a matrix 
    %%%%%%%%%% of the "right" pixels, and subtract the two matrices.
    %%%%%%%%%% REMEMBER: left/right position is the SECOND index in MATLAB.
    left = zeros(height, width-1);
    right = zeros(height, width-1);
    left(1:height, 1:width-1) = img(1:height, 1:width-1);
    right(1:height, 1:width-1) = img(1:height, 2:width);
    edges = zeros(height, width-1);
    edges(:,:) = right(:,:) - left(:,:);
    s = min(edges, [], 'all');
    t = max(edges, [], 'all');
    edges(:,:) = uint8((edges(:,:) - s) / (t-s) * 255);
    
    %%%%%%%%%% End of your part (a) code.
end

% Applies a box blur to the input image and returns the result.
function blurred = BoxBlur(img)
    img = double(img);

    height = size(img, 1);
    width = size(img, 2);
    n=5; % width of the blur
    blurred = zeros(height-(n-1),width-(n-1));
    % Loop through each pixel location in the result
    for y=1:height-(n-1)
        for x=1:width-(n-1)
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%%%%%% Your part (b) code here. Calculate blurred(y,x).
            for i=1:n-1
                for j = 1:n-1
                    blurred(y,x) = blurred(y,x) + img(y+i,x+j);
                end
            end
            %%%%%%% End of part (b) code
        end
    end
    
    % Usually we'll divide at the end so that we don't make the image
    % brighter:
    blurred = blurred / n^2;    
end

