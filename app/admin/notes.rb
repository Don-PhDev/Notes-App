ActiveAdmin.register Note do
  permit_params :title, :body, :subject_id

  form do |f|
    f.inputs "Note" do
      f.input :subject
      f.input :title
      f.input :body, as: :quill_editor
    end
    f.actions
  end

  show title: "Your Note" do
    h1 link_to note.title, admin_notes_path
    h4 link_to note.subject.name, admin_subject_path
    div(class: "note-body") do
      raw note.body
    end
  end

  index do
    selectable_column
    column :id
    column :subject
    column "Title" do |note|
      link_to note.title, admin_note_path(note)
    end
    column "Body" do |note|
      raw note.body.truncate_words(15)
    end
    actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body, :subject_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :subject_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
