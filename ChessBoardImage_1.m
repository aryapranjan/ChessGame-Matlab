%this code creates a image of chessboard


%creates a 100x100 matrix filled with light grey colour, 0.93 for
%intensity
lightGrey = 0.60*ones(100, 100);

%creates a 100x100 matrix filled with dark gray colour
darkGrey = 0.40*ones(100, 100);

%repmat is used for repeating alternate colours 8 times
chessBoardImage = repmat([darkGrey lightGrey;lightGrey, darkGrey], 4,4);

% display as an image
imshow(chessBoardImage);

