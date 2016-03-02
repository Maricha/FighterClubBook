class Book < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "450x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :fname, presence: true
  validates :sname, presence: true, uniqueness: true
  validates :desc, presence: true

  has_many :fights
  has_many :rels
  has_many :skills, through: :rels

  def exp
    exp = Fight.where(winner: self.id).count*3
		exp+= Fight.where(draw: self.id).count
		exp+= Fight.where(draw2: self.id).count
		return exp
  end
end
