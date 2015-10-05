class Bug < ActiveRecord::Base 
	belongs_to :project
	belongs_to :user, 		:foreign_key => "creator_id", :class_name => "User"
	belongs_to :creator, 	:foreign_key => "creator_id", :class_name => "User"
	belongs_to :developer,  :foreign_key => "developer_id", :class_name => "User"
	enum _type: {feature: 0, bug: 1}
	enum status: { new_bug: 0, started: 1, completed: 2}
	mount_uploader :image, ImageUploader, :mount_on => :image
end
