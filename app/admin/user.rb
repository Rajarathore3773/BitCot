ActiveAdmin.register User do
  permit_params :name, :email, :phone_number, :role
  # actions :all, :except => [:destroy]
  
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :events do |user|
      user&.events&.count
    end
    column :phone_number  
    # column :sign_in_count
    # column :created_at
    actions
  end

  filter :name
  filter :email
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :role
      f.input :phone_number
    end
    f.actions
  end
  
  show do
    attributes_table do
      row :name
      row :email
      row :events_count do |user|
        user&.events&.count
      end

    end

    panel 'Events' do
      table_for resource.events do
        column :name do |a|
          a 
        end
        column :description
        column :start_date
        column :end_date
        column :city
      end
    end
  end
end
    