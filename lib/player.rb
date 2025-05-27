# frozen_string_literal: true

require 'English'
class Player
  attr_accessor :life_points, :name

  @@life_points = 10

  def initialize(name)
    @life_points = @@life_points
    @name = name
  end

  def show_state
    if @life_points > 1
      puts "#{@name} a #{@life_points} points de vie"
    elsif @life_points == 1
      puts "Ça sent le sapin pour #{@name}, (#{@life_points} point de vie!!)"
    else
      puts "#{@name} s'est fait lavé par un enfant de 10 ans.."
    end
  end

  def gets_damage(damage)
    @life_points -= damage
  end

  def attacks(player_x)
    puts "#{@name} attaque #{player_x.name}"
    damage = compute_damage

    puts "#{player_x.name} a subi #{damage} points de dommages"
    player_x.gets_damage(damage)
  end

  def compute_damage
    rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @life_points = 100
    @weapon_level = 1
    @name = name
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"

    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends.\n"
    else
      puts "M@*#{$INPUT_LINE_NUMBER}.. elle n'est pas mieux que ton arme actuelle...\n"
    end
  end

  def search_health_pack
    dice_roll = rand(1..6)

    case dice_roll
    when 1
      puts "Tu n'as rien trouvé..."
    when 2..5
      @life_points = [@life_points + 50, 100].min
      puts 'Bravo, tu as trouvé un pack de +50 points de vie !'
    when 6
      @life_points = [@life_points + 80, 100].min
      puts 'Waow, tu as trouvé un pack de +80 points de vie !'
    end
  end
end
