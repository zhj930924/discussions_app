class DiscussionMember < ActiveRecord::Base
	has_many :users
	has_many :dicussions
end
