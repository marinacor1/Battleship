require_relative 'player_prompt'
require_relative 'computer_play'
require 'colorize'

class Game
  attr_reader :a_hm_map, :b_hm_map, :c_hm_map, :d_hm_map
  attr_accessor :computer_attempts, :player_attempts, :p_map

  def initialize(player_ships, computer_initial_setup, player_coordinate_map)
    @player_ships = player_ships
    @computer_ships = computer_initial_setup
    @player_hits = 0
    @computer_hits = 0
    @player_attempts = 0
    @computer_attempts = 0
    @a_hm_map = ["a:", " ", " ", " ", " "]
    @b_hm_map = ["b:", " ", " ", " ", " "]
    @c_hm_map = ["c:", " ", " ", " ", " "]
    @d_hm_map = ["d:", " ", " ", " ", " "]
    @p_map = player_coordinate_map
  end


  def hit_or_miss(player_shot)
    @player_attempts +=1
      if @computer_ships.include?(player_shot)
        @player_hits +=1
        add_hit_to_map(player_shot)
      else
        add_miss_to_map(player_shot)
      end
  end

  def add_hit_to_map(player_shot)
    puts "\n\nNice. It was a hit! This is attempt number #{@player_attempts}."
    if player_shot.start_with?("A")
      @a_hm_map.insert(player_shot[1].to_i, "H")
      @a_hm_map.delete_at(player_shot[1].to_i + 1)
    elsif player_shot.start_with?("B")
      @b_hm_map.insert(player_shot[1].to_i, "H")
      @b_hm_map.delete_at(player_shot[1].to_i + 1)
    elsif player_shot.start_with?("C")
      @c_hm_map.insert(player_shot[1].to_i, "H")
      @c_hm_map.delete_at(player_shot[1].to_i + 1)
    else
      @d_hm_map.insert(player_shot[1].to_i, "H")
      @d_hm_map.delete_at(player_shot[1].to_i + 1)
    end
    hm_array = [@a_hm_map, @b_hm_map, @c_hm_map, @d_hm_map]
  end

  def add_miss_to_map(player_shot)
    puts "\n\nOooh. It was a miss. This is attempt number #{@player_attempts}."
    if player_shot.start_with?("A")
      @a_hm_map.insert(player_shot[1].to_i, "M")
      @a_hm_map.delete_at(player_shot[1].to_i + 1)
    elsif player_shot.start_with?("B")
      @b_hm_map.insert(player_shot[1].to_i, "M")
      @b_hm_map.delete_at(player_shot[1].to_i + 1)
    elsif player_shot.start_with?("C")
      @c_hm_map.insert(player_shot[1].to_i, "M")
      @c_hm_map.delete_at(player_shot[1].to_i + 1)
    else
      @d_hm_map.insert(player_shot[1].to_i, "M")
      @d_hm_map.delete_at(player_shot[1].to_i + 1)
    end
    hm_array = [@a_hm_map, @b_hm_map, @c_hm_map, @d_hm_map]
  end

  def end_turn
    puts "Press (E)nter to end your turn."
    input = gets.chomp.upcase

    if input == "E" || input == "ENTER"
      puts "\nNow it's the computer's turn."
    else
      puts "Incorrect message. Try again."
    end
  end

  def hits_or_misses_for_player_map(computer_shot)
     @computer_attempts +=1
     if @player_ships.include?(computer_shot)
       add_hit_to_p_map(computer_shot)
     else
       add_miss_to_p_map(computer_shot)
     end
  end

  def add_hit_to_p_map(computer_shot)
    @computer_hits +=1
    puts "\n\nOh no. You were hit!".colorize(:light_red)
    puts "You were hit at position #{computer_shot}. This is guess number #{@computer_attempts}.".colorize(:yellow)
    if computer_shot.start_with?("A")
      @p_map[0][computer_shot[1].to_i].concat("*")
    elsif computer_shot.start_with?("B")
      @p_map[1][computer_shot[1].to_i].concat("*")
    elsif computer_shot.start_with?("C")
      @p_map[2][computer_shot[1].to_i].concat("*")
    else
      @p_map[3][computer_shot[1].to_i].concat("*")
    end
    @p_map
  end

  def add_miss_to_p_map(computer_shot)
    puts "Nice. I missed you!".colorize(:light_blue)
    puts "I guessed at #{computer_shot}.".colorize(:green)
    print "This is guess number #{@computer_attempts}.".colorize(:light_blue)
    @p_map
  end

  def player_total_hits
    @player_hits
  end

  def computer_total_hits
    @computer_hits
  end

end
