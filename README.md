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
  has_many :images

  name
  description

images
  has_many :tags

  name
  caption

## TODO

### Checkpoint #1

x * Create projects
x * Push to github
x * CSS Reset
x * Basic styling
x * Create user flows for a project
x * Upload images directly to a user flow (paperclip)

### Checkpoint #2

* Thumbnail images w/ ImageMagick
* Delete Projects, flows & screens
* Nice paging through of flow w/ jQuery UI lightbox
* Sortable images in a flow
* Make screens re-usable across multiple flows (e.g. re-use the 'login' screen for many flows)
* UI improvements:
  * Nice header
  * Image button links

### Final Checkpoint

* Comments on flows and/or images
* User roles (owner, member, viewer for each project)
* Inception artifacts:
  * Mission statement
  * Target audience
  * Scoping list (in/out/undecided)
  * Elevator pitch
* Ajax adding of projects
* Multiple versions of flows (e.g. sketch, wireframe, mockup)