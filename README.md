# Course Question Bank - CS 169 Project

[![Code Climate](https://codeclimate.com/github/jshoe/coursequestionbank/badges/gpa.svg)](https://codeclimate.com/github/hrzlvn/coursequestionbank)
[![Travis CI](https://travis-ci.org/jshoe/coursequestionbank.svg?branch=master)](https://travis-ci.org/hrzlvn/coursequestionbank)
[![Test Coverage](https://codeclimate.com/github/jshoe/coursequestionbank/badges/coverage.svg)](https://codeclimate.com/github/hrzlvn/coursequestionbank/coverage)
<span style="background-color: blue; text-decoration:none; font: Verdana 7px bold; color:white; padding: 2px; margin: 2px;" ><a style="background-color: blue; text-decoration:none; font: Verdana 7px bold; color:white; padding: 2px; margin: 2px;" href="https://www.pivotaltracker.com/n/projects/1544183">PivotalTracker</a></span>

# Current Status
Currently, our six-students team (from Cal CS169) is working on the development.
## It's now Iteration 1-2.
Please see ./iterations/README.md for more details.

## User Guide

See the [Wiki](https://github.com/saasbook/coursequestionbank/wiki).

## Running or Testing Locally

You need to run a solr process during local development (or Cloud9 for those who used it). So `bundle exec sunspot-solr start -p 8983` to start and `bundle exec sunspot-solr stop` to stop (basically the steps in the .travis.yml). And the config in sunspot.yml should enable the app to connect properly.

When running locally, you can click the "Dev Login" button and login as either `saas` (Instructor privilege) or `saas-admin` (Admin privilege) with no password needed.

## Deployment

Currently set up to deploy to Heroku. Websolr worker supposed to periodically re-indexes the questions so that keyword search will work; you can run it manually with `heroku run rake sunspot:solr:reindex`, please send an Email to RZH at Berkeley dot edu to submit a whitelist request. [Course Question Bank on Heroku](https://coursequestionbank.herokuapp.com/)

## Admin Privilege

Create the initial admin user based on their GitHub username: `heroku run rake setup:add_admin[github-username-here]`
Create the initial instructor user based on their GitHub username: `heroku run rake setup:add_instructor[github-username-here]`
Other users are students by default

## To Do

* The URL `questionbank.saasbook.info` points to the running app, but for now you must access it as `cs-coursequestionbank.herokuapp.com` until we get a proper SSL cert for the new name and change the GitHub OAuth callback URL to match the vanity domain.
* It's in private beta with core group of [ESaaS instructors](http://www.saasbook.info).  Armando Fox or Sam Joseph can add you to the beta whitelist if you're part of that core group.
