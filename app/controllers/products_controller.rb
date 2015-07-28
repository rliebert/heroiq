class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @arranged_cards = arrange_product_cards(@products)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def arrange_product_cards(products, arranged_cards=[])
      #cols_left_in_row = 4
      #landscape_cards_stacked_in_cell = 0
      #landscape_prods = []
      #portrait_prods = []
      
      products.each do |product|
        photo = product.photos.first || product.photos.build
        width, height = FastImage.size(photo.image.path(:medium))
        if width > height # First/cover image is landscape oriented
          # Push Landscape card into arranged_cards array
          arranged_cards << {:product => product, :photo => photo, :orientation => 'landscape'}
        else # If the card is in Portrait orientation
          # Push Portrait card into arranged_cards array
          arranged_cards << {:product => product, :photo => photo, :orientation => 'portrait'}
        end
      end

      return arranged_cards
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:prod_type, :brand_name, :prod_name,
                                      photos_attributes: [:id, :image, :caption, :_destroy])
    end
end
