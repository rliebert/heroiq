require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post :create, listing: { accept_offers: @listing.accept_offers, images: @listing.images, mfr_date: @listing.mfr_date, name: @listing.name, rental_price_per_day: @listing.rental_price_per_day, rental_price_per_wk: @listing.rental_price_per_wk, sale_price: @listing.sale_price, security_deposit_amt: @listing.security_deposit_amt, serial_no: @listing.serial_no }
    end

    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should show listing" do
    get :show, id: @listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listing
    assert_response :success
  end

  test "should update listing" do
    patch :update, id: @listing, listing: { accept_offers: @listing.accept_offers, images: @listing.images, mfr_date: @listing.mfr_date, name: @listing.name, rental_price_per_day: @listing.rental_price_per_day, rental_price_per_wk: @listing.rental_price_per_wk, sale_price: @listing.sale_price, security_deposit_amt: @listing.security_deposit_amt, serial_no: @listing.serial_no }
    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete :destroy, id: @listing
    end

    assert_redirected_to listings_path
  end
end
