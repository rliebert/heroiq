class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    if params[:product_id]
      @product = Product.find(params[:product_id])
      @listings = @product.listings
    else
      @listings = Listing.all
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    #@listing_images_array = @listing.images.split(/,\s*/)
    @listing = Listing.find(params[:id])
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    # Split on comma with or without any whitespace (i.e. remove any whitespace between elements)
    #@listing_images_array = @listing.images.split(/,\s*/)
  end

  # GET /listings/1/edit
  def edit
    #@listing_images_array = @listing.images.split(/,\s*/)
    @listing = Listing.find(params[:id])
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    #@listing_images_array = @listing.images.split(/,\s*/)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :mfr_date, :serial_no, :rental_price_per_day,
                                      :rental_price_per_wk, :security_deposit, :sale_price, :accept_offers,
                                      photos_attributes: [:id, :image, :caption, :_destroy])
    end
end
