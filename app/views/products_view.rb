class ProductsView

  def display(products)

    puts "\n"
    puts "-----------------ALL PRODUCTS---------------------"
    puts "\n"
    products.each_with_index do |product, index|
      if product.price_model == "fixed"
        puts "#{index + 1}. #{product.name.capitalize}"
        puts "          Price per unit: #{product.price}$"

      elsif product.price_model == "tiered"
        puts "#{index + 1}. #{product.name.capitalize}"
        puts "        Price:"
        product.tiers.each do |tier|
          puts "              -#{tier[:from]} to #{tier[:to]} units: #{tier[:price]}$"
        end
      end
    end
  end

  def display_total_price(product, quantity, unit_price, total_price)
    puts "-------------------------TOTAL PRICE PER PRODUCT-----------------------------"
    puts "\n"
    puts "   Product Name       Quantity       Unit Price    Total Price  "
    puts "      #{product.name}             #{quantity}               #{unit_price}            #{total_price}$"
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end
end
