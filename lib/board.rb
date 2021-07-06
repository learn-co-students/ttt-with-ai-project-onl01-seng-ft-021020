class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(num_string)
    self.cells[num_string.to_i - 1]
  end

  def full?
    self.cells.detect{ |cell| cell == " " } ? false : true
  end

  def turn_count
    self.cells.select{ |cell| cell != " " }.length
  end

  def taken?(num_string)
    self.cells[num_string.to_i - 1] != " " ? true : false
  end

  def valid_move?(num_string)
    num_string.to_i > 0 && num_string.to_i <= self.cells.length && !taken?(num_string)
  end

  def update(num_string, player)
    self.cells[num_string.to_i - 1] = player.token  
  end

end