# UX Lab

## Overview

UX Lab is a free resource manager for storing and sharing design images and documents for a project.

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
* Consistent navigation (sidebar, breadcrumbs)
* Delete Projects, flows & screens

### Final Checkpoint

* User roles (owner, member, viewer for each project)
* Cucumber testing
* Nice paging through of flow w/ jQuery UI lightbox
* Sortable images in a flow
* Sortable features in a project
* Make screens re-usable across multiple flows (e.g. re-use the 'login' screen for many flows)
* UI improvements:
  * Nice header
  * Image button links
* Comments on flows and/or images
* Multiple versions of flows (e.g. sketch, wireframe, mockup)

## Lessons Learned

### Tell Heroku not to instal development and test gems

    $ heroku config:add BUNDLE_WITHOUT="development:test"

### Amazon S3

### Paperclip

### Rails 3 Tips

* Link to nested routes using arrays:

    <%= link_to "Feature", [@project, @feature] %>

* Stub current_user in the application_controller

    before(:each) do
      controller.stub!(:current_user).and_return(mock_model(User))
    end
