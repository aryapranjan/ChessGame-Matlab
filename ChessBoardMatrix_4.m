%in this code we are creating a empty matrix for the main chess game, where
%all the functionality will occur

%creating a empty matrix
chessBoardMatrix = ["", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", ""];



%positioning black pawns in row 7 in the empty matrix
chessBoardMatrix(7,:) ="♟";

%positioning black pawns in column 1-8 in the empty matrix
for col =1:8
    chessBoardMatrix(7,col) = "♟";
end

%positioning white pawns in row 7 in the empty matrix
chessBoardMatrix(2,:) = "♙";

%positioning white pawns in column 1-8 in the empty matrix
for col=1:8
    chessBoardMatrix(2,col) = "♙";
end

%displaying the empty matrix
disp(chessBoardMatrix)











