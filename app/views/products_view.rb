class ProductsView
  # def display(products)
  #   keys = products.flat_map(&:keys)

  #   p keys

  #   puts "-----------------ALL PRODUCTS---------------------"
  #   puts "\n"



  #   keys.uniq.each_with_index do |key, index|
  #     products.each_with_index do |product|

  #       if key == "orange"
  #         puts "#{index + 1}. #{key.capitalize} - Price per unit: #{product[key]["price"]} $"
  #         puts "-------------------------------------------------"
  #       elsif key == "apple"

  #         puts "#{index + 1}. #{key.capitalize}"
  #         puts "        Price:"
  #         product[key]["tiers"].each do |tier|
  #           puts "              - #{tier["from"]} to #{tier["to"]} units: #{tier["price"]}$"
  #         end
  #       end
  #     end
  #   end
  # end

  def display(products)
    p products
    puts "-----------------ALL PRODUCTS---------------------"
    puts "\n"
    products.each_with_index do |product, index|
      puts "#{index + 1} -#{product.name} - #{product.price_model} - #{product.price}$"
    end
  end

  # def display_price_id(price)
  #   puts "id: #{price.id} #{price.name} - #{price.price}$"
  # end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end

  # def ask_user_for_index
  #   puts "Index?"
  #   print "> "
  #   return gets.chomp.to_i - 1
  # end
end
