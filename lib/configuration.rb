class Configuration
  OPTIONS = [:api_key]

  attr_accessor :api_key

  def initialize
    @api_key = ENV.fetch("STEAM_API_KEY")
  end
end