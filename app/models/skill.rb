class Skill < ActiveRecord::Base
  has_many :rels
  has_many :books, through: :rels
  validates :name, presence: true, uniqueness: true
	validates :level , numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
