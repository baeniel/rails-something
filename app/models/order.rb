class Order < ApplicationRecord
  has_one :item, dependent: :nullify
  belongs_to :user, optional: true

  enum status: [:required, :completed, :canceled]

end
