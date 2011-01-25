# UX Lab

## Overview

UX Lab is a free resource manager for storing and sharing design images and documents for a project.

## Data Model

users
  has_many :projects, :through => :user_projects

  username
  password
  password_confirmation

user_projects
  belongs_to :user
  belongs_to :project

  user_id
  project_id

projects
  has_many :users, :through => :user_projects
  has_many :flows

  name
  description

flows
  belongs_to :project
  has_many :screens

  name
  description

screens
  belongs_to :flow

  name
  caption
  flow_id

## TODO

### Checkpoint #1

* <s>Create projects</s>
* <s>Push to github</s>
* <s>CSS Reset</s>
* <s>Basic styling</s>
* <s>Create user flows for a project</s>
* <s>Upload images directly to a user flow (paperclip)</s>

#### Feedback

* <s>Don't use for loops</s>
* <s>Use `unless @project.flows.empty?` or `if @project.flows.any?` instead of `if @project.flows.length > 0`</s>

### Checkpoint #2

* <s>Thumbnail images w/ ImageMagick</s>
* <s>Make screen thumbnails nicer</s>
* <s>Make nice, common error message partial</s>
* <s>Set up Amazon S3</s>
* <s>Deploy to Heroku</s>
* <s>Authentication</s>
* <s>Testing (RSpec)</s>
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

    <%= link_to "Feature", [@project, @feature] %>