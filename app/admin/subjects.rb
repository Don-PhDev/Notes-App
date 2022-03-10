ActiveAdmin.register Subject do
  permit_params :name, note_ids: []

  show do
    h3 "You have " + pluralize(subject.notes.count, "Note") + " for this subject"
    subject.notes.each do |note|
      div do
        h1 link_to "#{note.title}", admin_note_path(note)
        h4 "Created this note on #{note.created_at.strftime("%a %b %e at %l:%M %p")}"
      end
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
