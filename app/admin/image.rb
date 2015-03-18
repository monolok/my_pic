ActiveAdmin.register Image do

  index do
    column :name do |img|
      link_to img.name, admin_image_path(img.id)
    end
    column :price
    column :active
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.input :name
    f.input :price
    f.input :data, :as => :file         # builds an input field for every attribute
    f.action :submit         # adds the 'Submit' and 'Cancel' buttons
  end

  controller do
    def new
      @image = Image.new
    end

    # POST /images
    # POST /images.json
    def create
      @image = Image.new(params['data']) do |t|
          t.data = Base64.encode64(params[:image][:data].read)
          t.filename = params[:image][:data].original_filename
          t.mime_type = params[:image][:data].content_type
      end
      @image.name = image_params['name']
      @image.price = image_params['price']
      @image.active = true
      respond_to do |format|
        if @image.save
          format.html { redirect_to @image, notice: 'Image was successfully created.' }
          format.json { render :show, status: :created, location: @image }
        else
          format.html { render :new }
          format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end
    end
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :price)
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
