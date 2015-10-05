class BugsController < ApplicationController
	def index
		@bugs_of_current_user = current_user.bugs
	end

	def new
		@bug = Bug.new
		@project_id = params[:project_id]
	end

	def create
		@bug = Project.find(params[:project_id]).bugs.create
		@bug.title = params[:bug][:title]
		@bug.description = params[:bug][:description]
		@bug._type = params[:bug][:_type]
		@bug.status = params[:bug][:status]
		year = params[:bug]["deadline(1i)"]
		month = params[:bug]["deadline(2i)"]
		day = params[:bug]["deadline(3i)"]
		@bug.deadline = Date.parse("#{year}-#{month}-#{day}")
		@bug.image = params[:bug][:image]
		@bug.creator = current_user
		@bug.save
		redirect_to :controller => "projects", :action => "index"
	end

	def show
		@bug = Bug.find(params[:id])
	end

	def edit
		@bug = Bug.find(params[:id])
	end

	def update
		@bug = Bug.find(params[:id])
		@bug.title = params[:bug][:title]
		@bug.description = params[:bug][:description]
		@bug._type = params[:bug][:_type]
		@bug.status = params[:bug][:status]
		year = params[:bug]["deadline(1i)"]
		month = params[:bug]["deadline(2i)"]
		day = params[:bug]["deadline(3i)"]
		@bug.deadline = Date.parse("#{year}-#{month}-#{day}")
		@bug.image = params[:bug][:image]
		@bug.creator = current_user
		@bug.save
		redirect_to :controller => "projects", :action => "index"
	end

	def destroy
		@project = Project.find(params[:project_id])
		@bug = Bug.find(params[:id])
		@bug.destroy
		@project.bugs(true)
		redirect_to :controller => "projects", :action => "index"
	end

	private

	def bug_param
		params.require(:bug).permit(:title,:description,:_type,:status,:deadline,:image)
	end
end
