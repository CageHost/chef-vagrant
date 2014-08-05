# CMD Vagrant Chef Environment

#### A development platform for PHP, Ruby, and NodeJS applications, which creates a pre-configured Linux server containing the following:

## Overview

#### Default Software:

- Apache 2.2
- NGINX 1.2.1
- MySQL 5.5
- PHP 5.4 + Composer
- NodeJS 0.10.26 + NPM
- Ruby 1.9.3 + RVM
- Grunt 0.1.13
- Capistrano 2.15.5
- Git, Imagemagick, Sendmail
- PHP Extensions (apc, curl, mcrypt, imagick)

#### Optional Software:

- Java 1.7.0 (for Solr)
- ElasticSearch

Please review the [CMD LAMP cookbook](https://github.com/cmd-cookbooks/lamp) for specific software installation details.

## Local Installation

#### Requirements:

- [Virtualbox](https://www.virtualbox.org/)
- [Vagrant](http://www.vagrantup.com/)

#### Instructions:

1. Download or clone this repository
2. Copy config.yml.dist to config.yml, and modify your configuration variables
  - If you don't know your public key path, [create one](https://help.github.com/articles/generating-ssh-keys).
3. From a command line, navigate to your directory and start the server

#### Example:

```
git clone git@github.com:cmdlabs/vagrant-chef.git
# update your config.yml
cd vagrant-chef
vagrant up
```

## Server Management

#### Requirements

 - Berkshelf
 - Knife Solo

#### Node configuration

Server configuration files are hosted in the [cmd/chef-nodes](/cmd/chef-nodes) private repository,
and given access can be imported as a submodule via: `git submodule update --init`

## Supported Platforms

Windows, Mac

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['lamp']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

#### lamp::default

Include `lamp` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[lamp::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Alex Crawford (acrawford@cmdagency.com)
