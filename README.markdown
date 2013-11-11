# kermitrest
[![Build Status](https://travis-ci.org/evenup/evenup-kermitrest.png?branch=master)](https://travis-ci.org/evenup/evenup-kermitrest)

####Table of Contents

1. [Overview](#overview)
2. [Setup](#setup)
    * [Resources managed by kermitrest module](#resources-managed-by-kermitrest-module)
    * [Setup requirements](#setup-requirements)
    * [Beginning with module kermitrest](#beginning-with-module-kermitrest)
3. [Operating Systems Support](#operating-systems-support)
4. [TODO](#todo)
5. [Development](#development)

##Overview

This is a puppet module to install Kermit.fr's MCO REST server


##Setup

###Resources managed by kermitrest module
* This module installs the kermit-restmco package
* Controls the kermit-restmco service
* Manages the kermit-restmco.cfg file

###Setup Requirements
* PuppetLabs stdlib module
* Puppet version >= 2.7.x
* Facter version >= 1.6.2
* MCollective

###Beginning with module kermitrest

To install the package provided by the module just include it:

        include kermitrest

The main class arguments can be provided either via Hiera (from Puppet 3.x) or direct parameters:

        class { 'kermitrest':
          parameter => value,
        }

##Operating Systems Support

This is tested on these OS:
- CentOS 6

## TODO
[] Add apache/passenger support


##Development

Pull requests (PR) and bug reports via GitHub are welcomed.

When submitting PR please follow these quidelines:
- Provide puppet-lint compliant code
- If possible provide rspec tests
- Follow the module style and stdmod naming standards

When submitting bug report please include or link:
- The Puppet code that triggers the error
- The output of facter on the system where you try it
- All the relevant error logs
- Any other information useful to undestand the context
