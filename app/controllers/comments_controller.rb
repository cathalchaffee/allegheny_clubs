class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end  
  
  def new
  end  

  def show
  end

  def new
    if current_user.nil? || current_user.is_admin_c?
      redirect_to root_path
    else
      @comment = Comment.new
    end
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @topics = Topic.all
    @comment.user_id = current_user.id
    if !params[:topics_id].nil?
      @comment.topic_id = @topics.find_by(id: params[:topics_id]).id
    end
    if @comment.save
      if params[:from] == "topics_show"      
        redirect_to @comment.topic
      else
        redirect_to @comment
      end
    else
      if params[:from] == "topics_show"
        render 'topics/show'
      else
        render 'new'
      end
    end
  end

  def update
    if @comment.update(topic_params)
      redirect_to @comment.topic, notice: 'Comments was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end  

private
  def set_comment
    @comment = Comment.find(params[:id])
  end  

  def comment_params
    params.require(:comment).permit(:text)
  end
end
