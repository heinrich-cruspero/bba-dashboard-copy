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
      can [:update, :destroy, :items, :export], WantList, :owner => user
      can [:items, :export], WantList, id: user.all_want_lists.pluck(:id)
    end
  end
end
