class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy, :_show_image]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  def search
    @images = Image.search(params[:search])
    render action: :index
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @order_item = current_order.order_items.new
  end

  def _show_image
    send_data(Base64.decode64(@image.data), :type => @image.mime_type, :filename => @image.filename, :disposition => 'inline')
  end
  # GET /images/new
  # def new
  #   @image = Image.new
  # end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  # def create
  #   @image = Image.new(params['data']) do |t|
  #       t.data = Base64.encode64(params[:image][:data].read)
  #       t.filename = params[:image][:data].original_filename
  #       t.mime_type = params[:image][:data].content_type
  #   end
  #   @image.name = image_params['name']
  #   @image.price = image_params['price']
  #   @image.active = true
  #   respond_to do |format|
  #     if @image.save
  #       format.html { redirect_to @image, notice: 'Image was successfully created.' }
  #       format.json { render :show, status: :created, location: @image }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @image.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  # def destroy
  #   @image.tags.destroy_all
  #   @image.destroy
  #   respond_to do |format|
  #     format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :price)
    end
end
