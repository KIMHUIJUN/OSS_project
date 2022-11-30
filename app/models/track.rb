class Track < ApplicationRecord
  belongs_to :album
  has_one :video
end
