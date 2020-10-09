# frozen_string_literal: true

##
class UserDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :link_to
  def_delegator :@view, :edit_user_path
  def_delegator :@view, :user_path
  def_delegator :@view, :button_to

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      email: { source: 'User.email', cond: :like, searchable: true, orderable: true },
      role: { source: 'User.role', cond: :like, searchable: true, orderable: true }
    }
  end

  private

  def data
    records.map do |user|
      {
        email: user.email,
        role: user.role,
        actions: "#{link_to('edit', edit_user_path(user))}
                  #{link_to('Delete', user, method: :delete, data: { confirm: 'Are you sure?' })}".html_safe
      }
    end
  end

  def get_raw_records(*)
    User.all
  end
end
