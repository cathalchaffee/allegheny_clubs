class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy, :about]

  # GET /clubs
  def index
    @clubs = Club.all
  end

  # GET /clubs/1
  def show
    if !logged_in?
      redirect_to root_path
    else
      @users = @club.users
      @topic = Topic.new  
      @topics = @club.topics
      @current_user = current_user
      @clubs = @current_user.clubs
    end
  end

  def about
    @current_user = current_user
    @clubs = @current_user.clubs
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end 

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  def create
    @club = Club.new(club_params)

    if @club.save
      redirect_to @club, notice: 'Club was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /clubs/1
  def update
    if @club.update(club_params)
      redirect_to @club, notice: 'Club was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clubs/1
  def destroy
    @club.destroy
    redirect_to clubs_url, notice: 'Club was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :about)
    end

    def topic_params
      params.require(:topic).permit(:text)
    end
end
