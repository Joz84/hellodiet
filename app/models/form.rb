class Form < ApplicationRecord
  belongs_to :checkup
  belongs_to :category
end
