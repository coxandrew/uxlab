class Ability
  include CanCan::Ability

  def initialize(user)
    # Projects
    can :manage, Project do |project|
      user.role_in_project?(:owner, project)
    end
    can :create, Project
    can :read, Project do |project|
      user.role_in_project?([:member, :viewer], project)
    end

    # Features
    can :manage, Feature do |feature|
      user.role_in_project?([:owner, :member], feature.project)
    end
    can :read, Feature do |feature|
      user.role_in_project?(:viewer, feature.project)
    end

    # Flows
    can :manage, Flow do |flow|
      user.role_in_project?([:owner, :member], flow.feature.project)
    end
    can :read, Flow do |flow|
      user.role_in_project?(:viewer, flow.feature.project)
    end

    # Screens
    can :manage, Screen do |screen|
      user.role_in_project?([:owner, :member], screen.flow.feature.project)
    end
    can :read, Screen do |screen|
      user.role_in_project?(:viewer, screen.flow.feature.project)
    end
  end
end
