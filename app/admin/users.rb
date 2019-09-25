ActiveAdmin.register User do

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit user: [:name, :email ,:password, :password_confirmation]
    end
  end

end
