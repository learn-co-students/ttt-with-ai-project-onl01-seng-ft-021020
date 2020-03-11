class Board 
  
  attr_accessor :cells
  
   def initialize 
    @cells = Array.new(9, " ")
  end 
  
  def reset! 
    @cells.clear
    @cells = Array.new(9, " ")
  end
  
  def display
    count = 0
    @cells.each do |i|
      count+=1
      if count%3==0
        print " #{i} \n-----------\n"
      else 
        print " #{i} |"
      end 
    end 
  end 
  
  def position(position)
    index = position.to_i-1
    @cells[index]
  end 
  
  def update(position, player)
    index = position.to_i - 1
    if valid_move?(position)
      @cells[index] = player.token
    end 
  end 
  
  def full?
    !@cells.include?(" ")
  end 

  def turn_count
    count=0
    @cells.each do |i|
      if i == "X" || i== "O"
        count +=1
      end 
    end 
      return count
  end 

  def taken?(position)
    !position(position).include?(" ")
  end 

  def valid_move?(position)
    index = position.to_i - 1
    return false if (index < 0 || index > 8)
    !taken?(position)
  end 

end