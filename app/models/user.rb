class User < ActiveRecord::Base
  def self.checking_user(reply) #checks if user exists
    User.all.find do |user|
      user.name.downcase == reply
    end
  end
end
