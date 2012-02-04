class Message < ActiveRecord::Base
	belongs_to :from_user, :class_name => "User"
	belongs_to :to_user, :class_name => "User"
	belongs_to :message
	belongs_to :review

	named_scope :read, :conditions => "read_at IS NOT NULL"
	named_scope :unread, :conditions => "read_at IS NULL"

	validates_presence_of :message
	validates_presence_of :to_user_id
	validates_presence_of :from_user_id
	validates_presence_of :review_id

	def review
		'not implimented'
	end

	def read?
		read_at.present?
	end

	def unread?
		!read?
	end

	def read!
		update_attributes(:read_at => Time.now)
	end

	def reply?
		message_id.present?
	end
end
