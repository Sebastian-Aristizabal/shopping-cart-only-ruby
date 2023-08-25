require_relative '../models/shopping_cart'
require_relative '../views/shopping_carts_view'
require_relative '../models/product'
require_relative '../controllers/products_controller'

class ShoppingCartsController
  def initialize(shopping_cart_repository, product_repository, optional_repository)
    @product_repository = product_repository
    @optional_repository = optional_repository
    @shopping_cart_repository = shopping_cart_repository
    @products_view = ProductsView.new
    @shopping_carts_view = ShoppingCartsView.new
    @total_price = 0
  end


  def add

  end

  def list_shopping_cart
    @total_price = 0
    shopping_cart_products = @shopping_cart_repository.all
    total_shopping_cart = shopping_cart_total_price(shopping_cart_products)

    @shopping_carts_view.display_list_shopping_cart(shopping_cart_products)
    return yield if block_given?

    @shopping_carts_view.display_final_total_price(@total_price)

  end

  def cost_calculator

    # Select the product you want to buy
    product_name = @products_view.ask_user_for('product name')
    # # 7. Ask user for quantity
    product = @product_repository.find(product_name)
    # look for the product price in repository
    quantity = @products_view.ask_user_for('quantity').to_i
    # 8. Calculate total price per unit
    price = product.price
    total_price, product_tired_price = total_price_product(product, quantity)
    @products_view.display_total_price(product, quantity, price || product_tired_price, total_price)

    # 10. Add to shopping cart
    # shopping_cart_product =
    shopping_cart = ShoppingCart.new(name: product_name, quantity: quantity, unit_price: price || product_tired_price, total_price: total_price)

    # 11. Store it in repo
    @shopping_cart_repository.create(shopping_cart)
  end


  def finishing_purchase
    shopping_cart_products = @shopping_cart_repository.all
    bag = @products_view.ask_user_for('Do you want a bag with your purchase? (y/n)')

    if ["y", 'YES', 'yes', 'Yes', 'si', 'Si', 'SI'].include?(bag)

      list_shopping_cart { @shopping_carts_view.display_bug_buy; @shopping_carts_view.display_final_total_price(@total_price + 2) }
    else
      list_shopping_cart { @shopping_carts_view.display_final_total_price(@total_price) }
    end

  end

  private



  def total_price_product(product, quantity)
    # 8. Calculate total price

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

  # 9. Display final total price
  def shopping_cart_total_price(shopping_cart_products)
    shopping_cart_products.each do |product|
      @total_price += product.total_price
    end

  end
end
