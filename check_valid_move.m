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
    if abs(rank_space) == abs(file_space)
      valid_flag = true;% The queen is moving diagonally
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