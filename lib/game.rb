class Game 
  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8], 
    [0,4,8],
    [6,4,2]
    ]
    attr_accessor :board, :player_1, :player_2
    # attr_reader :player_1

    def initialize(player_1=Players::Human.new("X") , player_2= Players::Human.new("O"), board=Board.new)
      @player_1 = player_1
      @player_2 = player_2
      # binding.pry
      @board = board
      @board.display
    end 


    def current_player 
      player_x = "X"
      player_o = "O"
      if @board.turn_count%2==0
        @player_1
      else 
        @player_2
      end 
    end 

    def won?
    WIN_COMBINATIONS.each do |win|
      # binding.pry
      if @board.cells[win[0]] == "X" && @board.cells[win[1]] == "X" && @board.cells[win[2]] =="X"
        return win

      elsif @board.cells[win[0]] == "O" && @board.cells[win[1]] == "O" && @board.cells[win[2]] =="O"
        return win 
      end 
    end 
    return false 
    end 

  def draw?
    if @board.full? && !won?
      return true 
    else 
      return false 
    end 
  end 

 def over?
    if won? || draw?
      return true 
    else 
      return false
    end 
  end 

  def winner 
    if won?
      champion = won?
      @board.cells[champion[0]]
    else 
      return NIL
    end 
  end 

  def turn 
    position = self.current_player.move(@board)
      if @board.valid_move?(position)
       @board.update(position, current_player)
       @board.display
     else 
       turn
     end 
  end 

  def play
    until over? == true 
      turn
    end

    if won?
      champion = winner
      puts "Congratulations #{champion}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end 
    

end