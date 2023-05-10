%this code displays pawn (unicode) text on the chessboard

%creates a 100x100 matrix filled with light grey colour, 0.93 for
%intensity
lightGrey =0.60*ones(100, 100);

%creating a 100x100 matrix filled with black colour
black = 0.40*ones(100, 100);

%repmat is used for repeating alternate colours 8 times
chessBoardImage = repmat([black lightGrey;lightGrey, black], 4,4);

% Defining the rows and columns for Chessboard
rowLabels = {'8', '7', '6', '5', '4', '3', '2', '1'};
colLabels = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};

% Display the chessboard with row and column label
imshow(chessBoardImage)
axis on
set(gca,'XTick', 50:100:750)
set(gca,'YTick', 50:100:750)
set(gca,'XTickLabel', rowLabels)
set(gca,'YTickLabel',colLabels)

%Creating a 8x8 cell
chessChar = cell(8,8);


% for loop for positioning white pawn piece on row 2
for i = 2:2
    %loop to positioning white pawns on the column 1-8
    for j = 1:8
        pawns{i,j} = '♙';
    end
end

%displaying white pawns on the respected positions
for i = 2:2
    for j = 1:8
        text(j*100-50, i*100-50, pawns{i,j},'Color', 'black', 'FontSize', 28, 'HorizontalAlignment', 'center');
    end
end

% for loop for positioning black pawn piece on row 7
for i = 7:7
    %loop to positioning black pawns on the column 1-8
    for j = 1:8
        pawns{i,j} = '♟︎';
    end
end

%displaying white pawns on the respected positions
for i = 7:7
    for j = 1:8
        text(j*100-50, i*100-50, pawns{i,j}, 'Color', 'black', 'FontSize', 28, 'HorizontalAlignment', 'center');
    end
 end