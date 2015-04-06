require 'spec_helper.rb'

describe Turn do

  let(:player) { double('player') }
  subject { described_class.new(player).play }
  describe '#play' do
    it 'runs the phases in order' do
      expect(player).to receive(:action).ordered
      expect(player).to receive(:buy).ordered
      expect(player).to receive(:cleanup).ordered
      subject
    end
  end
end