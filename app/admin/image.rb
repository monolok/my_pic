ActiveAdmin.register Image do

  index do
    column :name do |img|
      link_to img.name, admin_image_path(img.id)
    end
    column :price
    column :active
  end

  show do
    h3 image.name
    h4 image.city
    div image.price
    div image.active
    div image.description1
    div image.description2
    ul do
      image.tags.each do |tag|
        li tag.name
      end
    end
  end

  form do |f|
    f.inputs do 
      f.semantic_errors # shows errors on :base
      f.input :name
      f.input :city
      f.input :price
      f.input :data, :as => :file
      f.input :description1
      f.input :description2
    end
    f.inputs do
      f.has_many :tags do |tag|
        tag.input :name
      end
    end
    f.action :submit         # adds the 'Submit' and 'Cancel' buttons
  end

  controller do
    def new
      @image = Image.new
      @image.tags.build
    end

    # POST /images
    # POST /images.json
    def create
      @image = Image.new(image_params) do |t|
          t.data = Base64.encode64(params[:image][:data].read)
          t.filename = params[:image][:data].original_filename
          t.mime_type = params[:image][:data].content_type
      end
      # @image.name = image_params['name']
      # @image.price = image_params['price']
      # @image.description1 = image_params['description1']
      # @image.description2 = image_params['description2']
      # @image.city = image_params['city']
      @image.active = true
      # @image.tags = @image.tags.build(params['tags_attributes'])

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

    def destroy
      @image = Image.find(params[:id])
      @image.tags.destroy_all
      @image.destroy
      respond_to do |format|
        format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :price, :description2, :description1, :city, tags_attributes: [:id, :name])
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #permit_params :name, :price, :description1, :description2, :city, :tags_attributes [:name, :image_id]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
