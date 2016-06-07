class TowersOfHanoi
  
  # Towers of Hanoi: http://en.wikipedia.org/wiki/Tower_of_Hanoi
  
  attr_accessor :towers, :from, :to
  
  def initialize
    @towers = {1 => [], 2 => [], 3 => []}
    @from = 0
    @to = 0
  end
  
  def play
    num_
    until won?
      display
      move_from
      move_to
      @towers[to] << @towers[from].pop
    end
    puts "Congratulations, you've conquered the Towers of Hanoi!"
  end
  
  def display
    puts "Tower One: #{towers[1]}, Tower Two: #{towers[2]}, Tower Three: #{towers[3]}"
  end
  
  def move_from
    loop do
      puts "Move  disk from which tower?"
      @from = Integer(gets.chomp)
      return unless towers[from].empty?
      puts "Can't move  disks from an empty tower!"
    end         
  end
  
  def move_to
    loop do
      puts "Move  disk to which tower?"
      @to = Integer(gets.chomp)
      return if towers[to].empty? || (towers[from].last < towers[to].last)
      puts "Can't move  disk onto a smaller  disk"
    end
  end
  
  def num_
    puts "How many  disks to begin?"
    number = Integer(gets.chomp)
    @towers[1] = number.downto(1).to_a
  end
  
  def won?
    towers[1].empty? && (towers[2].empty? || towers[3].empty?)
  end
end


alex = TowersOfHanoi.new
alex.play
