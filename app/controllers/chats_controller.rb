class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :chat_setup, action: :new

  def new
  end

  def index
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.sender = current_user
    if @chat.save
      redirect_to chats_path, notice: 'Your message has been sent successfully'
    else
      flash[:error] = 'Your message could not be sent'
      render :new
    end
  end

  def chat_setup
    @chat = Chat.new
    @other_users = User.where.not(id: current_user)
  end

  private
  def chat_params
    params.require(:chat).permit(:receiver_id, :message)
  end
end
