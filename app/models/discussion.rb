class Discussion < ActiveRecord::Base
	belongs_to :user
	has_many :chats
	has_many :discussion_members
	acts_as_slugable :source_column => :title, :target_column => :slug, :slug_column => :slug
	scope :published, where("published=1") 
	scope :descending, order("#{self.table_name}.created_at DESC")
	
	def to_param
    	slug
  	end
end
