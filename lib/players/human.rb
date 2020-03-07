module Players
  class Human < Player

    def move(board)
      puts "Select your move:"
      gets.strip
    end

  end
end