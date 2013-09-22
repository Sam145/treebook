require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  
	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a friendship works without raising an exception" do
		assert_nothing_raised do
			UserFriendship.create user: users(:sam), friend: users(:mike)
		end	
	end


	test "that creating a friendship based on user_id and friend_id works" do
			UserFriendship.create user_id: users(:sam).id, friend_id: users(:mike).id
			assert users(:sam).friends.include?(users(:mike))
	end

end
