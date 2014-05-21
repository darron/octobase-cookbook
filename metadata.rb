# encoding: utf-8
name             'octobase'
maintainer       'Darron Froese'
maintainer_email 'darron@froese.org'
license          'Apache 2.0'
description      'Installs/configures some basic octohost items.'
version          '0.10.0'
recipe           'octobase::default', 'Installs/configures some basic octohost items.'

depends 'apt'
depends 'sysstat', '1.3.0'
