# entity of employee
class Employee < ActiveRecord::Base
  attr_accessor :name,:tel_num
  belongs_to :department
end
