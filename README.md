octobase Cookbook
=================

Requirements
------------

### Platform:

Ubuntu 12.0.4LTS

### Cookbooks:

apt

Attributes
----------

```
default['octo']['url'] = 'https://raw.github.com/octohost/octohost/master/bin/octo'
default['octo']['path'] = '/usr/bin/octo'
default['sudoers'] = '/etc/sudoers'
default['sshd']['config'] = '/etc/ssh/sshd_config'
```

Recipes
-------

### octobase::default

Sets up the base requirements for the octohost install.

Testing
-------

[![Build Status](https://travis-ci.org/darron/octobase-cookbook.png?branch=master)](https://travis-ci.org/darron/octobase-cookbook)

The cookbook provides the following Rake tasks for testing:

    rake integration                  # Alias for kitchen:all
    rake kitchen:all                  # Run all test instances
    rake kitchen:default-ubuntu-1204  # Run default-ubuntu-1204 test instance
    rake lint                         # Lint Chef cookbooks
    rake rubocop                      # Run rubocop tests
    rake spec                         # Run ChefSpec examples
    rake tailor                       # Run tailor tests
    rake taste                        # Run taste tests
    rake test                         # Run all tests

License and Author
------------------

Author:: Darron Froese (darron@froese.org)

Copyright:: 2013, Darron Froese

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Contributing
------------

We welcome contributed improvements and bug fixes via the usual workflow:

1. Fork this repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request
