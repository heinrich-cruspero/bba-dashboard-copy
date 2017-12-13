class WantListDatatable < AjaxDatatablesRails::Base

    def_delegator :@view, :link_to
    def_delegator :@view, :edit_want_list_path
    def_delegator :@view, :want_list_path
    def_delegator :@view, :button_to
    def_delegator :@view, :items_want_list_path

    def view_columns
      @view_columns ||= {
          name: { source: "WantList.name", cond: :like, searchable: true, orderable: false  },
          user_id: { source: "WantList.user_id", cond: :like, searchable: true, orderable: false },
          want_list_privacy_id: { source: "WantList.want_list_privacy_id", cond: :like, searchable: true, orderable: false }
      }
    end

    def data
      # enable_edit =
      records.map do |want_list|
        {
          name: want_list.name,
          user_id: want_list.user.email,
          want_list_privacy_id: want_list.want_list_privacy.name,
          items: button_to("items", items_want_list_path(want_list), method: :get, class: "mdl-js-ripple-effect"),
          # if (@view.current_user.admin)
          # edit: if (@view.current_user.admin == "TRUE")
            edit: button_to("edit", edit_want_list_path(want_list), method: :get, class: "mdl-js-ripple-effect"),
                # end,
          # end
          show: button_to("Show", want_list, method: :get, class: "mdl-js-ripple-effect"),
          delete: button_to("Delete", want_list, method: :delete, data: { confirm: 'Are you sure?' }, class: "mdl-js-ripple-effect")
        }
      end
    end

    private
    def get_raw_records()
      WantList
          .joins('LEFT JOIN users_want_lists on users_want_lists.want_list_id = want_lists.id')
          .where("users_want_lists.user_id=#{@view.current_user.id} or want_lists.user_id=#{@view.current_user.id}").all
    end

end


