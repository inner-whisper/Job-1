class Order < ActiveRecord::Base
	belongs_to :installation
	belongs_to :category
	belongs_to :status
end
