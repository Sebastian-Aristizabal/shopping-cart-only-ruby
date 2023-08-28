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
    # 1. List all products
    list
    # # 2. Ask user for a name --> View
    # name = @products_view.ask_user_for('name')
    # # 3. Ask user for the price --> Viewask_user_for
    # price = @products_view.ask_user_for('price').to_i
    # # 4. Iniatilize a product --> Model
    # h = { product: product }
    # product = Product.new(h)
    # p product
    # # 5. Store ii in repo --> Repository
    # @product_repository.create(product)
    # # 6. List all products
    # list

  end

  def cost_calculator

    # Select the product you want to buy
    product_name = @products_view.ask_user_for('product name')
    # Ask user for quantity
    product = @product_repository.find(product_name)
    # Look for the product price in repository
    puts "-------------------------------"
    p product
    puts "-------------------------------"
    quantity = @products_view.ask_user_for('quantity').to_i
    # Calculate total price per unit
    price = product.price
    total_price, product_tired_price = total_price_product(product, quantity)
    @products_view.display_total_price(product, quantity, price || product_tired_price, total_price)
    # Display final total price
    final_total_price = final_total_price(total_price)

    # Add to shopping cart
    # shopping_cart_product =
    shopping_cart = ShoppingCart.new(name: product_name, quantity: quantity, unit_price: price, total_price: total_price)

    # Store it in repo
    @shopping_cart_repository.create(shopping_cart)
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
