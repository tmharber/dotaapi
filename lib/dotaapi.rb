require "dotaapi/version"

module Dotaapi
  class Dota_Api
    def get_match_details
      response = Unirest.get('https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=2D19DDD9C1E05C6EA66E26ADE925D1D1&match_id=1818993555')
      response.body
    end
  end
end
