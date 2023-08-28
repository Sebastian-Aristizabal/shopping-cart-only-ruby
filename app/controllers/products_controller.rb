require_relative '../views/products_view'
require_relative '../models/product'


class ProductsController
  def initialize(product_repository)
    @product_repository = product_repository
    @products_view = ProductsView.new
  end

  def list
    products = @product_repository.all
    p products
    @products_view.display(products)
  end

  def add
    list
  end

  private

  def total_price_product(product, quantity)
    # Calculate total price

    if product.price_model == "fixed"
      total_price = product.price * quantity
    elsif product.price_model == "tiered"
      total_price = 0
      product.tiers.each do |tier|
        if quantity >= tier[:from] && quantity <= tier[:to]
          return tier[:price] * quantity, tier[:price]
        end
      end
    end
  end
end
