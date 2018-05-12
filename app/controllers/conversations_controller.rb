class ConversationsController < ApplicationController
    before_action :authenticate_student!
    before_action :authenticate_farmer!

    def index
      @students = Student.all
      @farmers = Farmer.all

      # get all conversations involving current_user
      @conversations = Conversation.involving(current_student || current_farmer)
    end

    def create
      if Conversation.between(params[:sender_id],params[:recipient_id]).present?
        # Conversationテーブルの先頭のレコードを取得する
        @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
      else
        @conversation = Conversation.create(conversation_params)
      end

      redirect_to conversation_messages_path(@conversation)
    end

    private
    def conversation_params
        params.permit(:sender_id, :recipient_id)
    end
end