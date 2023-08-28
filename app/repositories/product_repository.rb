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
  end

  private

  def load_yml

    result = YAML.load(File.read(@file_path))

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
  end

  def save_csv
    File.open(@file_path, "w") { |file| file.write(pets.to_yaml) }
  end
end
