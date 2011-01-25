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

x * Create projects
x * Push to github
x * CSS Reset
x * Basic styling
x * Create user flows for a project
x * Upload images directly to a user flow (paperclip)

#### Feedback

x * Don't use for loops: https://github.com/sudrew/uxlab/blob/master/app/views/flows/show.html.erb#L14
x * Use `unless @project.flows.empty?` or `if @project.flows.any?` instead of `if @project.flows.length > 0`

### Checkpoint #2

x * Thumbnail images w/ ImageMagick
x * Make screen thumbnails nicer
x * Make nice, common error message partial
x * Set up Amazon S3
x * Deploy to Heroku
x * Authentication
x * Testing (RSpec)
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