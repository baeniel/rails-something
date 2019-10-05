class Question < ApplicationRecord
  belongs_to :user, optional: true
  acts_as_list scope: :user
end
