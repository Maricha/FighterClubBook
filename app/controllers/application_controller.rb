class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def fight(first,second)
		if !first
			redirect_to root_path
		else
			@fight = Fight.new
			@fight.first_id = first
			@fight.second_id = second
			sum = 0
			sum2 = 0
			b = Book.find(first)
			exp = Fight.where(winner: first).count*3
			exp+= Fight.where(draw: first).count
			exp+= Fight.where(draw2: first).count
			sum+= exp/3
			b.skills.each do |skill|
				sum+= skill.level
			end

			b2 = Book.find(second)
			exp = Fight.where(winner: second).count*3
			exp+= Fight.where(draw: second).count
			exp+= Fight.where(draw2: second).count
			sum2+=exp/3
			b2.skills.each do |skill|
				sum2+= skill.level
			end

			@fight.attack = sum
			@fight.attack2 = sum2
			if sum==sum2
				@fight.draw = first;
				@fight.draw2 = second;
			elsif sum>sum2
				@fight.winner = first;
				@fight.lost = second;
			else
				@fight.winner = second;
				@fight.lost = first;
			end



		end

	end
end
