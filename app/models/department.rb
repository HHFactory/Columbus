# entity of department
class Department < ActiveRecord::Base
  attr_accessor :name
  has_many :employees
end
