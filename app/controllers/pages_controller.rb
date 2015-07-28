class PagesController < ApplicationController

  def index
  	@imagenum = Random.rand(1..16)
    @left_biased_images = [5, 6, 7, 8, 9, 10, 13, 16]
  end

  def about
  end

  def contact
  end
end
