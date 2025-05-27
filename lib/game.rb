# frozen_string_literal: true

require_relative 'human_player'
require_relative 'player'

class Game
  attr_accessor :human_player, :enemies

  def initialize(human_player_name)
    @human_player = HumanPlayer.new(human_player_name)
    @enemies = [
      Player.new(''),
      Player.new(''),
      Player.new(''),
      Player.new('')
    ]
  end
end
