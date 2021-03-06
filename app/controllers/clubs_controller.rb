class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :destroy, :about, :join]

  # GET /clubs
  def index
    if current_user.nil?
      redirect_to root_path
    else
      @all_clubs = Club.all
      @current_user = current_user
    end
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

  def join
    @club.users << current_user
    redirect_to @club
  end

  def about
    @current_user = current_user
    if !@current_user.nil?
      @clubs = @current_user.clubs
    end
  end

  # GET /clubs/new
  def new
    if current_user.nil? || current_user.is_admin_c?
      redirect_to root_path
    else
      @new_club = Club.new
    end
  end 

  # GET /clubs/1/edit
  def edit
    if current_user.nil? || current_user.is_admin_c?
      redirect_to root_path
    else
      @new_club = Club.find(params[:id])
    end
  end

  # POST /clubs
  def create
    @new_club = Club.new(club_params)

    if @new_club.save
      redirect_to @new_club, notice: 'Club was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /clubs/1
  def update
    if @new_club.update(club_params)
      redirect_to @new_club, notice: 'Club was successfully updated.'
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
