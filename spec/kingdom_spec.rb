require 'spec_helper'

describe Kingdom do

  describe '#get_card' do
    let(:kingdom) { described_class.new }
    let(:pile)    { double('Pile') }
    subject { kingdom.get_card(card) }
    context 'when the Province pile is empty' do
      let(:card) { :province }
      it 'raises a GameOverException' do
        expect(Pile).to receive(:new).and_return(pile)
        expect(pile).to receive(:empty?).and_return(true)
        expect{subject}.to raise_exception{GameOverException}
      end
    end
  end
end
