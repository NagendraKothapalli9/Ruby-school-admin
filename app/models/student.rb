class Student < ApplicationRecord
  validates :name, presence: true, format: {
     with: /\A[A-Z][A-Za-z]*(?: [A-Za-z]+)*\z/,
     message: "can contain starting letter capital and only letters and spaces"
   }
  validates :email,
  presence: true,
  format: {
    with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\z/,
    message: "must be a valid email address"
  }
  validates :age,
  presence: true,
  numericality: {
    only_integer: true,
    greater_than_or_equal_to: 18
  }
  validates :course,
  presence: true,
  format: {
  with: /\A[A-Za-z0-9]+\z/,
  message: "can contain only letters or numbers"
}
end
