class Order < ApplicationRecord
  has_one :item, dependent: :nullify
  belongs_to :user, optional: true

  enum status: [:required, :completed, :canceled]

  scope :completed, -> { where(status: :completed) }
  scope :required, -> { where(status: :required) }
  # scope :cancled, -> { where.(created_at: nil) }

end
