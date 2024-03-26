class MasterTimetable < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  belongs_to :day
  belongs_to :time_slot
  belongs_to :division
  has_many :timetable_entries
  accepts_nested_attributes_for :timetable_entries

  validates :day_id, :time_slot_id, :subject_id, :division_id, :teacher_id, presence: true 
  validate :unique_time_slot_for_day_and_division
  validate :teacher_availability
  
  def unique_time_slot_for_day_and_division
    existing_record = MasterTimetable.find_by(division_id: division_id, day_id: day_id, time_slot_id: time_slot_id)
    if existing_record && existing_record.id != id
      errors.add(:time_slot_id, "has already been assigned for this division and day")
    end
  end

  def teacher_availability
    return unless teacher_id && division_id && time_slot_id && day_id

    conflict = MasterTimetable.where(teacher_id: teacher_id, division_id: division_id, time_slot_id: time_slot_id, day_id: day_id).where.not(id: id).exists?

    errors.add(:base, "Teacher is already assigned to another division at the same time") if conflict
  end
end
