class UserDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :link_to
  def_delegator :@view, :edit_user_path
  def_delegator :@view, :user_path
  def_delegator :@view, :button_to

  def view_columns
    @view_columns ||= {
        email: { source: "User.email", cond: :like, searchable: true, orderable: true },
        admin: { source: "User.admin", cond: :like, searchable: true, orderable: true },
    }
  end

  private

  def data
    records.map do |user|
      {
       email: user.email,
       admin: user.admin,
       actions: link_to("edit", edit_user_path(user)) + ' ' +
                link_to("Delete", user, method: :delete, data: { confirm: 'Are you sure?' })
      }
    end
  end

  def get_raw_records
    User.all
  end
end