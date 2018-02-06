class Baseball_team

	attr_reader :point
	attr_accessor :batter_attack , :total_defense , :hit_meter , :now_batter_number , :runner

	def initialize(team_info)
		@point = 0

		@batter_attack = Array.new(9) 
		@total_defense = 0

		@hit_meter = Array.new(9,0) 
		@now_batter_number = 0
		@runner = [0,0,0,0] #runner[0],[1],[2]がそれぞれ一塁、二塁、三塁のランナーの有無に値1,0で対応し、
		                    #runner[3]が本塁を表し、得点処理、打者走者の処理を行う

		team_info.each {|key,info| @batter_attack[key-1] = info[:attack]}  
		team_info.each {|key,info| @total_defense += info[:defense]}
	end

	def hit(hittype)  #hittype = 1,2,3,4がそれぞれ一塁打、二塁打、三塁打、本塁打に対応

		runner[3] = 1  #打者走者を本塁(0塁)に配置

		hittype.times do
			@runner = (0..3).collect{|i| @runner[i-1]} #全ランナーを一つ進塁 (runner[-1] = runner[3]を利用)
			if @runner[3] == 1
				@point += 1    #得点処理
				@runner[3] = 0 #本塁を踏んだランナーはベンチに帰る
			end
		end
	end
end