class ShoppingCartsView

  def display_list_shopping_cart(shopping_cart_products)
    puts "-------------------------SHOPPING CART-----------------------------"
    puts "\n"
    puts "   Product Name       Quantity       Unit Price    Total Price  "
    if shopping_cart_products.empty?
      puts "Your shopping cart is empty"
    else
      shopping_cart_products.each do |shopping_cart_product|
        puts "      #{shopping_cart_product.name}             #{shopping_cart_product.quantity}               #{shopping_cart_product.unit_price}            #{shopping_cart_product.total_price}$"
      end
    end

  end

  def display_tip(tip)
    puts " \n"
    puts "Tip:.............................................. + #{tip}$"
  end

  def display_discount(discount)
    puts " \n"
    puts "Discount:.......................................... - #{discount.round(2)}$"
  end

  def display_bug_buy
    puts " \n -----------------------------------------------------------------------"
    puts "      Bag:             1                 2$             2$"
  end

  def display_final_total_price(total_shopping_cart)
    puts " \n"
    puts "TOTAL:................................................#{total_shopping_cart}$"
    puts " \n \n"
  end

  def display_tip_error
    puts "Tip can be less than 10% of the total price"
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end
end
