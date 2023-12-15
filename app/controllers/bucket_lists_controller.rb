class BucketListsController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :exception, unless: -> {request.format.json?}
  before_action :set_bucket_list, only: %i[ show edit update destroy ]
  
  #before_action :authenticate_user!


  # GET /bucket_lists or /bucket_lists.json
  def index
    @bucket_lists = BucketList.all
  end

  # GET /bucket_lists/1 or /bucket_lists/1.json
  def show
  end

  # GET /bucket_lists/new
  def new
    @bucket_list = BucketList.new
  end

  # GET /bucket_lists/1/edit
  def edit
  end

  # POST /bucket_lists or /bucket_lists.json
  def create
    #@bucket_list = current_user.bucket_lists.build(bucket_list_params)
    @bucket_list = BucketList.new(bucket_list_params)

    respond_to do |format|
      if @bucket_list.save
        format.html { redirect_to bucket_list_url(@bucket_list), notice: "Bucket list was successfully created." }
        format.json { render :show, status: :created, location: @bucket_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bucket_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bucket_lists/1 or /bucket_lists/1.json
  def update
    respond_to do |format|
      if @bucket_list.update(bucket_list_params)
        format.html { redirect_to bucket_list_url(@bucket_list), notice: "Bucket list was successfully updated." }
        format.json { render :show, status: :ok, location: @bucket_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bucket_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bucket_lists/1 or /bucket_lists/1.json
  def destroy
    @bucket_list.destroy
  
    respond_to do |format|
      format.html { redirect_to bucket_lists_url, notice: "Bucket list item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucket_list
      @bucket_list = BucketList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bucket_list_params
      params.require(:bucket_list).permit(:item, :date)
    end
end
