# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'app_2'

def display_welcome_message
  puts '------------------------------------------------'
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts '------------------------------------------------'
end
