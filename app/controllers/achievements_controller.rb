class AchievementsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  before_action :set_achievement, only: %i[ show edit update destroy ]
 # before_action :authenticate_user!


 
  def index
    @achievements = Achievement.all
  end


  def show
  end

  # GET /achievements/new
  def new
    @achievement = Achievement.new
  end

  # GET /achievements/1/edit
  def edit
  end

  # POST /achievements or /achievements.json
  def create
   # @achievement = current_user.achievements.build(achievement_params)
  
    @achievement = Achievement.new(achievement_params)
  
    respond_to do |format|
      if @achievement.save
        format.html { redirect_to achievement_url(@achievement), notice: "Achievement was successfully created." }
        format.json { render :show, status: :created, location: @achievement }
      else
        format.html do
          flash.now[:error] = "Achievement creation failed. Please check the errors below."
          render :new
        end
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /achievements/1 or /achievements/1.json
  def update
    respond_to do |format|
      if @achievement.update(achievement_params)
        format.html { redirect_to achievement_url(@achievement), notice: "Achievement was successfully updated." }
        format.json { render :show, status: :ok, location: @achievement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievements/1 or /achievements/1.json
  def destroy
    @achievement.destroy

    respond_to do |format|
      format.html { redirect_to achievements_url, notice: "Achievement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement
      @achievement = Achievement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def achievement_params
      params.require(:achievement).permit(:title, :description)
      #params.require(:achievement).permit(:title, :description, :user_id)
    end
    def set_cors_headers
      response.headers['Access-Control-Allow-Origin'] = 'http://localhost:3000' # Adjust the origin to your React app's URL
      response.headers['Access-Control-Allow-Credentials'] = 'true'
    end
end
