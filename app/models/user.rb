class User < ActiveRecord::Base
  has_many :emotions
  has_many :verses, through: :emotions
  has_secure_password
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods

end
