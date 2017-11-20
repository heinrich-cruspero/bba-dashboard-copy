module WantListsHelper
  def get_privacy_list
    @want_list_privacy = WantListPrivacy.all
    end
end
