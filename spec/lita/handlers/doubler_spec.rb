require 'spec_helper'

describe Lita::Handlers::Doubler, lita_handler: true do
  describe 'routing' do
    it { is_expected.to route('Lita double 2') }
    it { is_expected.to route('Lita double    22') }
    it { is_expected.to route('Lita doUBlE 4') }
    it { is_expected.to_not route('Lita double asdf') }
    it { is_expected.to_not route('Lita double 1e4') }
  end

  describe 'double_number' do
    let(:n) { rand(1..100) }

    it 'returns double the input' do
      actual = subject.double_number(n)
      expected = n * 2

      expect(actual).to equal(expected)
    end
  end

  describe 'respond_with_double' do
    it 'doubles numbers when asked to' do
      send_message('Lita double 2')
      expect(replies.last).to eq("2 + 2 = 4")
    end
  end
end
