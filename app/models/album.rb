class Album < ApplicationRecord
    belongs_to :user, foreign_key: "dbx_user_id"
end
