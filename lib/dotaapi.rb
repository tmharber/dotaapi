class Dotaapi
  def configuration
    @configuration ||= Configuration.new
  end

  def get_match_details(id)
    api_key = configuration.api_key
    response = Unirest.get("https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=#{api_key}&match_id=#{id}")
    Match.new(response.body["result"])
  end
end
