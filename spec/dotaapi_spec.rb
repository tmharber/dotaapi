require 'spec_helper'

describe Dotaapi do
  let(:api) { Dotaapi::Dota_Api.new }

  describe 'match retrieval' do
    let(:match)  do
      api.get_match_details["result"]
    end

    it 'should show match information' do
      expect(match["human_players"]).to eq(10)
    end
  end
end