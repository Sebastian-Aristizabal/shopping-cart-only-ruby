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
    # product1 = 'kiwi'
    # h = { name: product1 }
    # product = Product.new(h)
    # p product.products
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

  def select_product

    # Select the product you want to buy
    product = @products_view.ask_user_for('product')
    # # 7. Ask user for quantity

    # look for the product price in repository
    price = @product_repository.find_product(product)

    puts "-------------------------------"
    p price
    puts "-------------------------------"

    puts " \n \n \n"

    h = { products: product, price: price }
    product = Product.new(h)
    p product
    quantity = @products_view.ask_user_for('quantity').to_i
    total_price(product, quantity)
  end

  private

  def total_price(product, quantity)
    p product.price
    # 8. Calculate total price
    total_price = product.price * quantity
    # 9. Display total price

  end


  # def find_id
  #   list
  #   id = @products_view.ask_user_for('id').to_i
  #   product = @product_repository.find(id)
  #   @products_view.display_product_id(product)
  # end
end
