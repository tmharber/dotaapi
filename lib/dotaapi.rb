class Dotaapi
  def get_match_details(id)
    response = Unirest.get("https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=[redacted]&match_id=#{id}")
    Match.new(response.body["result"])
  end
end
