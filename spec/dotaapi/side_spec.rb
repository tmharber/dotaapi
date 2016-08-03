require 'spec_helper'

describe 'Side' do
  let(:api) { Dotaapi.new }
  let(:match) { api.get_match_details(1775297917) }

  describe 'radiant' do
    let (:radiant) { match.radiant }

    it 'should have tower status' do
      expect(radiant.towers).to eq({
                                                   :ancient_top => true,
                                                   :ancient_bottom => true,
                                                   :bottom_tier_3 => true,
                                                   :bottom_tier_2 => true,
                                                   :bottom_tier_1 => true,
                                                   :middle_tier_3 => true,
                                                   :middle_tier_2 => true,
                                                   :middle_tier_1 => false,
                                                   :top_tier_3 => true,
                                                   :top_tier_2 => true,
                                                   :top_tier_1 => true
                                               })
    end

    it 'should have barracks status' do
      expect(radiant.barracks).to eq({
                                                      :bottom_ranged => true,
                                                      :bottom_melee => true,
                                                      :middle_ranged => true,
                                                      :middle_melee => true,
                                                      :top_ranged => true,
                                                      :top_melee => true
                                                  })
    end
  end
end