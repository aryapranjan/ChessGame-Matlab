%in this code we are creating a empty matrix for the main chess game, where
%all the functionality will occur and the movement of the chess pieces

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


%postioning white rook
chessBoardMatrix(1,1) = "♖";
chessBoardMatrix(1,8) = "♖";

%positioning white knight
chessBoardMatrix(1,2) = "♘";
chessBoardMatrix(1,7) = "♘";

%positioning white bishop
chessBoardMatrix(1,3) = "♗";
chessBoardMatrix(1,6) = "♗";

%positioning white king and queen
chessBoardMatrix(1,4) = "♕";
chessBoardMatrix(1,5) = "♔";

%positioning black rook
chessBoardMatrix(8,1) = "♜";
chessBoardMatrix(8,8) = "♜";

%positioning black knight
chessBoardMatrix(8,2) = "♞";
chessBoardMatrix(8,7) = "♞";

%positioning black bishop
chessBoardMatrix(8,3) = "♝";
chessBoardMatrix(8,6) = "♝";

%positioning black queen and knight
chessBoardMatrix(8,5) = "♛";
chessBoardMatrix(8,4) = "♚";


%display Chessboard with pieces
disp(chessBoardMatrix)






