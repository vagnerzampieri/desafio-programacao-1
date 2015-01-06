class Sale < ActiveRecord::Base
  def self.importing(path)
    file = File.open(path, 'r')

    file.each_with_index do |line, i|
      next if i == 0

      purchaser_name,
        item_description,
        item_price,
        purchase_count,
        merchant_address,
        merchant_name = line.strip.split("\t")

      create(
        purchaser_name:   purchaser_name,
        item_description: item_description,
        item_price:       item_price,
        purchase_count:   purchase_count,
        merchant_address: merchant_address,
        merchant_name:    merchant_name
      )
    end
  end
end
