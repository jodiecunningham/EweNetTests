# EweNetTests
Making some basic network tests easy via CSV

# Overview
## What is it?
It's just a toolbox of Robot Framework tests designed to be run from remote machines, and some scripts to ingest a CSV and run tests based on that.
## Why did you make it?
To try to bring some easy-ish automated pre/post change testing to firewall and network changes.
I've seen a number of exchanges where a server person needs to access something, they put in a network ticket (maybe filling out the network team's firewall form), and testing/changes ping-pong back and forth between the teams until they're complete. 

The idea with the testing is for it to be an automated pre/post change test suite where:
* The Robot Framework CI/CD job runner can jump to the test host servers
* The test host servers are configured for remote access (SSH/WinRM for Ansible Remoting etc)
* The test host servers have directory or local accounts configured for access
* Server or Network admins can define tests to run in relation to the change

## Who is it for?
## How would I use it, where does it fit?
![fwtesting](https://user-images.githubusercontent.com/1390085/162351589-f930116c-9054-496e-aef0-5b034c0fbfd7.png#gh-light-mode-only)
## How do you report bugs?
Feel free to submit a Github Issue or send a pull request.




