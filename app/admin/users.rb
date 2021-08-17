ActiveAdmin.register User do

  index do 
    selectable_column
    id_column
    column :profile do |user|
      if user.profile.attached?
        image_tag url_for(user.profile), class: "small_image"
      end
    end
    column :name
    column :email
    column :sex
  
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :profile, :sex, :manner, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :profile, :sex, :manner, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
