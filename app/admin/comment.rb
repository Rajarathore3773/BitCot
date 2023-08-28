# ActiveAdmin.register ActiveAdmin::Comment, as:"User_comment" do
#   permit_params :content#,:image
#   # actions :all, :except => [:destroy]
  
#   index do
#     selectable_column
#     id_column
#     column :content
#     # column :image do |obj|
#     #   image_tag obj.image,width:100,height:80 if obj.image.attached?
#     # end
#     # column :sign_in_count
#     # column :created_at
#     actions
#   end

#   # filter :content
  
#   form do |f|
#     f.inputs do
#       #f.input :content
#       # f.input :user_id, as: :select , collection: User.pluck(:name, :id)
#       # f.input :event_id, as: :select , collection: Event.pluck(:name, :id)
#       #f.input :image,  as: :file#, input_html: { multiple: true }

      
#     end
#     f.actions
#   end
  
#   # show do
#   #   attributes_table do
#   #     row :name
#   #     row :email
#   #     row :events_count do |user|
#   #       user&.events&.count
#   #     end

#   #   end

#   #   panel 'Events' do
#   #     table_for resource.events do
#   #       column :name do |a|
#   #         a 
#   #       end
#   #       column :description
#   #       column :start_date
#   #       column :end_date
#   #       column :city
#   #     end
#   #   end
#   # end
# end
    