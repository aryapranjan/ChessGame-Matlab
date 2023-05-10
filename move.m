%this function moves the the chess piece by decrypting strings inputted by
%the user in the matrix, such as b1: row-2 and column-1 and moves the piece
%by deleting the chess piece from the previous position

function move(fromBoxString, toBoxString)
       
        %decrpyting the string
        fromCol = find([rowLabels{:}] == fromBoxString(1:1));
        fromRow = 9 - str2num(fromBoxString(2:2));
        toCol = find([rowLabels{:}] == toBoxString(1:1));
        toRow = 9 - str2num(toBoxString(2:2));
        %this stores the chess piece which has been inputted from fromRow and
        %fromCol
        chessChar = chessBoardMatrix(fromRow, fromCol);
 
        %if the selected position is empty, display msgbox illegal move
        if chessChar == ""
            msgbox(append("Illegal Move: No pawn selected to move"))
            return
        end

        %To get the colour of the selected chess piece by
        %'get_piece_colour' function
        if get_piece_color(chessChar) == playerText.String
            % do nothing
        else
            %this checks if the correct player(colour) is playing at the
            %moment
            msgbox(append("Illegal Move: ", playerText.String, " to play !!"))
            return
        end
        %calling the function 'check_valid_move' to check the validity of the
        %users move
        if check_valid_move(fromRow, fromCol, toRow, toCol)
            
        else
            %if not valid, display illegal move
            msgbox(append("Illegal Move !!"))
            return
        end
        
        %if chessChar is an empty position
        if chessChar == ""
            
        else
            %move the chess piece 
            chessBoardMatrix(fromRow,fromCol) = "";
            chessBoardMatrix(toRow, toCol) = chessChar;
        end
        %deleting the previous position after moving the piece
        deletePrev = findobj('tag', 'chessChar');
        delete(deletePrev);

        %calling the function 'refreshboard
        refreshBoard(chessBoardMatrix);
        
        %intializing the first player is white
        if currentPlayer == "black"
           currentPlayer = "white";
        else
            %else black
            currentPlayer = "black";
        end
        %foreground colour in the gui according to the current player
        %playing
        playerText.ForegroundColor = currentPlayer;
        playerText.String = currentPlayer;
    end