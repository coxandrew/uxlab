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

* Create projects
* Push to github
* CSS Reset
* Basic styling
* Create user flows for a project
* Upload images directly to a user flow (paperclip)

### Checkpoint #2

* Add jQuery
* Nice paging through of flow w/ jQuery UI
* Sortable images in a flow
* Select images from library to add to user flows (e.g. re-use the 'login' screen for many flows)
* Image button links
* Comments on flows and/or images

### Final Checkpoint

* Ajax adding of projects
* Multiple versions of flows (e.g. sketch, wireframe, mockup)
* User roles (owner, member, viewer for each project)
* Inception artifacts:
  * Mission statement
  * Target audience
  * Scoping list (in/out/undecided)
  * Elevator pitch