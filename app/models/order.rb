class Order < ActiveRecord::Base
	belongs_to :installation
	belongs_to :category
	belongs_to :status
	belongs_to :user
end
