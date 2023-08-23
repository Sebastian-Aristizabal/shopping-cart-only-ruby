require 'yaml'
require_relative "../models/product"

class ProductRepository
  def initialize(file_path)
    @file_path = file_path
    @products = []
    load_yml if File.exist?(@file_path)
  end

  def all
    @products
  end

  def find(name)
    @products.find { |product| product.name == name }
  end

  def find_product(name)
    puts "\n \n"
    puts " productsssssssssssssssssssssssssssss"
     p @products
    @product.find { |item| item.name == name }
    # @products.find { |item| puts item; item.name == product }
  end
  def find_product(product)
    puts "\n \n"
    puts " productsssssssssssssssssssssssssssss"
     p @products
    @products.each { |item| puts item; item.name == product }
  end
  private

  def load_yml
    result = YAML.load(File.read(@file_path))
    puts "************"
    p result
    puts "/////////////////////"
    p @products
    # @products << result['products']

    # @products = result["products"].map do |item|
    #   if item["orange"]["price_model"] == "fixed"
    #     @products << Product.new(name: item["orange"]["name"], price_model: item["orange"]["price_model"], price: item["orange"]["price"].to_i)
    #   elsif item["orange"]["price_model"] == "tiered"
    #     item["orange"]["tiers"].map do |tier|
    #       @products << Product.new(name: item["orange"]["name"], price_model: item["orange"]["price_model"], price: item["orange"]["price"].to_i, from: tier["from"].to_i, to: tier["to"].to_i)
    #     end

    #   end


    result["products"].each do |product_name, product_data|
      if product_data["price_model"] == "fixed"
        @products << Product.new(name: product_name, price_model: product_data["price_model"], price: product_data["price"].to_i)
      elsif product_data["price_model"] == "tiered"
        tiers = product_data["tiers"].map do |tier|
          {
            from: tier["from"].to_i,
            to: tier["to"].to_i,
            price: tier["price"].to_i
          }
        end
        @products << Product.new(name: product_name, price_model: product_data["price_model"], tiers: tiers)
      end

    end
    p @products
    # @name = product[:name]
    # @price_model = product[:price_model]
    # @price = product[:price]
    # @from = product[:from]
    # @to = product[:to]

    # RETOMAR EL TRABAJO AQUÍ BUSCAR LA FORMA DE GENERAR BUENOS OBJETOS EN BASE AL LOS DATOS DEL YML

    # products = result["products"].map do |product_name, product_data|
    #   if product_data["price_model"] == "fixed"
    #     product = Product.new(product_name, product_data["price_model"], product_data["price"])
    #     p product

    #   elsif product_data["price_model"] == "tiered"
    #     tiers = product_data["tiers"].map do |tier_data|
    #       { from: tier_data["from"], to: tier_data["to"], price: tier_data["price"] }
    #     end
    #     Product.new(product_name, product_data["price_model"], 0, tiers)
    #   end
    # end

  end

  def save_csv
    File.open(@file_path, "w") { |file| file.write(pets.to_yaml) }
  end
end
