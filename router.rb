class Router
  def initialize(products_controller)
    @products_controller = products_controller
    @running = true
  end

  def run
    while @running
      print_menu
      choice = gets.chomp.to_i
      route_action(choice)
    end
  end

  def print_menu
    puts "-----------------------------------------------------"
    puts "----------Welcome to the Grocery Store---------------"
    puts "Please pick an option"
    puts "1. List all products"
    puts "2. Select a product"
    # puts "2. List all meals"
    # puts "2. Add a new meal"
    # puts "3. find a meal by id"
    # puts "4. Add a new customer"
    puts "5. Exit"
    print "> "
  end

  def route_action(choice)
    case choice
    when 1 then @products_controller.list
    when 2 then @products_controller.select_product
    # when 2 then @meals_controller.add
    # when 3 then @meals_controller.find_id
    # when 4 then @customers_controller.add

    when 5 then stop!
    else puts "try Again..."
    end
  end

  def stop!
    @running = false
  end
end