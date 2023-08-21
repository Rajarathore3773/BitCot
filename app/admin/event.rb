ActiveAdmin.register Event do
  filter :name
  filter :description
  filter :start_date
  filter :end_date
  filter :city

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :user do |event|
      link_to event&.user&.name, admin_user_path(event&.user)
    end
    column :start_date
    column :end_date
    column :city
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :start_date
      row :end_date
      row :city
      row :user
    end
  end

  form do |f|
    f.inputs 'Event Details' do
      f.input :name
      f.input :description
      f.input :start_date
      f.input :end_date
      f.input :city
      f.input :user, collection: User.all, prompt: 'Select a user'
    end
    f.actions
  end
end
