require './message_dialog'

class GamesController
  # MessageDialogモジュールのinclude
  include MessageDialog

  EXP_CONSTANT = 11
  GOLD_CONSTANT = 8

  def battle(**params)
    build_characters(params)

    loop do
      # 勇者の選択
      puts "選択してください 1:攻撃 2:防御"
      offense_or_defense = 0
      while offense_or_defense!=1 and offense_or_defense!=2
        input = gets
        offense_or_defense = input.to_i
        if offense_or_defense==1
          @brave.offense = @brave.potential_offense
          @brave.defense = 0
        elsif offense_or_defense==2
          @brave.offense = 0
          @brave.defense = @brave.potential_defense
        end
      end
      
       # モンスターの選択
      offense_or_defense = rand(2)+1
      if offense_or_defense==1
        @monster.offense = @monster.potential_offense
        @monster.defense = 0
      elsif offense_or_defense==2
        @monster.offense = 0
        @monster.defense = @monster.potential_defense
      end
      
      @brave.attack(@monster)
      @monster.attack(@brave)
      break if battle_end?
    end

    battle_judgment
  end

  private

    def build_characters(**params)
      @brave = params[:brave]
      @monster = params[:monster]
    end

    def battle_end?
      @brave.hp <= 0 || @monster.hp <= 0
    end

    def brave_win?
      @brave.hp > 0
    end

    def battle_judgment
      result = calculate_of_exp_and_gold

      # end_messageを呼び出す
      end_message(result)
    end

    def calculate_of_exp_and_gold
      if brave_win?
        brave_win_flag = true
        exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
        gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
      else
        brave_win_flag = false
        exp = 0
        gold = 0
      end

      {brave_win_flag: brave_win_flag, exp: exp, gold: gold}
    end
end
