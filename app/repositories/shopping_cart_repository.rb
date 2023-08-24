require 'csv'
require_relative "../models/shopping_cart"

class ShoppingCartRepository
  def initialize(file_path)
    @file_path = file_path
    @shopping_cart = []
    load_csv if File.exist?(@file_path)
  end

  def create(shopping_cart_product)
    @shopping_cart << shopping_cart_product
    save_csv
  end

  def all
    @shopping_cart
  end

  private

  def load_csv
    CSV.foreach(@file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:quantity] = row[:quantity].to_i
      row[:unit_price] = row[:unit_price].to_i
      row[:total_price] = row[:total_price].to_i
      row[:final_total_price] = row[:final_total_price].to_i
      @shopping_cart << ShoppingCart.new(row)
      p @shopping_cart
    end
  end

  def save_csv
    CSV.open(@file_path, 'wb', headers: :first_row) do |csv|
      csv << ["name", "quantity", "unit_price", "total_price", "final_total_price"]
      @shopping_cart.each do |item_cart|
        csv << [item_cart.name, item_cart.quantity, item_cart.unit_price, item_cart.total_price, item_cart.final_total_price]
      end
    end
  end
end
