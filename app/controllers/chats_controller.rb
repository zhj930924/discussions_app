class ChatsController < ApplicationController

  def index
    @chat = Chat.all
  end

  def show

  end

  def new
    
  end

  def create
    @chat = Chat.new(chat_params)
    user = User.find_by_email(params[:login])
    @msg = 0
    if user and user == current_user
      @chat.user_id = current_user.id
      @chat.channel_id = 1
      @chat.save

      PrivatePub.publish_to("/chats/index", "alert('#{@chat.message}');")

      @msg = 1
    end

    respond_to do |format|
      format.js 
    end
  end

  def update
  end

  def destroy
  end

  protected

  def chat_params
      params.require(:chat).permit(:user_id, :message)
  end

end