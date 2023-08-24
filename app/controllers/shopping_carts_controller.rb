require_relative '../models/shopping_cart'
require_relative '../models/product'
require_relative '../views/shopping_carts_view'

class ShoppingCartsController
  def initialize(shopping_cart_repository)
    @shopping_cart_repository = shopping_cart_repository
    @shopping_carts_view = ShoppingCartsView.new
  end


  def add

  end

  def list_shopping_cart
    shopping_cart = @shopping_cart_repository.all
    p shopping_cart
    
    # @products_view.display(products)

    # product1 = 'kiwi'
    # h = { name: product1 }
    # product = Product.new(h)
    # p product.products
  end

end
