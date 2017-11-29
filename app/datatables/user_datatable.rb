class UserDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  # include AjaxDatatablesRails::Extensions::Kaminari
  # include AjaxDatatablesRails::Extensions::WillPaginate
  # include AjaxDatatablesRails::Extensions::SimplePaginator
  #
  def_delegator :@view, :link_to
  def_delegator :@view, :edit_user_path
  def_delegator :@view, :user_path
  def_delegator :@view, :button_to

  def view_columns
    @view_columns ||= {
        email: { source: "User.email", cond: :like, searchable: true, orderable: false },
        admin: { source: "User.admin", cond: :like, searchable: true, orderable: false },
    }
  end

  private

  def data
    records.map do |user|
      {
       email: user.email,
       admin: user.admin,
       edit: button_to("edit", edit_user_path(user), method: :get, class: "mdl-js-ripple-effect"),
       show: button_to("Show", user, method: :get, class: "mdl-js-ripple-effect"),
       delete: button_to("Delete", user, method: :delete, data: { confirm: 'Are you sure?' }, class: "mdl-js-ripple-effect")
      }
    end
  end

def get_raw_records
    User.all
  end

end