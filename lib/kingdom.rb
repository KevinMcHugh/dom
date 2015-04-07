require 'cards'

class Kingdom
  attr_reader :piles_by_type
  def initialize
    @piles_by_type = {}
    province = Pile.new(ProvinceCard, 12)
    piles_by_type[:province] = province
  end

  def give_card(player, card_type)
    pile = piles_by_type[card_type]
    card = pile.take
    player.gain_card(card)
    if pile.empty?
      raise GameOverException
    end
  end
end

class GameOverException < Exception

end