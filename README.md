# Vagrant Chef Environment

A development platform for PHP, Ruby, and NodeJS applications, which contains a pre-configured Linux server with the following software: 

Default:

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

Optional:

- Java 1.7.0 (for Solr)
- ElasticSearch

Please review the "lamp" cookbook for more specific installation details.

## Installation

##### Required Software:

- [Virtualbox](https://www.virtualbox.org/)
- [Vagrant](http://www.vagrantup.com/)

1. Download or clone this repository
2. Copy config.yml.dist to config.yml, and modify your configuration variables
  - If you don't know your public key path, [please read](https://help.github.com/articles/generating-ssh-keys).
3. From a command line, navigate to your environment and start the server

##### Example:

```
git clone git@github.com:cmdlabs/vagrant-chef.git
# update your config.yml
cd vagrant-chef
vagrant up
```

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

### lamp::default

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
