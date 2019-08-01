class ConversationsController < ApplicationController
  include MessagesReadHelper
  before_action :authenticate_user!, :load_entities

  def index; end

  def show
    redirect_to conversations_path if conversation_allowed?
    @recipient = Company.find(@conversation.recipient_id)
    @sender = Company.find(@conversation.sender_id)
    @notifications = @sender.notifications.where(company: @recipient)
    @conversation_message = Message.new conversation: @conversation
    @conversation_messages = @conversation.messages.includes(:user)
    mark_as_read(@conversation_messages, current_user.company.id)
  end

  def create
    @company = Company.find_by(id: permitted_parameters[:company])
    @conversation = search_conversation
    @notifications = @company.notifications
    @conversation.nil? ? create_conversation : redirect_to(conversation_path(@conversation))
  end

  protected

  def search_conversation
    query = 'recipient_id = ? OR sender_id = ?'
    Conversation.where(query, @company.id, @company.id).
                 where(query, current_user.company.id, current_user.company.id).first
  end

  def conversation_allowed?
    company_id = current_user.company.id
    @conversation.sender_id != company_id && @conversation.recipient_id != company_id
  end

  def create_conversation
    fill_conversation
    if @conversation.save
      redirect_to conversation_path(@conversation.id)
    end
  end

  def fill_conversation
    @conversation = Conversation.new(recipient_id: @company.id, sender_id: current_user.company.id)
  end

  def load_entities
    @conversations = Conversation.all.where(sender_id: current_user.id).
                     or(Conversation.all.where(recipient_id: current_user.id))
    @conversation = Conversation.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.permit(:company)
  end
end
