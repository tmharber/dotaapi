require 'spec_helper'

describe 'Dotaapi' do
  let(:api) { Dotaapi.new }

  describe 'match retrieval' do
    let(:match) { api.get_match_details(1818993555) }

    it 'should return a Match object' do
      expect(match).to be_a Match
    end

    it 'should show the winner' do
      expect(match.winner).to eq(:radiant)
    end

    it 'should have duration' do
      expect(match.duration). to eq(1986)
    end

    it 'should have start time' do
      expect(match.start_time).to eq(Time.at(1441568700))
    end

    it 'should have an end time' do
      expect(match.end_time).to eq(Time.at(1441568700 + 1986))
    end

    it 'should have a match id' do
      expect(match.id).to eq(1775297917)
    end
  end
end