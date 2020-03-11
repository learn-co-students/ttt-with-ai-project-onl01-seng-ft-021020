module Players  
  class Computer < Player
    def move (board)

      position = rand(1..9)
      # binding.pry
      if board.valid_move?(position)
        position.to_s
      else 
        move(board)
      end 

    end 
  end 
end