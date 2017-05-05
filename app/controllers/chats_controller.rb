class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :chat_setup, only: [:new, :edit, :create, :update]
  before_action :find_chat, only: [:edit, :update, :destroy]

  def new
    @chat = Chat.new
  end

  def index
    if current_user.admin?
      @chats = Chat.all
    else
      @chats = Chat.users_messages(current_user.id)
    end
  end

  def edit
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

  def update
    if @chat.update_attributes(chat_params)
      redirect_to chats_path, notice: 'Message updated successfully'
    else
      flash[:error] = 'Message could not be updated'
      render :edit
    end
  end

  def destroy
    if @chat.destroy
      redirect_to chats_path, notice: 'Message has been successfully deleted'
    else
      redirect_to :index, flash: { error: 'Message could not be deleted' }
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:receiver_id, :message)
  end

  def chat_setup
    @other_users = User.where.not("id = ? OR role = ?", current_user, User.roles[:admin])
  end

  def find_chat
    @chat = Chat.find(params[:id])
  end
end
