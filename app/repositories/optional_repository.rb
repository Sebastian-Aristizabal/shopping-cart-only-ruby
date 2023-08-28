require 'yaml'
require_relative "../models/optional"

class OptionalRepository
  def initialize(file_path)
    @file_path = file_path
    @optionals = []
    load_yml if File.exist?(@file_path)
  end

  def all
    @optionals
  end

  def find(name)
    @optionals.find { |optional| optional.name == name }
  end

  def find_optional(name)
    puts "\n \n"
    puts " optionalsssssssssssssssssssssssssssss"
     p @optionals
    @optional.find { |item| item.name == name }
  end

  private

  def load_yml
    result = YAML.load(File.read(@file_path))

    result["optionals"].each do |optional_name, optional_data|
      @optionals << Optional.new(
        name: optional_name,
        price_model: optional_data["price_model"],
        price: optional_data["price"].to_i
      )
    end
    p @optionals
  end

end
