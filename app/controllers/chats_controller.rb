class ChatsController < ApplicationController

  before_filter :find_discussion, only: [:discussion]

  def discussion
    @member = DiscussionMember.find_by_discussion_id_and_user_id(@discussion.id, current_user.id )
    if @member
      @chats = @discussion.chats
    end  
  end

  def show

  end

  def new
    
  end

  def create
    @chat = Chat.new(chat_params)
    @channel = params[:channel]
    user = User.find_by_email(params[:login])
    @msg = 0
    if user and user == current_user
      @chat.user_id = current_user.id
      @chat.channel_id = 1
      @chat.save
      PrivatePub.publish_to("/chats/#{params[:channel]}", "#{@chat.message}")
      @msg = 1
    end
    # respond_to do |format|
    #   format.js 
    # end
  end

  def update
  end

  def destroy
  end

  protected

  def chat_params
      params.require(:chat).permit(:user_id, :message)
  end

  def find_discussion
    @discussion = Discussion.find_by_slug(params[:id]) or raise(ActiveRecord::RecordNotFound) if params[:id]
  end

end