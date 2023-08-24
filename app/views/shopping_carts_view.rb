class ShoppingCartsView

  def display_list_shopping_cart(shopping_cart_products)
    puts "-------------------------TOTAL PRICE-----------------------------"
    puts "\n"
    puts "   Product Name       Quantity       Unit Price    Total Price  "
    if shopping_cart_products.empty?
      puts "Your shopping cart is empty"
    else
      shopping_cart_products.each do |shopping_cart_product|
        puts "      #{shopping_cart_product.name}             #{shopping_cart_product.quantity}               #{shopping_cart_product.unit_price}            #{shopping_cart_product.total_price}$"
      end
    end
    puts "TOTAL:                                                                                #{}$"
  end

  def display_final_total_price(total_price)
    puts "-------------------------FINAL TOTAL PRICE-----------------------------"
    puts "\n"
    puts "      #{total_price}$"
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end

end
