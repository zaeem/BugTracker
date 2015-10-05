class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :bugs, :foreign_key => "creator_id"
  has_many :developer_projects, foreign_key: "developer_id", dependent: :destroy
  has_many :projects, :foreign_key => "manager_id"
  has_many :projects, :through => :developer_projects
  has_many :qa_projects, dependent: :destroy
  has_many :projects, :through => :qa_projects

  enum _type: {manager: 0, developer: 1, qa: 2} 
end
