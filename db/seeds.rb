require 'faker'

City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
spacer = "\n" + '░' * 80 + "\n\n"


5.times do
  cities = City.create(city_name: Faker::Address.city)
end
tp City.all
print spacer

5.times do
  Specialty.create(specialty_name: Faker::Job.field)
end
tp Specialty.all
print spacer

5.times do
  Doctor.create(first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          zip_code: Faker::Address.zip_code,
                          city_id: City.ids.sample)
end
tp Doctor.all
print spacer

Doctor.all.each do |doc|
  JoinTableDoctorsSpecialties.create(doctor: doc, specialty: Specialty.all.sample)
end


Specialty.all.each do |spec|
  JoinTableDoctorsSpecialties.create(doctor: Doctor.all.sample, specialty: spec)
end
tp JoinTableDoctorsSpecialties.all
print spacer

20.times do
  Patient.create(first_name: Faker::Name.first_name,
                            last_name: Faker::Name.last_name,
                            city_id: City.ids.sample)
end
tp Patient.all
print spacer

10.times do
  Appointment.create(date: rand(Time.now..Time.now + 1.year),
                                   city_id: City.ids.sample,
                                   doctor: Doctor.all.sample,
                                   patient: Patient.all.sample)
end
tp Appointment.all
print spacer
