class Micropost < ActiveRecord::Base
	attr_accessible :content

	belongs_to :user
	
	validates_presence_of :content, :user_id
	validates_length_of :content, :maximum => 140

	default_scope :order => 'created_at DESC'

	# Return microposts from the users being followed by the given user.
	named_scope :from_users_followed_by, lambda { |user| followed_by(user) }

	private

		def self.followed_by(user)
			followed_ids = %(SELECT followed_id FROM relationships 	WHERE follower_id = :user_id)
			{ :conditions => ["user_id IN (#{followed_ids} OR user_id = :user_id)",{ :user_id => user }]}
		end
end

# == Schema Information
#
# Table name: microposts
#
#  id         :integer(4)      not null, primary key
#  content    :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

