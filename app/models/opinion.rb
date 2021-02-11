class Opinion < ApplicationRecord
  with_options presence: true do
    validates :subject
    validates :text
  end
end
