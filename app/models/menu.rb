class Menu < ApplicationRecord
  belongs_to :post, optional: true
end
