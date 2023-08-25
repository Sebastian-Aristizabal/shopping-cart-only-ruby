require_relative "app/repositories/product_repository"
require_relative "app/controllers/products_controller"

require_relative "app/repositories/optional_repository"

require_relative "app/repositories/shopping_cart_repository"
require_relative "app/controllers/shopping_carts_controller"


require_relative "router"

product_file_path = File.join(__dir__, "data/prices_exercise.yml")
product_repository = ProductRepository.new(product_file_path)

optional_file_path = File.join(__dir__, "data/prices_exercise.yml")
optional_repository = OptionalRepository.new(optional_file_path)

shopping_cart_file_path = File.join(__dir__, "data/shopping_cart.csv")
shopping_cart_repository = ShoppingCartRepository.new(shopping_cart_file_path)


products_controller = ProductsController.new(product_repository)
shopping_carts_controller = ShoppingCartsController.new(shopping_cart_repository, product_repository, optional_repository)

router = Router.new(products_controller, shopping_carts_controller)
router.run
