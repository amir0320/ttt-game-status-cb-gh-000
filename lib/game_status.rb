# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [2, 4, 6],
        [0, 4, 8]
]

def won?(board)
        if board.all?{|position| position == " "}
                return false
        else
                WIN_COMBINATIONS.each do |win_combination|
                        first_index = win_combination[0]
                        if position_taken?(board, first_index) && win_combination.all?{|win_index| board[win_index] == board[first_index]}
                                return win_combination
                        end
                end
                return false
        end
end

def full?(board)
        return board.all? {|index| index != " "}
end

def draw?(board)
        return !won?(board) && full?(board)
end

def over?(board)
        return won?(board) || draw?(board) || full?(board)
end

def winner(board)
        win_comb = won?(board)
        if win_comb
                return board[win_comb[0]]
        else
                return nil
        end
end
