class User < ActiveRecord::Base
	devise :trackable, :omniauthable
	
	def self.find_for_twitter_auth_oauth(access_token, signed_in_resource=nil)
		data = access_token['extra']['user_hash']
		if user = User.find_by_uid(access_token['uid'].to_s)
			user
		else # Create a user with a stub password. 
			User.create!({
				:uid => access_token['uid'].to_s,
				:screen_name => data['screen_name'],
				:provider => access_token['provider'],
				:access_token => access_token['credentials']['token'],
				:access_secret => access_token['credentials']['secret']})
		end
	end
	
	def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
		data = access_token['extra']['user_hash']
		if user = User.find_by_uid(access_token['uid'].to_s)
			user
		else # Create a user with a stub password. 
			User.create!({
				:uid => access_token['uid'].to_s,
				:screen_name => data['name'],
				:provider => access_token['provider'],
				:access_token => access_token['credentials']['token'],
				:access_secret => access_token['credentials']['secret']})
		end
	end
	
	def self.find_for_mixi_oauth(access_token, signed_in_resource=nil)
		logger.debug(access_token)
		if user = User.find_by_uid(access_token['uid'].to_s)
			user
		else # Create a user with a stub password. 
			User.create!({
				:uid => access_token['uid'],
				:screen_name => access_token['user_info']['nickname'],
				:provider => access_token['provider']})
		end
	end
end
