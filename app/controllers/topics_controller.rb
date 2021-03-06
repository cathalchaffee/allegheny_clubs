class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end  
  
  def new
  end  

  def show
    @comment = Comment.new  
    @comments = @topic.comments
    @current_user = current_user
    @clubs = @current_user.clubs
    @club = @clubs.find_by(id: @topic.club_id)
    @users = @club.users
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    @clubs = Club.all
    @topic.user_id = current_user.id
    if !params[:club_name].nil?
      @topic.club_id = @clubs.find_by(name: params[:club_name]).id
    end
    if @topic.save
      if params[:from] == "clubs_show"      
        redirect_to @topic.club
      else
        redirect_to @topic
      end
    else
      if params[:from] == "clubs_show"
        render 'clubs/show'
      else
        render 'new'
      end
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Topic was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to :back
  end  

private
  def set_topic
    @topic = Topic.find(params[:id])
  end  

  def topic_params
    params.require(:topic).permit(:text)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
