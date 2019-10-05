ActiveAdmin.register Question do

  config.sort_order = 'position_asc'
  config.paginate   = false

  reorderable

  index as: :reorderable_table do
    selectable_column
    id_column
    column :title
    column :user
    column :position
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :user
      f.input :position
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit question: [:title, :user_id, :position]
    end
  end

end
