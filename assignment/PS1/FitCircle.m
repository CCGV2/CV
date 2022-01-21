function [x, y, R] = FitCircle(D)
% FitCircleLeastSquares Fit a circle using at least 3 points.
% Input:
%   D: An N x 2 matrix, where each row is a point in 2D space.
% Output:
%   x, y, R: (x, y) is the center of the fitted circle, R is the radius of
%   the fitted circle
    
    n = size(D, 1);

    if n < 3,
        error('You need at least three points to fit a circle.');
    end

    x = 0;
    y = 0;
    R = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                                YOUR CODE HERE:                               %
%        Find the value of the above variables as discussed in part (a).       %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    a = zeros(n, 3);
    a(:,1) = 2*D(:,1);
    a(:,2) = 2*D(:,2);
    a(:,3) = 1;
    Y = zeros(n,1);
    Y(:,1)=D(:,1).*D(:,1)+D(:,2).*D(:,2);
    c = a\Y;
    x=c(1);
    y=c(2);
    R = sqrt(c(3)+x*x+y*y);
    









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                                 END YOUR CODE                                %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end