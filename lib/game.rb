class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.cells.select{ |cell| cell != " " }.length % 2 == 0 ? self.player_1 : self.player_2
  end

  def won?
    combo_test = WIN_COMBINATIONS.select do |combo|
      self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
      self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
      self.board.cells[combo[0]] != " "
    end
    combo_test.length > 0 ? combo_test.flatten : false
  end

  def draw?
    !won? && self.board.cells.select{ |cell| cell == " " }.length == 0 ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    won? ? self.board.cells[won?[0]] : nil
  end

  def turn
    move = current_player.move(self.board)
    if !self.board.valid_move?(move)
      self.turn
    else
      self.board.update(move, current_player)
    end
  end

  def play
    while !over?
      self.turn      
      self.play
    end
    puts "Congratulations #{self.winner}!" if self.won?
    puts "Cat's Game!" if self.draw?
  end

end