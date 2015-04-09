mongodb Cookbook
================
This recipe installs the latest MongoDB package from Ubuntu's apt repository.
It will also create an admin user on the database.

Requirements
------------
apt cookbook


Attributes
----------

#### mongodb::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['mongodb']['admin_user']['username']</tt></td>
    <td>String</td>
    <td>Username for the admin user</td>
    <td><tt>blank</tt></td>
  </tr>
  <tr>
    <td><tt>['mongodb']['admin_user']['password']</tt></td>
    <td>String</td>
    <td>Password for the admin user</td>
    <td><tt>blank</tt></td>
  </tr>
</table>

NOTE: You can also upload a databag called "mongodb" with a "admin_user" item
which has username and password fields. If you choose this way there is no need
to override the default attributes.

Usage
-----
#### mongodb::default
Just include `mongodb` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mongodb]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Erez Rabih
