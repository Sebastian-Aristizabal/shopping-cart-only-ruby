class Router
  def initialize(products_controller, shopping_carts_controller)
    @products_controller = products_controller
    @shopping_carts_controller = shopping_carts_controller
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
    puts "2. Add a product to the shopping cart"
    puts "3. List shooping cart products"
    puts "4 finish purchase"
    puts "5. Exit"
    print "> "
  end

  def route_action(choice)
    case choice
    when 1 then @products_controller.list
    when 2 then @shopping_carts_controller.cost_calculator
    when 3 then @shopping_carts_controller.list_shopping_cart
    when 4 then @shopping_carts_controller.finishing_purchase
    when 5 then stop!
    else puts "try Again..."
    end
  end

  def stop!
    @running = false
  end
end
