class Match
  TOWERS = [
    :ancient_top,
    :ancient_bottom,
    :bottom_tier_3,
    :bottom_tier_2,
    :bottom_tier_1,
    :middle_tier_3,
    :middle_tier_2,
    :middle_tier_1,
    :top_tier_3,
    :top_tier_2,
    :top_tier_1
  ]

  BARRACKS = [
    :bottom_ranged,
    :bottom_melee,
    :middle_ranged,
    :middle_melee,
    :top_ranged,
    :top_melee
  ]

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

  def id
    @data["match_id"]
  end

  def match_seq_num
    @data["match_seq_num"]
  end

  def radiant_tower_status
    raw_status = @data["tower_status_radiant"]
    tower_status(raw_status, :tower)
  end

  def dire_tower_status
    raw_status = @data["tower_status_dire"]
    tower_status(raw_status, :tower)
  end

  def radiant_barracks_status
    raw_status = @data["barracks_status_radiant"]
    tower_status(raw_status, :barracks)
  end

  def dire_barracks_status
    raw_status = @data["barracks_status_dire"]
    tower_status(raw_status, :barracks)
  end

  private
  def tower_status(raw_status, type)
    target = (type == :tower ? TOWERS : BARRACKS)
    binary_status = raw_status.to_s(2).rjust(target.length, '0')

    tower_status = {}
    target.each_with_index do |tower, index|
      tower_status[tower] = (binary_status[index] == '1')
    end
    tower_status
  end
end