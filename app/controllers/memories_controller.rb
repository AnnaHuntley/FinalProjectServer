class MemoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :exception, unless: -> {request.format.json?}
  before_action :set_url_options
  before_action :set_memory, only: %i[ show edit update destroy ]
  #before_action :authenticate_user!


  # GET /memories or /memories.json
  def index
    @memories = Memory.all
  
    respond_to do |format|
      format.html
      format.json { render :index, status: :ok, locals: { memories: @memories.uniq } }
    end
  end
  
  

  # GET /memories/1 or /memories/1.json
  def show
  end

  # GET /memories/new
  def new
    @memory = Memory.new
  end

  # GET /memories/1/edit
  def edit
  end

  # POST /memories or /memories.json
  def create
    #@memory = current_user.memories.build(memory_params)
  
      @memory = Memory.new(memory_params)
      respond_to do |format|
        if @memory.save
          format.html { redirect_to memory_url(@memory), notice: "Memory was successfully created." }
          format.json { render :show, status: :created, location: @memory }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @memory.errors, status: :unprocessable_entity }
        end
      end
    end
    

  # PATCH/PUT /memories/1 or /memories/1.json
  def update
    puts "Params: #{params.inspect}"
    respond_to do |format|
      @memory = Memory.find(params[:id])
  
      if @memory.frozen?
        # Create a new instance to avoid modifying a frozen object
        @memory = Memory.new(memory_params)
        @memory.id = params[:id] # Set the ID to the existing ID
      end
  
      if @memory.update(memory_params)
        format.html { redirect_to memory_url(@memory), notice: "Memory was successfully updated." }
        format.json { render :show, status: :ok, location: @memory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # DELETE /memories/1 or /memories/1.json
  def destroy
    @memory.destroy

    respond_to do |format|
      format.html { redirect_to memories_url, notice: "Memory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memory
      @memory = Memory.find(params[:id])
    end

    
      def set_url_options
        ActiveStorage::Current.url_options = { host: request.base_url }
      end
      

    # Only allow a list of trusted parameters through.
    def memory_params
      #params.require(:memory).permit(:title, :description, :date, :location, :photo, :user_id)
      params.require(:memory).permit(:title, :description, :date, :location, :photo)
    end
end
