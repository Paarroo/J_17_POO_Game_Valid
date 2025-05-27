# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def display_welcome_message
  puts '------------------------------------------------'
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts '------------------------------------------------'
end

# HumainPlayer
print "Quel est ton prénom ?\n> "
user_name = gets.chomp
user = HumanPlayer.new(user_name)
print "\n"

player1 = Player.new('Josiane')
player2 = Player.new('José')
enemies = [player1, player2]

# Initial state
user.show_state
enemies.each(&:show_state)

while user.life_points.positive? && (player1.life_points.positive? || player2.life_points.positive?)
  puts '--------------------------------------------------------------'
  valid_choice = false
  until valid_choice
    puts "\nQue veux-tu faire #{user_name} ?"
    puts 'a - Chercher une arme'
    puts 's - Chercher un pack de soin'
    puts '0 - Attaquer Josiane'
    puts '1 - Attaquer José'
    puts '-------'
    print '> '
    choice = gets.chomp
    puts '-------'
    case choice
    when 'a'
      user.search_weapon
      valid_choice = true
    when 's'
      user.search_health_pack
      valid_choice = true
    when '0'
      if player1.life_points.positive?
        user.attacks(player1)
        valid_choice = true
      else
        puts "Josiane est déjà morte, tu ne peux pas l'attaquer."
      end
    when '1'
      if player2.life_points.positive?
        user.attacks(player2)
        valid_choice = true
      else
        puts "Lâche, José est déjà mort, tu ne peux pas l'attaquer."
      end
    else
      puts 'Lâche, Choix invalide, essaye encore.'
    end
  end

  # HumainPlayer turn state
  user.show_state
  enemies.each(&:show_state)

  # Ennemies attacks
  puts "\nLes autres joueurs t'attaquent \n"
  enemies.each do |enemy|
    enemy.attacks(user) if enemy.life_points.positive?
    puts "\n"
  end

  # Ennemies turn state
  user.show_state
  enemies.each(&:show_state)

end

# END
puts 'La partie est finie'
if user.life_points.positive?
  puts "GG, #{user_name} You are the blade of miquella!"
else
  puts 'You died!'
end
