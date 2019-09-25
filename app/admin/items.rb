ActiveAdmin.register Item do

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :price
    column :image do |object|
      image_tag object.image.url, style: "width:100px;" if object.image?
    end
    column :created_at
    actions
  end

  filter :title
  filter :description
  filter :price
  filter :user_id

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :image
      f.input :user
    end
    f.actions
  end
end
