module Players

  class Human < Player 
    def move(board = Board.new)
      position = gets.chomp 
      position
    end 
  end 


end