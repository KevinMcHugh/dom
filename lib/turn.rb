class Turn

  attr_reader :player
  def initialize(player)
    @player = player
  end

  def play
    player.action
    player.buy
    player.cleanup
  end

end