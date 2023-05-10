function playChess_8
    %creates a 100x100 matrix filled with light grey colour, 0.93 for
    %intensity
    lightGrey =0.60*ones(100, 100);
    
    %creates a 100x100 matrix filled with black colour
    darkGrey = 0.40*ones(100, 100);
    
    %repmat is used for repeating alternate colours 8 times
    chessboardMatrix = repmat([darkGrey lightGrey;lightGrey, darkGrey], 4,4);
    
    % Defining the rows and columns for Chessboard
    rowLabels = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    colLabels = {'8', '7', '6', '5', '4', '3', '2', '1'};
    
    % Display the chessboard with row and column label
    fig = figure("WindowState","maximized");
    imshow(chessboardMatrix)
    
    axis on
    set(gca, 'XTick', 50:100:750)
    set(gca, 'YTick', 50:100:750)
    set(gca, 'XTickLabel', rowLabels)
    set(gca, 'YTickLabel', colLabels)
    
    %Starts the game with white
    currentPlayer = "white";
    
    %text box to display the current display
    playerText = uicontrol(fig, 'style', 'text', 'string', currentPlayer, 'position', [750 200 100 50], 'FontSize', 32, 'BackgroundColor','#D3D3D3');
    playerText.ForegroundColor = "white";
    
    %creating a fromBox input for selecting the chess piece and a fromText string
    fromText = uicontrol(fig, 'style', 'text', 'string', 'From:', 'position', [750 150 100 20]);    
    fromBox = uicontrol(fig, 'style', 'edit', 'position', [825 150 50 20]);
    
    %creating a toBox to enter coordinates the destined coordianyes and a toText string
    toText = uicontrol(fig, 'style', 'text', 'string', 'To:', 'position', [750 100 100 20]);    
    toBox = uicontrol(fig, 'style', 'edit', 'position', [825 100 50 20]);
    
    %creating a push button to callback 'move' function
    move_button = uicontrol( ...
                                fig, ...
                                "Style","pushbutton", ...
                                "Position", [825 50 50 20], ...
                                "String","Move", ...
                                "Callback",@(src,event) move(fromBox.String,toBox.String) ...
                           );
    
    %in the previous versions we created empty matrix and defined piece
    %positions below, Here we are directly putting them in the matrix
    chessBoardMatrix = ["♜", "♞", "♝", "♚", "♛", "♝", "♞", "♜";
                        "♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟";
                        "",  "",  "",  "",  "",  "",  "",  "" ;
                        "",  "",  "",  "",  "",  "",  "",  "" ;
                        "",  "",  "",  "",  "",  "",  "",  "" ;
                        "",  "",  "",  "",  "",  "",  "",  "" ;
                        "♙", "♙", "♙", "♙", "♙", "♙", "♙", "♙";
                        "♖", "♘", "♗", "♕", "♔", "♗", "♘", "♖"];
    
    %calling function refreshboard
    refreshBoard(chessBoardMatrix)
    
    %We have create a function move to decrypt the strings from fromBox and
    %toBox and move the chess piece
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
    
    %We created a function refreshboard, that displays the chess pieces in the
    %the chess board image and as we moves and refreshes the chess pieces in the empty matrix
    %we created, it also displays that on the chess board image.  
    function refreshBoard(refresh_chessBoardMatrix)
        for refresh_row = 1:8
            for refresh_col = 1:8
                piece = refresh_chessBoardMatrix(refresh_row, refresh_col);
                text(refresh_col*100-50, refresh_row*100-50 , piece , 'Color', 'black', 'FontSize', 28, 'HorizontalAlignment', 'center', 'tag', 'chessChar');
            end
        end
    end
    
    %this function 'valid_flag' has the rules of all chesspieces and checks
    %the movement of chess pieces if they are moving in the appropriate
    %position
    function valid_flag = check_valid_move(fromRank, fromFile, toRank, toFile)
        % Check if the move is valid or not and returns true or false
        from_piece = chessBoardMatrix(fromRank, fromFile);
        to_piece = chessBoardMatrix(toRank, toFile);
        %else false
        valid_flag = false;
        %We are using rank_space and file_space to validate if the piece is
        %moving to the correct position
        rank_space = toRank-fromRank;
        file_space = toFile-fromFile;
 
        % Exit if the destination position is player's piece
        if get_piece_color(from_piece) == get_piece_color(to_piece)
            return;
        end
 
        % Get Opposition color for use in rules
        opponent_color = 'black';
        if from_piece == "♜"
            opponent_color = 'white';
        end
       % we are creating senarios and rules  for every chess piece
        switch from_piece
            %rules for pawns
            case "♙"
                % Check valid moves for black pawn - 1 or 2 moved forward
                if file_space == 0 && rank_space < 0 && rank_space >= -2
                    valid_flag = true;
                end
                % Check if Pawn is killing the opponent with diagonal move 
                if get_piece_color(to_piece) == 'black' && rank_space == -1 && (file_space == 1 || file_space == -1)
                    valid_flag = true;
                end
            case "♟"
                % Check all valid moves for white pawn - 1 or 2 moved forward
                if file_space == 0 && rank_space > 0 && rank_space <= 2
                    valid_flag = true;
                end
                % Check if Pawn is killing the opponent with diagonal move 
                if get_piece_color(to_piece) == 'white' && rank_space == 1 && (file_space == 1 || file_space == -1)
                    valid_flag = true;
                end
            %Rules for Rook   
            case {"♜", "♖"}
                if rank_space ~= 0 && file_space ~= 0
                    % leave the valid flag to false
                else
                    valid_flag = true;
                    if rank_space == 0          % The rook is moving Horizontally
                        if file_space > 0       % The rook is moving to right
                            for moves = fromFile+1:toFile-1 % Check all the cells in between
                                if get_piece_color(chessBoardMatrix(fromRank, moves)) ~= ""
                                    valid_flag = false;
                                    break;
                                end
                            end
                        else    % The rook is moving to the left
                            for moves = toFile+1:fromFile-1 % Check all the cells in between
                                if get_piece_color(chessBoardMatrix(fromRank, moves)) ~= ""
                                    valid_flag = false;
                                    break;
                                end
                            end                            
                        end
                    else      % the rook is moving vertically
                        if rank_space > 0      % The rook is moving to right
                            for moves = fromRank+1:toRank-1 % Check all the cells in between
                                if get_piece_color(chessBoardMatrix(moves, fromFile)) ~= ""
                                    valid_flag = false;
                                    break;
                                end
                            end
                        else       % The rook is moving to the left
                            for moves = toRank+1:fromRank-1 % Check all the cells in between
                                if get_piece_color(chessBoardMatrix(moves, fromFile)) ~= ""
                                    valid_flag = false;
                                    break;
                                end
                            end                            
                        end
                    end
                end
             % Rules for Knights 
            case {"♞","♘"} 
                % we are using 'any' over here to choose any of the
                % rank_spaces and file_spaces defined in the vector
                if (any([2,-2] == rank_space) && any([1,-1] == file_space)) || (any([2,-2] == file_space) && any([1,-1] == rank_space))
                    valid_flag = true;
                end
             % Rules for King
            case {"♚","♔"} 
                % we are using 'any' over here to choose any of the
                % rank_spaces and file_spaces defined in the vector
                if any([1,0,-1] == rank_space) && any([1,0,-1] == file_space)
                    valid_flag = true;
                end
             % Rules for Bishop
            case{"♗", "♝"} 
                if abs(rank_space)~= abs(file_space)
                    valid_flag=false;
                else
                    valid_flag=true;
                    if rank_space>0 && file_space>0 %bishop moving diagonally up right
                        for i = 1:abs(rank_space)-1
                            if get_piece_color(chessBoardMatrix(fromRank+i,fromFile+i)) ~= ""
                                valid_flag = false;
                                break;
                            end
                        end
                    elseif rank_space > 0 && file_space < 0 %bishop moving diagonally up left
                     for i = 1:abs(rank_space)-1
                          if get_piece_color(chessBoardMatrix(fromRank+i, fromFile-i)) ~= ""
                                valid_flag = false;
                               break;
                          end
                     end
                    elseif rank_space < 0 && file_space > 0 %bishop moving diagonally down right
                        for i = 1:abs(rank_space)-1
                           if get_piece_color(chessBoardMatrix(fromRank-i, fromFile+i)) ~= ""
                                valid_flag = false;
                                break;
                          end
                        end
                    elseif rank_space<0 && file_space<0 %bishop moving diagoanally down left
                        for i=1:abs(rank_space)-1
                           if get_piece_color(chessBoardMatrix(fromRank-i, fromFile-i)) ~= ""
                                valid_flag=false;
                                break;
                            end
                        end
                    end
                end
            case{"♛", "♕"} %rules for queens
                valid_flag=true;
                if rank_space == 0          % The queen is moving horizontally
                    if file_space > 0       % The queen is moving to right
                        for moves = fromFile+1:toFile-1 % Check all the cells in between
                            if get_piece_color(chessBoardMatrix(fromRank, moves)) ~= ""
                                valid_flag = false;
                                break;
                            end
                        end
                    else
                        for moves = toFile+1:fromFile-1 % Check all the cells in between
                            if get_piece_color(chessBoardMatrix(fromRank, moves)) ~= ""
                                valid_flag = false;
                                break;
                            end
                        end                            
                    end
                else       % the queen is moving vertically
                    if rank_space > 0       % The queen is moving to left
                        for moves = fromRank+1:toRank-1 % Check all the cells in between
                            if get_piece_color(chessBoardMatrix(moves, fromFile)) ~= ""
                                valid_flag = false;
                                break;
                            end
                        end
                    else
                        for moves = toRank+1:fromRank-1 % Check all the cells in between 
                            if get_piece_color(chessBoardMatrix(moves, fromFile)) ~= ""
                                valid_flag = false;
                                break;
                            end
                        end                            
                    end
                end
    if abs(rank_space) == abs(file_space) % The queen is moving diagonally
        valid_flag = true;
    if rank_space > 0 && file_space > 0 % queen moving diagonally up and to the right
        for i = 1:abs(rank_space)-1
            if get_piece_color(chessBoardMatrix(fromRank+i, fromFile+i)) ~= ""
                valid_flag = false;
                break;
            end
        end
    elseif rank_space > 0 && file_space < 0 % queen moving diagonally up and to the left
        for i = 1:abs(rank_space)-1
            if get_piece_color(chessBoardMatrix(fromRank+i, fromFile-i)) ~= ""
                valid_flag = false;
                break;
            end
        end
    elseif rank_space < 0 && file_space > 0 % queen moving diagonally down and to the right
        for i = 1:abs(rank_space)-1
            if get_piece_color(chessBoardMatrix(fromRank-i, fromFile+i)) ~= ""
                valid_flag = false;
                break;
            end
        end
    elseif rank_space < 0 && file_space < 0 % queen moving diagonally down and to the left
        for i = 1:abs(rank_space)-1
            if get_piece_color(chessBoardMatrix(fromRank-i, fromFile-i)) ~= ""
                valid_flag = false;
                break;
            end
        end
    end

    end
            %if all rule logics are exhausted, its a incorrect move
            otherwise
            valid_flag = false;
         end
    end

end    

     