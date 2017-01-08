# entity of user
class User < ActiveRecord::Base
  attr_accessor :name, :tel_num, :mail_address, :line_id, :prefecture, :city, :address, :address_other
end
