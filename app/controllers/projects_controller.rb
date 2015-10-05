class ProjectsController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		if current_user.manager?
			@projects_of_logged_in_user = current_user.projects
		end
		if current_user.developer?
			puts "----------" * 10
			developer_projects = current_user.developer_projects
			@projects_of_logged_in_user = Array.new()
			developer_projects.each do |developer_project|
				@projects_of_logged_in_user << Project.find(developer_project.project_id)
			end
		end
		if current_user.qa?
			@projects_of_logged_in_user = Project.all
		end
	end
	def new
		@project = Project.new
	end
	def create
		@project = current_user.projects.create
		@project.title = params[:project][:title]
		@project.deadline_in_months = params[:project][:deadline_in_months]
		@project.manager_id = current_user.id
		@project.save
		current_user.projects(true)
		redirect_to :action => "index"
	end
	
	def show
		@project = Project.find(params[:id]) 
	end

	def edit
		@project = Project.find(params[:id]) 
	end
	
	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_param)
			redirect_to :action => "index"
		else
			redirect_to :action => "edit"
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		current_user.projects(true)
		redirect_to :action => "index"
	end

	def AssignDeveloper
		@project_id = params[:id] 
		@project = Project.find(params[:id])
		@developers = User.where(_type: 1)
		@ids = Array.new()
		@developers.each do |d|
			if @project.developers.include? d
				@ids.push(d.id)
			end
		end
	end

	def saveDeveloper
		@project = Project.find(params[:project_id])
		@developers_ids = params[:"developers"]
		@project.developers.clear
		@project.developers(true)
		@developers_ids.each do |d|
			developer = User.find(d)
			@project.developers.push(developer)
		end
		#@developer = User.find(params[:Developers][:user_id])
		#@project.developers.push(@developer)
		redirect_to :action => "index"
	end


	private

	def project_param
		params.require(:project).permit(:title, :deadline_in_months)
	end
end
