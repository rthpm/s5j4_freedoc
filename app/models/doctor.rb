class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :city
  has_many :JoinTableDoctorsSpecialties
  has_many :specialties, through: :join_table_doctors_specialties
end
