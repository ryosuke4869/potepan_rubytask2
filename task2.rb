
def janken_attihoi
  puts "ジャンケン..."
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"
  jankens = ["グー","チョキ","パー"]

  player = gets.to_i
  player_hand = jankens[player]
  program = rand(3)
  program_hand = jankens[program]

  if player < 3
    puts "ホイ"
  
  elsif player == 3 
    puts "戦わない"
    exit
  else
    puts "1~3の数字を入力してください"
  end

  puts "--------------------------------"
  puts "あなた:#{player_hand}を出しました"
  puts "相手：#{program_hand}を出しました"
  puts "--------------------------------"

  result = player - program
  if result == 0
    puts "あいこ"
    janken_result = "draw"
  
  elsif result == 2 || result == -1
    puts "勝利"
    janken_result = "win"

  elsif result == 1 || result == -2
    puts "敗北"
    janken_result = "lose"
  end

#あっちむいてほいの処理

  case janken_result
  when "win","lose" #ジャンケンで勝ちまたは負けの時
    puts "あっちむいて"
    puts "0(上)1(下)2(右)3(左)"
    face_direction = ["上","下","右","左"]

    player = gets.to_i
    player_direction = face_direction[player]
    program = rand(4)
    program_direction = face_direction[program]

    puts "--------------------------------"
    puts "あなた:#{player_direction}を出しました"
    puts "相手：#{program_direction}を出しました"
    puts "--------------------------------"

    if (player_direction == program_direction) && (janken_result == "win") #ジャンケンで勝ち、同じ方向に向いた時の処理
      puts ("あなたの勝ちです")
    
    elsif (player_direction == program_direction) && (janken_result == "lose") #ジャンケンで負け、同じ方向に向いた時の処理
      puts ("あなたの負けです")

    else
      return janken_attihoi
    end
  

  when "draw"  #引き分けの処理
    next_game = "draw"
    while next_game
      next_game = janken_attihoi
    end
  end

end

janken_attihoi