# Vagrant Chef Environment

This environment will create a pre-configured Linux server including Apache, MySQL, PHP, Composer, and NodeJS.

## Installation

##### Requirements:

- Git 
- Virtualbox
- Vagrant

1. Clone or download the environment
2. Copy config.yml.dist to config.yml, and update the configuration
  - If you need to create a public / private key pair, you can use the following command:
    - `ssh-keygen -t rsa -C "your_email@example.com"`
3. From a command line, navigate to the environment and use "vagrant up" to start the server.

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
