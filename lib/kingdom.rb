require 'cards'

class Kingdom
  attr_reader :piles_by_type
  def initialize
    @piles_by_type = {}
    province = Pile.new(ProvinceCard, 12)
    piles_by_type[:province] = province
  end

  def get_card(card_type)
    pile = piles_by_type[card_type]
    if pile.empty?
      raise GameOverException
    end
  end
end

class GameOverException < Exception

end