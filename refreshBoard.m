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