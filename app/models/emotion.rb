class Emotion < ActiveRecord::Base
  has_many :users
  has_many :verses
  include BibleScraper::InstanceMethods

end
