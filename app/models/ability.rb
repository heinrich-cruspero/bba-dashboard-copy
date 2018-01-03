class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can [:index, :details], Book
      can [:update, :destroy], WantListItem, :user => user
      can [:index, :create], WantList
      can [:update, :destroy, :items], WantList, :owner => user
    end
  end
end
