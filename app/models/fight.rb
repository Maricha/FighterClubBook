class Fight < ActiveRecord::Base
  belongs_to :first, class_name: 'Book'
  belongs_to :second, class_name: 'Book'
  validate :are_you_the_same

  def are_you_the_same
  	if self.first_id == self.second_id
  	errors.add(:same, "Self fighting? No.")

  	end
  end
end
