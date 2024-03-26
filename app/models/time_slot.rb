class TimeSlot < ApplicationRecord
  def display_time_slot
    "#{start_time.strftime('%I:%M %p')} - #{end_time.strftime('%I:%M %p')}"
  end
end
