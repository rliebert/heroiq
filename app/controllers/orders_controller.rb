class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def sales
    @orders = Order.where(seller: current_user).order("created_at DESC")
  end

  def purchases
    @orders = Order.where(buyer: current_user).order("created_at DESC")
  end


  # GET /orders
  # GET /orders.json
  def index
    # Don't allow users to see all orders (sales and purchases pages already let them see orders involving them)
    # @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @listing = Listing.find(params[:listing_id])
    @seller = @listing.owner 

    @order.listing_id = @listing.id
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id if @seller != nil  # Just to overcome error during development
    # Remove the "if" above for production and make sure each listing has an owner

    Stripe.api_key = ENV["STRIPE_API_KEY"]
    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
        :amount => (@listing.rental_price_per_day * 100).floor,
        :currency => "usd",
        :source => token,
        :description => "Test charge"
        )
      flash[:notice] = "Thanks for ordering!"
    rescue Stripe::CardError => e
      flash[:danger] = e.message
    end

    
    #transfer = Stripe::Transfer.create(
    #  :amount => (@listing.rental_price_per_day * 95).floor,
    #  :currency => "usd",
    #  :recipient => @seller.recipient,
    #  :description => "Test transfer"
    #  )

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_url, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :state)
    end
end
