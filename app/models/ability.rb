class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can [:index, :details], Book

      can [:create], WantListItem
      can [:update, :destroy], WantListItem, want_list_id: user.all_want_lists.pluck(:id)

      can [:index, :create], WantList
      can [:update, :destroy, :items, :export], WantList do |want_list|
        (want_list.owner == user || want_list.want_list_privacy_id == 1)
      end
      can [:items, :export], WantList, id: user.all_want_lists.pluck(:id)
    end
  end
end
