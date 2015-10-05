class Project < ActiveRecord::Base
	has_many :bugs
	belongs_to :manager, 	:foreign_key => "manager_id", :class_name => "User" 
	has_many :developer_projects, :foreign_key => "project_id", dependent: :destroy
  	has_many :developers, :through => :developer_projects, :class_name => "User"
  	has_many :qa_projects
  	has_many :qa_people, :through => :qa_projects, :class_name => "User"
end