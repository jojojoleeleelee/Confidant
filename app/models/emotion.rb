class Emotion < ActiveRecord::Base
  belongs_to :user
  include BibleScraper::InstanceMethods

end
