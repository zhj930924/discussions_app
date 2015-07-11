class DiscussionsController < ApplicationController

before_filter :find_discussion

  def index
  	@discussions = Discussion.all
  end

  def new
  	@discussion = Discussion.new
  end

  def edit

  end

  def create
  	@discussion = Discussion.new(discussion_params)
  	@discussion.user_id = current_user.id
  	if @discussion.save
  		@discussion_member = DiscussionMember.new
		@discussion_member.user_id = current_user.id
		@discussion_member.discussion_id = @discussion.id
		@discussion_member.save
  		flash[:notice] = "Discussion created successfully"
  		redirect_to discussion_on_path(id: @discussion.slug )
  	end
  end

  def update

  end

  def join_discussion
  	if @discussion.secret_key == params[:discussion][:secret_key]
  		@discussion_member = DiscussionMember.find_by_discussion_id_and_user_id(@discussion.id, current_user.id)
  		if @discussion_member
  			flash[:notice]="You have already joined the discussion."
  			redirect_to discussion_on_path(@discussion)
  		else
  			@discussion_member = DiscussionMember.new
  			@discussion_member.user_id = current_user.id
  			@discussion_member.discussion_id = @discussion.id
  			@discussion_member.save
  			flash[:notice]="You have joined the discussion successfully."
  			redirect_to discussion_on_path(@discussion)
  		end
  	else
  		flash[:error]="You have entered a wrong key."
  		redirect_to discussion_on_path(@discussion)	
  	end
  end

  def destroy
  	if current_user.id == @discussion.user_id or current_user.email = "sahilprjpt206@gmail.com"
  		@discussion.destroy
  		flash[:notice] = "Discussion has been successfully removed."
  		redirect_to discussions_path
  	else
  		flash[:error] = "Access Denied"
  		redirect_to discussions_path	
  	end
  end

  def show
  	@chats = @discussion.chats if @discussion
  end

  protected 

  def discussion_params
      params.require(:discussion).permit(:secret_key, :title, :description)
  end

  def find_discussion
  	@discussion = Discussion.find_by_slug(params[:id]) or raise(ActiveRecord::RecordNotFound) if params[:id]
  end
end
