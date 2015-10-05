class Match
  def initialize(data)
    @data = data
  end

  def winner
    @data["radiant_win"] ? :radiant : :dire
  end

  def duration
    @data["duration"]
  end

  def start_time
    Time.at @data["start_time"]
  end

  def end_time
    Time.at(@data["start_time"] + duration)
  end

  def match_id
    @data["match_id"]
  end

end