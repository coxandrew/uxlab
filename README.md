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
* Create user flows for a project
* Upload images directly to a user flow (paperclip)
* CSS Reset + 960gs


### Checkpoint #2

* Swap in jQuery
* Nice paging through of user flow w/ jQuery UI
* Select images from library to add to user flows
* Tag images
* Multiple versions of flows (e.g. sketch, wireframe, mockup)

### Final Checkpoint

* User roles (owner, member, viewer for each project)
* Inception artifacts:
  * Mission statement
  * Target audience
  * Scoping list (in/out/undecided)
  * Elevator pitch