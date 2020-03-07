class CLI

  def start
    puts "Welcome to Tic Tac Toe"
    players_choice
  end

  def players_choice
    puts "What kind of game would you like to play?"
    puts "0, 1, or 2 player(s)?"
    players = gets.strip
  
    ["0", "1", "2"].include?(players) ? first(players.to_i) : players_choice
  end

  def first
  
  end



end