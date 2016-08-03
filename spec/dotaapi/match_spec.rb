require 'spec_helper'

describe 'Match' do
  let(:api) { Dotaapi.new }

  describe 'retrieval' do
    let(:match) { api.get_match_details(1775297917) }

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

    it 'should have dire tower status' do
      expect(match.dire_tower_status).to eq({
                                              :ancient_top => false,
                                              :ancient_bottom => false,
                                              :bottom_tier_3 => false,
                                              :bottom_tier_2 => false,
                                              :bottom_tier_1 => false,
                                              :middle_tier_3 => false,
                                              :middle_tier_2 => false,
                                              :middle_tier_1 => false,
                                              :top_tier_3 => false,
                                              :top_tier_2 => false,
                                              :top_tier_1 => false
                                            })
    end

    it 'should have dire barracks status' do
      expect(match.dire_barracks_status).to eq({
                                                  :bottom_ranged => false,
                                                  :bottom_melee => false,
                                                  :middle_ranged => false,
                                                  :middle_melee => false,
                                                  :top_ranged => false,
                                                  :top_melee => false
                                                })
    end
  end
end