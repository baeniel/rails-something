ActiveAdmin.register Order do

  scope :all
  scope :required
  scope :completed

  action_item :update, only: :show do
    link_to "구매완료", admin_order_path(order), method: :put if order.required?
  end

  member_action :update, method: :put do
    order = Order.find params[:id]
    order.update(status: :completed)
    redirect_to admin_orders_path
  end

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
