# Course Question Bank - CS 169 Project
[![Code Climate](https://codeclimate.com/github/hrzlvn/coursequestionbank/badges/gpa.svg)](https://codeclimate.com/github/hrzlvn/coursequestionbank)
[![Travis CI](https://travis-ci.org/hrzlvn/coursequestionbank.svg?branch=master)](https://travis-ci.org/hrzlvn/coursequestionbank)
[![Test Coverage](https://codeclimate.com/github/hrzlvn/coursequestionbank/badges/coverage.svg)](https://codeclimate.com/github/hrzlvn/coursequestionbank/coverage)
<span style="background-color: blue; text-decoration:none; font: Verdana 7px bold; color:white; padding: 2px; margin: 2px;" ><a style="background-color: blue; text-decoration:none; font: Verdana 7px bold; color:white; padding: 2px; margin: 2px;" href="https://www.pivotaltracker.com/n/projects/1544183">PivotalTracker</a></span>

# Current Status
Currently, our six-students team (from Cal CS169) is working on the development.
## It's now Iteration 3-2.
Please see ./iterations/README.md for more details.

## User Guide
See the [Wiki](https://github.com/saasbook/coursequestionbank/wiki).

## Running or Testing Locally
use `rake run` after bundle install and `db:migration`, `db:seed` 

## Deployment
Currently set up to deploy to Heroku, you need Websolr addon to be installed on Heroku. Websolr worker supposed to periodically re-indexes the questions so that keyword search will work; you can run it manually with `heroku run rake sunspot:solr:reindex`. [Course Question Bank on Heroku](https://coursequestionbank.herokuapp.com/)


## To Do
* The URL `questionbank.saasbook.info` points to the running app, but for now you must access it as `cs-coursequestionbank.herokuapp.com` until we get a proper SSL cert for the new name and change the GitHub OAuth callback URL to match the vanity domain.
* It's in private beta with core group of [ESaaS instructors](http://www.saasbook.info).  Armando Fox or Sam Joseph can add you to the beta whitelist if you're part of that core group.
