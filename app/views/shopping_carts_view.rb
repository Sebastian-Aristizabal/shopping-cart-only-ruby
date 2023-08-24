class ShoppingCartsView

  def display_total_price(product, quantity, unit_price, total_price)
    puts "-------------------------TOTAL PRICE-----------------------------"
    puts "\n"
    puts "   Product Name       Quantity       Unit Price    Total Price  "
    puts "      #{product.name}             #{quantity}               #{unit_price}            #{total_price}$"
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
