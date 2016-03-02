module ApplicationHelper

  def draws(id)
		draws = Fight.where(draw: id).count
		draws += Fight.where(draw2: id).count
		return draws
	end

  def exp(id)
		expo = Fight.where(winner: id).count*3
		expo+= Fight.where(draw: id).count
		expo+= Fight.where(draw2: id).count
		return expo
	end

  def losts(id)
    lost = Fight.where(lost: id).count
    return lost
  end

	def wins(id)
		wins = Fight.where(winner: id).count
		return wins
	end







	def rank(id)
		books = Book.all.sort {|a,b| a.exp <=> b.exp}.reverse
		id = id
		location = books.map(&:id).index(id)
		return location + 1
	end
end
