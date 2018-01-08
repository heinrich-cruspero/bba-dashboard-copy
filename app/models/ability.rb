class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can [:index, :details], Book

      can [:create], WantListItem
      can [:update, :destroy], WantListItem, :user => user
      can [:update], WantListItem, want_list_id: user.want_lists.pluck(:id)
      can [:update], WantListItem, want_list_id: WantList.where(want_list_privacy_id: 1).pluck(:id)

      can [:index, :create], WantList
      can [:update, :destroy, :items], WantList, :owner => user
      can [:items], WantList, id: user.want_lists.pluck(:id)
      can [:items], WantList, want_list_privacy_id: 1
    end
  end
end
