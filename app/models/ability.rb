class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role? :owner
      can :manage, Project, :owner_id => user.id

      # TODO: Are these conditional blocks necessary?
      #
      # If they're not authorized to manage the project, we may not need
      # to check these.
      can :manage, Feature do |feature|
        feature.project.owner_id == user.id
      end
      can :manage, Flow do |flow|
        flow.feature.project.owner_id == user.id
      end
      can :manage, Screen
    end

    if user.role? :member
      can :manage, Feature
      can :manage, Flow
      can :manage, Screen
    end

    if user.role? :viewer
      can :read, :all
    end
  end
end
