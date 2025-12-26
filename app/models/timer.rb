# ["id", "name", "timer_type_id", "created_at", "updated_at"]
class Timer < ApplicationRecord
    belongs_to :timer_type
end
