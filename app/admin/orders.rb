ActiveAdmin.register Order do

  scope :all
  scope :completed

  index do
    selectable_column
    id_column
    column :status
    column :user
    column :created_at
    actions
  end

  filter :status
  filter :user_id

  form do |f|
    f.inputs do
      f.input :status
      f.input :user
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit order: [:status]
    end
  end

end
