require_relative "app/repositories/product_repository"
require_relative "app/controllers/products_controller"
require_relative "router"

product_file_path = File.join(__dir__, "data/prices_exercise.yml")
product_repository = ProductRepository.new(product_file_path)

p product_repository
products_controller = ProductsController.new(product_repository)


router = Router.new(products_controller)
router.run
