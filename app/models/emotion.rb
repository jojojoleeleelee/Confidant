class Emotion < ActiveRecord::Base
  has_many :users
  include BibleScraper
  include Slugifiable
  extend Slugifiable

end
