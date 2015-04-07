require 'spec_helper'

describe Kingdom do

  describe '#give_card' do
    let(:kingdom) { described_class.new }
    let(:pile)    { double('Pile', take: nil) }
    let(:player)  { double('Player', gain_card: nil) }
    let(:card)    { double('Card') }
    subject { kingdom.give_card(player, card) }

    before { allow(Pile).to receive(:new).and_return(pile) }

    context 'when the Province pile is emptied' do
      let(:card) { :province }
      it 'gives the player a card' do
        expect(pile).to receive(:take).and_return(card)
        expect(player).to receive(:gain_card).with(card)
        expect{subject}.to raise_exception
      end
      it 'raises a GameOverException' do
        expect(pile).to receive(:empty?).and_return(true)
        expect{subject}.to raise_exception{GameOverException}
      end
    end
  end
end
