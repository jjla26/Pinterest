class ProductsController < ApplicationController
  def index
    @product = Products.all
  end
end
