class MemoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :set_memory, only: %i[show edit update destroy]

  # GET /memories or /memories.json
  def index
    @memories = Memory.all

    respond_to do |format|
      format.json do
        render json: @memories.map { |memory| memory_as_json(memory) }
      end
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

  def create
    @memory = Memory.new(memory_params)
    handle_file_upload(params[:memory][:photo])

    respond_to do |format|
      if @memory.save
        format.turbo_stream { redirect_to memories_url }
        format.json { render json: @memory, status: :created, location: @memory }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@memory, partial: "form", locals: { memory: @memory }) }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @memory.update(memory_params)
        format.html { redirect_to memory_url(@memory), notice: "Memory was successfully updated." }
        format.json { render :show, status: :ok, location: @memory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  

  def destroy
    @memory.destroy

    respond_to do |format|
      format.html { redirect_to memories_url, notice: "Memory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_memory
    @memory = Memory.find(params[:id])
  end

  def memory_params
    params.require(:memory).permit(:title, :description, :date, :location, :photo)
  end

  def handle_file_upload(file)
    return unless file.present?

    save_file(file)
    @memory.photo = file.original_filename
  end

  def save_file(file)
    return unless file.present?

    FileUtils.mkdir_p('public/uploads') unless File.directory?('public/uploads')
    File.open(Rails.root.join('public/uploads', file.original_filename), 'wb') do |f|
      f.write(file.read)
    end
  rescue StandardError => e
    Rails.logger.error("Error saving file: #{e.message}")
  end

  def memory_as_json(memory)
    {
      id: memory.id,
      title: memory.title,
      description: memory.description,
      date: memory.date,
      location: memory.location,
      user_id: memory.user_id,
      created_at: memory.created_at,
      updated_at: memory.updated_at,
      url: memory_url(memory, format: :json),
      photo_url: if memory.photo.present?
                   url_for(File.join('uploads', memory.photo))
                 else
                   nil
                 end
    }
  end
  
end
