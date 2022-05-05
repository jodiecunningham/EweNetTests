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

## How are the files broken up? 
Right now most tests are centered around ping, tcp port checks and curl/invoke-webrequests. They are broken up further in access method. 

* azpsvmrun-linux- : Robot test runner uses Powershell Az module command Invoke-AzVmRunCommand for Linux-based tests (requires Azure guest agent on the testing host, Az PS module on Robot agent machine)
* azpsvmrun-windows : Robot test runner uses Powershell Az module command Invoke-AzVmRunCommand for Windows-based tests (requires Azure guest agent on the testing host, Az PS module on Robot agent machine))
* azvmrun-linux- : Robot test runner uses Azure az CLI vm run-command for Linux-based tests (requires Azure guest agent on the testing host, Azure CLI on Robot agent machine)
* azvmrun-windows : Robot test runner uses Azure az CLI vm run-command for Windows-based tests (requires Azure guest agent on the testing host, Azure CLI on Robot agent machine))
* azapp-windows : Robot test runner uses Powershell Az module commands to get credentials for the App Service, then uses a slick Powershell module to access the Azure App Services Kudu API in the Windows plan App Services ( requires Az PS module on Robot Agent Machine ) 
* linuxssh- : Robot test runner connects to a Linux host via SSH to execute Linux-based tests (requires SSH client and Robot SSHLibrary)
* winrm- : Robot test runner connects to a Windows machine with WinRM (requires pywinrm and Robot WinRM library)

## Outstanding objectives:
* Better host inventory, organization and tagging of some sort (surely this is already solved elsewhere)
* Automatic test method and test host selection based on CSV details
* AWS SSM runners
* VMWare vmrun runners
* Automatic test method and test host selection based on evaluated firewall config


## Who is it for?
People who still believe in the potential of Zombocom. Or, alternatively:  sysadmins, neteng, QA testers.

## How would I use it, where does it fit?
Right now, use robotfwtest.csv as a template for your tests.
Run-EweNetTests.ps1 or Run-EweNetTests.py runs against the robotfwtest.csv file.


![testrunflow](https://user-images.githubusercontent.com/1390085/162353856-38e9707b-9da4-4f84-9e52-9b9c23eb89cb.png#gh-light-mode-only)
![fwtesting](https://user-images.githubusercontent.com/1390085/162351589-f930116c-9054-496e-aef0-5b034c0fbfd7.png#gh-light-mode-only)
## How do you report bugs?
Feel free to submit a Github Issue or send a pull request.




