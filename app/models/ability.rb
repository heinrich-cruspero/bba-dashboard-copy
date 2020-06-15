# frozen_string_literal: true

##
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.user?
      can %i[index details], Book

      can [:create], WantListItem
      can %i[update destroy], WantListItem, want_list_id: user.all_want_lists.pluck(:id)

      can %i[index create], WantList
      can [:update, :destroy, :items, :export], WantList do |want_list|
        (want_list.owner == user || want_list.want_list_privacy_id == 1)
      end
      can %i[items export], WantList, id: user.all_want_lists.pluck(:id)
    elsif user.warehouse?
      can :manage, RentalReturn
      can %i[index], Book
    end
  end
end
