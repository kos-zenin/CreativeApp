ActiveAdmin.register User do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id,
:email,
:encrypted_password,
:nickname,
:admin,
:reset_password_token,
:reset_password_sent_at,
:remember_created_at,
:sign_in_count,
:current_sign_in_at,
:last_sign_in_at,
:current_sign_in_ip,
:last_sign_in_ip,
:confirmation_token,
:confirmed_at,
:confirmation_sent_at,
:unconfirmed_email,
:created_at,
:updated_at
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
