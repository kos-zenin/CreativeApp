# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  nickname               :string(255)      default(""), not null
#  admin?                 :boolean          default(FALSE), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :creatives, :dependent => :destroy
  has_many :readings
  has_many :readables, through: :readings, :source => :creative


  def user_city
    geo_location = Geocoder.search(self.last_sign_in_ip).to_json
    hash_location = JSON.parse geo_location
    @latitude = hash_location[0]["data"]["latitude"]
    @longitude = hash_location[0]["data"]["longitude"]
  	[@latitude, @longitude]
  end
end
