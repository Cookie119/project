json.extract! master_timetable, :id, :subject_id, :teacher_id, :day_id, :time_slot_id, :division_id, :created_at, :updated_at
json.url master_timetable_url(master_timetable, format: :json)
