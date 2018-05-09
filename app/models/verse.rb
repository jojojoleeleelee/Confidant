class Verse < ActiveRecord::Base
  belongs_to :user
  belongs_to :emotion
end
