class Rel < ActiveRecord::Base
  belongs_to :fighter
  belongs_to :skill
end
