class WantListDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :link_to
  def_delegator :@view, :edit_want_list_path
  def_delegator :@view, :want_list_path
  def_delegator :@view, :items_want_list_path

  def view_columns
    @view_columns ||= {
        name: { source: "WantList.name", cond: :like, searchable: true, orderable: true  },
        email: { source: "User.email", cond: :like, searchable: true, orderable: true },
        privacy: { source: "WantListPrivacy.name", cond: :like, searchable: true, orderable: true }
    }
  end

  def data
    records.map do |want_list|
      {
          name: want_list.name,
          email: want_list.owner.email,
          privacy: want_list.want_list_privacy.name,
          actions: link_to("items", items_want_list_path(want_list)) +' '+
              link_to("edit", edit_want_list_path(want_list)) + ' '+
              link_to("Delete", want_list, method: :delete, data: { confirm: 'Are you sure?' })
      }
    end
  end

  private

  def get_raw_records()
    WantList.includes(:owner, :want_list_privacy).references(:owner, :want_list_privacy)
            .joins('LEFT JOIN "users_want_lists" ON "users_want_lists"."want_list_id" = "want_lists"."id"')
            .where("want_lists.user_id=#{@view.current_user.id} OR users_want_lists.user_id=#{@view.current_user.id} OR want_list_privacy_id = 1")
            .distinct
  end
end
