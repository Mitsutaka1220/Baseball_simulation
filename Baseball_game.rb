class Baseball_game 

	attr_reader :inning,:front_or_back,:out_count

	def initialize
		@inning = 1
		@front_or_back = 0
		@out_count = 0
	end

	def batting(attack_team , defense_team , number)  #第一、第二引数はBaseball_teamクラスのインスタンスで与えられる
		attack_team.hit_meter[number] += attack_team.batter_attack[number] 

		if attack_team.hit_meter[number] >= defense_team.total_defense
			over = attack_team.hit_meter[number] - defense_team.total_defense
			hittype = over % 4 + 1

			attack_team.hit(hittype)

			attack_team.hit_meter[number] = over
			attack_team.now_batter_number = 
					(attack_team.now_batter_number == 8 ? 0 : attack_team.now_batter_number + 1) 
		else
			@out_count += 1
			attack_team.now_batter_number = 
					(attack_team.now_batter_number == 8 ? 0 : attack_team.now_batter_number + 1) 
		end

		if @out_count == 3
			puts "------"
			puts "#{inning}回#{front_or_back == 0 ? "表" : "裏"}"  #inningを書き換える前に実行
			puts "------"

			if @front_or_back == 0
				puts "#{attack_team.point} - #{defense_team.point}"
				@front_or_back = 1
			else
				puts "#{defense_team.point} - #{attack_team.point}"  #表攻撃のチーム - 裏攻撃のチームの順で上と揃える
				@front_or_back = 0
				@inning += 1
			end

			attack_team.runner = [0,0,0,0]	
			@out_count = 0	
			print "\n"
			sleep(1)
		end
	end

	def play_game(front_attack_team,back_attack_team)  #引数はBaseball_teamクラスのインスタンスで与えられる

		puts "************************"
		puts "プレイボール！"
		puts "************************"

		while @inning <= 5
			if front_or_back == 0
				batting(front_attack_team , back_attack_team , front_attack_team.now_batter_number)			
			else
				batting(back_attack_team , front_attack_team , back_attack_team.now_batter_number)
			end
		end

		if front_attack_team.point > back_attack_team.point
			winner_message = "チームA勝利！！"
		elsif front_attack_team.point == back_attack_team.point
			winner_message = "引き分け！！"
		else
			winner_message = "チームB勝利！！"
		end

		puts "************************"
		puts "ゲームセット！"
		puts "************************"
		puts"#{winner_message}"
	end
end