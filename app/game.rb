class Game
  attr_accessor :cells,:dice_output,:no_of_players,:players,:hotels

  def initialize cells,dice_output,no_of_players
    @cells = cells.split ","
    @dice_output = dice_output.split ","
    @no_of_players = no_of_players
    @players = {}
    @hotels = {}
  end
  def start
    initialize_players
    player_index = 1
    @cells.each_with_index do |cell,i|
  
        @hotels[i+1] = Hotel.new (i+1) if cell == 'H'
    end
  

    @dice_output.each do |no|

      @players[player_index].dice no
      @players[player_index].go_steps(@cells, @hotels)
      puts @players[player_index].inspect
      player_index = player_index+1
      player_index = 1 if player_index > @players.count
    end
    winner = nil
    @players.each do |player|    
      puts player.inspect
    end
    #puts "winner is #{winner.name}"

  end

  private
  def initialize_players
    (1..@no_of_players).each do |i|
      @players[i] = Player.new "player_#{i}"

    end

  end




end
