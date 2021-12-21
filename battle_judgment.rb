if battle_result
  result = calculate_of_exp_and_gold
  puts "#{@brave.name}はたたかいに勝った"
  puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
else
  puts "#{@brave.name}はたたかいに負けた"
  puts "目の前が真っ暗になった"
end