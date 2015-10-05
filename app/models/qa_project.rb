class QaProject < ActiveRecord::Base
	belongs_to :qa_people, class_name: "User"
	belongs_to :projects,  class_name: "Project"
end