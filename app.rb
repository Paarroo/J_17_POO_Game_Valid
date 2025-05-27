# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('Josiane')
player2 = Player.new('José')
puts '--------------------------------------------------------------'
puts "Voici l'état de chaque joueur :"
puts '--------------------------------------------------------------'

player2.show_state
player1.show_state

while player1.life_points.positive? && player2.life_points.positive?
  puts "Passons à la phase d'attaque :"
  puts '--------------------------------------------------------------'

  player1.attacks(player2)
  player2.attacks(player1)

  puts '--------------------------------------------------------------'

  puts "Voici l'état de chaque joueur :"
  puts '--------------------------------------------------------------'

  player2.show_state
  player1.show_state
  puts '--------------------------------------------------------------'
  break if player1.life_points <= 0 || player2.life_points <= 0
end
