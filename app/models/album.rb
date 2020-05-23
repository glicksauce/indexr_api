class Album < ApplicationRecord
    self.primary_key = :image_id
    belongs_to :user, foreign_key: "dbx_user_id"
end
