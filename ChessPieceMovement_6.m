%in this version we are implementing the empty matrix with chess pieces and
%also moving the chess pieces and integrating the empty matrix with chess
%pieces into the chessboard which we made in ChessBoardImage_1


%Creating an empty matrix
chessBoardMatrix = ["", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", "";
                    "", "", "", "", "", "", "", ""];


%calling function 'LabelingChessBaordImage_2' to display labeled chessboard
LabelingChessBoardImage_2

%assigning pawns in total row 7
chessBoardMatrix(7,:) ="♟";

%assigning pawns in columns
for col =1:8
    chessBoardMatrix(7,col) = "♟";
end

%assigning pawns in total column 2
chessBoardMatrix(2,:) = "♙";

%assigning pawns in columns
for col=1:8
    chessBoardMatrix(2,col) = "♙";
end

%assigning white rooks in chessboard
chessBoardMatrix(1,1) = "♖";
chessBoardMatrix(1,8) = "♖";

%assigning white knights in chessboard
chessBoardMatrix(1,2) = "♘";
chessBoardMatrix(1,7) = "♘";

%assigning white bishops in the chessboard
chessBoardMatrix(1,3) = "♗";
chessBoardMatrix(1,6) = "♗";

%assigning white king and queen in the chessboard
chessBoardMatrix(1,4) = "♕";
chessBoardMatrix(1,5) = "♔";

%assigning black rooks in the chessboard
chessBoardMatrix(8,1) = "♜";
chessBoardMatrix(8,8) = "♜";

%assigning black knight in the chessboard
chessBoardMatrix(8,2) = "♞";
chessBoardMatrix(8,7) = "♞";

%assigning black bishops in the chessboard
chessBoardMatrix(8,3) = "♝";
chessBoardMatrix(8,6) = "♝";

%assigning black kings and queens in the chessboard
chessBoardMatrix(8,5) = "♛";
chessBoardMatrix(8,4) = "♚";

%requesting the user to input which pawn he wants to move by inputting its
%coordinates
fromRow = input("Enter the row number: ");
fromCol = input("Enter the column number:");

%this stores the chess piece which has been inputted from fromRow and
%fromCol
chessChar = chessBoardMatrix(fromRow, fromCol);


%Conditions for input of fromRow
while fromRow < 1 || fromRow > 8 || fromCol < 1 || fromCol > 8
    fromRow = input("invalid input");
    fromCol = input("invalid input");
end

%requesting the user to input which coordinates he wants to move to 
toRow = input("Enter the row number: ");
toCol = input("Enter the column number: ");

%conditions for toRow and toCol coordinates
while toRow < 1 || toRow > 8 || toCol < 1 || toCol > 8
    toRow = input("invalid input");
    toCol = input("invalid input");
end

%To move the pawn from one place to other 
if chessBoardMatrix(fromRow,fromCol) == chessChar 
    chessBoardMatrix(fromRow,fromCol) = "";
    chessBoardMatrix(toRow,toCol) = chessChar;
end

%display the chessboard
disp(chessBoardMatrix)

%calling function refreshBoard
refreshBoard(chessBoardMatrix)

%We created a function refreshboard, that displays the chess pieces in the
%the chess board image and as we moves and refreshes the chess pieces in the empty matrix
%we created, it also displays that on the chess board image.  
function refreshBoard(refresh_chessBoardMatrix)
    for refresh_row = 1:8
        for refresh_col = 1:8
            piece = refresh_chessBoardMatrix(refresh_row, refresh_col);
            text(refresh_col*100-50, refresh_row*100-50, piece, 'Color', 'black', 'FontSize', 28, 'HorizontalAlignment', 'center');

        end
    end
end