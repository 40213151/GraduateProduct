class MessagesController < ApplicationController

  before_action :authenticate_student!
  before_action :authenticate_farmer!
  before_action :set_conversation

  # redirect_to this action from conversation controller create action
  def index
    # check if this current_user are involved in conversation
    if current_student == @conversation.sender || current_student == @conversation.recipient
      @other = current_student == @conversation.sender ? @conversation.recipient : @conversation.sender
      @messages = @conversation.messages.order("created_at DESC")
    elsif current_farmer == @conversation.sender || current_farmer == @conversation.recipient
      @other = current_farmer == @conversation.sender ? @conversation.recipient : @conversation.sender
      @messages = @conversation.messages.order("created_at DESC")
    else
      redirect_to conversations_path, alert: "他人のメッセージにアクセスできません"
    end

  end

  def create
    @message = @conversation.messages.new(message_params)
    @messages = @conversation.messages.order("created_at DESC")

    if @message.save
      #create.js.erb　が実行される
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end