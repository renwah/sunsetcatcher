class Sunset < ApplicationRecord
    has_one_attached :image # Active Storage for image uploads
end
