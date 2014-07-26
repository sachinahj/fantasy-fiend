class Player < ActiveRecord::Base 
  has_many :qb_projections

end
class Qb_projection < ActiveRecord::Base 
  belongs_to :player
end
