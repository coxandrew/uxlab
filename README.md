# UX Lab

## Overview

UX Lab is a free resource manager for storing and sharing design images and documents for a project.

## User flows

* Login
* Add user to a project
  * as an owner
  * as a member
  * as a viewer
* Create a new project
* Add a feature to a project
* Re-order features in a project

## Roles

* account owner
  * can create projects
* project owner
  * can add/remove users to a project
  * can assign role to a user on a project
  * can do everything a project member can
* project member
  * can add/edit/delete:
    * features
    * user flows
    * screens
* project viewer
  * can only view features, user flows, screens

## Data Model

    user
      has_many :projects, :through => :user_projects

      username
      password
      password_confirmation

    user_projects
      belongs_to :user
      belongs_to :project

      user_id
      project_id

    project
      has_many :users, :through => :user_projects
      has_many :features

      name
      description

    features
      belongs_to :project
      has_many :flows

      name
      description


    flow
      belongs_to :feature
      has_many :screens

      name
      description

    screen
      belongs_to :flow

      name
      caption
      flow_id

## TODO

### Checkpoint #1

* X Create projects
* Push to github
* X CSS Reset
* X Basic styling
* X Create user flows for a project
* X Upload images directly to a user flow (paperclip)

#### Feedback

* X Don't use for loops: https://github.com/sudrew/uxlab/blob/master/app/views/flows/show.html.erb#L14
* X Use `unless @project.flows.empty?` or `if @project.flows.any?` instead of `if @project.flows.length > 0`

### Checkpoint #2

* X Thumbnail images w/ ImageMagick
* X Make screen thumbnails nicer
* X Make nice, common error message partial
* X Set up Amazon S3
* X Deploy to Heroku
* X Authentication
* X Testing (RSpec)

### Final Checkpoint

* X Consistent navigation (sidebar, breadcrumbs?)
* X User roles (owner, member, viewer for each project)
* Delete Projects, features & flows
* Nice paging through of flow w/ jQuery UI lightbox

### Next Steps

* UI improvements
  * more consistent edit | delete links
  * graphical buttons
  * screen thumbnails with name and caption
* Sortable images in a flow
* Sortable features in a project
* Make screens re-usable across multiple flows (e.g. re-use the 'login' screen for many flows)
* Comments on flows and/or images
* Multiple versions of flows (e.g. sketch, wireframe, mockup)

## Lessons Learned

### Tell Heroku not to instal development and test gems

    $ heroku config:add BUNDLE_WITHOUT="development:test"

### Amazon S3

### Paperclip

### Rails 3 Tips

Link to nested routes using arrays. The following equates to: `project_features_path(@project, @feature)`:

    <%= link_to "Feature", [@project, @feature] %>

Stub current_user from the application_controller

    before(:each) do
      controller.stub!(:current_user).and_return(mock_model(User))
    end

Stub associations used for building or creating new associated objects:

    it "assigns a new feature as @feature" do
      Project.stub(:find).with("37") { mock_project }
      feature_proxy = mock('feature association proxy', :build => mock_feature)
      mock_project.stub(:features).and_return(feature_proxy)

      get :new, :project_id => "37"
      assigns(:project).should be(mock_project)
      assigns(:feature).should be(mock_feature)
    end

Use new Arel query syntax to define custom lookups through associations:

    def self.with_role(role)
      joins(:role).where(:roles => {:name => role})
    end
