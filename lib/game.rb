require_relative 'player_prompt'
require_relative 'computer_play'

class Game
  attr_reader :a_hm_map, :b_hm_map, :c_hm_map, :d_hm_map

  def initialize(player_initial_ship_setup, computer_initial_setup)
    @player_ships = player_initial_ship_setup
    @computer_ships = computer_initial_setup
    @player_hits = 0
    @computer_hits = 0
    @a_hm_map = ["a:", " ", " ", " ", " "]
    @b_hm_map = ["b:", " ", " ", " ", " "]
    @c_hm_map = ["c:", " ", " ", " ", " "]
    @d_hm_map = ["d:", " ", " ", " ", " "]
  end


  def hit_or_miss(player_shot)
    if @computer_ships.include?(player_shot)
      @player_hits +=1
      add_hit_to_map(player_shot)
    else
      add_miss_to_map(player_shot)
    end
  end

  def add_hit_to_map(player_shot)
    c_ships_array = @computer_ships.split(" ")
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

end
