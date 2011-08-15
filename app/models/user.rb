class User < ActiveRecord::Base
  devise :trackable, :omniauthable
  
  def self.find_for_twitter_auth_oauth(access_token, signed_in_resource=nil)
      data = access_token['extra']['user_hash']

      if user = User.find_by_uid(access_token['uid'].to_i)
        user
      else # Create a user with a stub password. 
        User.create!({
          :uid => access_token['uid'].to_i,
          :screen_name => data['screen_name'],
          :service => access_token['provider'],
          :access_token => access_token['credentials']['token'],
          :access_secret => access_token['credentials']['secret']})
      end
    end
    
    def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
      data = access_token['extra']['user_hash']

      if user = User.find_by_uid(access_token['uid'].to_i)
        user
      else # Create a user with a stub password. 
        User.create!({
          :uid => access_token['uid'].to_i,
          :screen_name => data['name'],
          :service => access_token['provider'],
          :access_token => access_token['credentials']['token'],
          :access_secret => access_token['credentials']['secret']})
      end
    end
end
