# Write your code here!
require "pry"
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players: {
        "Alan Anderson" => {
          :number => 0, :shoe => 16, :points => 22, :rebounds => 12,
          :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30, :shoe => 14, :points => 12, :rebounds => 12,
          :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11, :shoe => 17, :points => 17, :rebounds => 19,
          :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1, :shoe => 19, :points => 26, :rebounds => 11,
          :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31, :shoe => 15, :points => 19, :rebounds => 2,
          :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players: {
        "Jeff Adrien" => {
          :number => 4, :shoe => 18, :points => 10, :rebounds => 1,
          :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0, :shoe => 16, :points => 12, :rebounds => 4,
          :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2, :shoe => 14, :points => 24, :rebounds => 12,
          :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8, :shoe => 15, :points => 33, :rebounds => 3,
          :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33, :shoe => 15, :points => 6, :rebounds => 12,
          :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12
        },
      }
    }
  }
end

def home_team_name
  game_hash[:home][:team_name]
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            return game_hash[location][attribute][player][:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            return game_hash[location][attribute][player][:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        return game_hash[location][:colors]
      end
    end
  end
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_names.push(data)
      end
    end
  end
  return team_names
end

def player_numbers(team_name)
  result = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |stat, info|
            if stat == :number
              if game_hash[location][:team_name] == team_name
                result.push(info)
              end
            end
          end
        end
      end
    end
  end
  return result
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  max_shoe_size = -1
  result = -1
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |stat, info|
            if stat == :shoe && info > max_shoe_size
              max_shoe_size = info
            end
          end
          stats.each do |stat, info|
            if stat == :rebounds && game_hash[location][attribute][player][:shoe] == max_shoe_size
              result = info
            end
          end
        end
      end
    end
  end
  return result
end

def most_points_scored
  most_points_scored = -1
  most_points_player = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          player = player_name
          stats.each do |stat, info|
            if stat == :points && info > most_points_scored
              most_points_scored = info
              most_points_player = game_hash[location][attribute][player]
            end
          end
        end
      end
    end
  end
  return most_points_player
end
