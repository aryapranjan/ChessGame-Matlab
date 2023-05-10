% this function defines colours of chess pieces

%defining the function 'piece_colour'
function piece_color = get_piece_color(piece)
        switch piece
            case "♙"
                piece_color = "white";
            case "♖"
                piece_color = "white";
            case "♘"
                piece_color = "white";
            case "♗"
                piece_color = "white";
            case "♕"
                piece_color = "white";
            case "♔"
                piece_color = "white";
            case "♟"
                piece_color = "black";
            case "♜"
                piece_color = "black";
            case "♞"
                piece_color = "black";
            case "♝"
                piece_color = "black";
            case "♛"
                piece_color = "black";
            case "♚"
                piece_color = "black";
            otherwise
                %else it is empty
                piece_color = "";
        end
 end
        