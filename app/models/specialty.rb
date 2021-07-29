class Specialty < ApplicationRecord
  has_many :JoinTableDoctorsSpecialties
  has_many :doctors, through: :join_table_doctors_specialties
end
