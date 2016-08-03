module Entity
  class Side
    SLOT_GAP = 128

    def initialize(data, team)
      @data = data
      @team = team
    end

    def towers
      @data["tower_status_#{team}"]
    end

    def barracks
      @data["barracks_status_#{team}"]
    end

    def players
      players = @data["players"]
      get_players_for_side(players)
      players.each do |player|
        # create new players here
      end
    end

    private
    def get_players_for_side(players)
      players.each do |player|
        player["player_slot"]
        case @team
        when :radiant
          player["player_slot"] < SLOT_GAP
        when :dire
          player["player_slot"] >= SLOT_GAP
        end
      end
    end
  end
end