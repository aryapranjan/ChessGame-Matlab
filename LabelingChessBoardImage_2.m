%this function labels the chess board image, rows-1-8 and columns a-h  
function LabelingChessBoardImage_2

%creates a 100x100 matrix filled with light grey colour, 0.93 for
%intensity
lightGrey =0.60*ones(100, 100);

%creates a 100x100 matrix filled with dark grey colour
darkGrey = 0.40*ones(100, 100);

%repmat is used for repeating alternate colours 8 times
chessBoardImage = repmat([darkGrey lightGrey;lightGrey, darkGrey], 4,4);

% Defining the rows and columns for Chessboard
rowLabels = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
colLabels = {'8', '7', '6', '5', '4', '4', '2', '1'};

% Display the chessboard with row and column label
fig = figure("WindowState","maximized");
imshow(chessBoardImage)
axis on
set(gca,'XTick', 50:100:750)
set(gca,'YTick', 50:100:750)
set(gca,'XTickLabel', rowLabels)
set(gca,'YTickLabel',colLabels)

end

