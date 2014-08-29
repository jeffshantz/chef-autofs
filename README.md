# chef-autofs

Configures the autofs service on a Chef node.

## Supported Platforms

* Ubuntu 14.04

## Dependencies

This cookbook depends on the following cookbooks:

* `nis` (https://github.com/jeffshantz/chef-nis)
* `nsswitch` (https://github.com/jeffshantz/chef-nsswitch)

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td>
      <tt>node[:autofs][:timeout]</tt>
    </td>
    <td>Integer</td>
    <td>Set the default mount timeout</td>
    <td><tt>300</tt></td>
  </tr>
  <tr>
    <td>
      <tt>node[:autofs][:browse_mode]</tt>
    </td>
    <td>Boolean</td>
    <td>Whether or not maps are browsable by default</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td>
      <tt>node[:autofs][:options]</tt>
    </td>
    <td>String</td>
    <td>Additional options to be specified in /etc/default/autofs</td>
    <td><tt>""</tt></td>
  </tr>
</table>

## Usage

### autofs::nis

Include `autofs::nis` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[autofs::nis]"
  ]
}
```

## Testing

The tests in this cookbook are very much specific to my environment.  I may
eventually fix that, but that's just the way it is for now.

Be sure that you've run `bundle` before attempting to run any of the
following commands.

Unit tests can be run with RSpec:

```bash
$ cd autofs
$ rspec
```

While developing, however, you'll want to run Guard to have it
automatically run the unit tests each time a file is changed:

```bash
$ cd autofs
$ guard
```

To run integration tests:

```bash
$ cd autofs
$ kitchen test
```

Note, however, that you will need to comment out the lines with `FIXME` comments
in the integration tests (within `test/integration`) as these apply to one
specific infrastructure and will not work in your infrastructure.

Also, you'll need to have VirtualBox and Vagrant installed.

Finally, to properly test things, you'll need to set the default gateway to the
gateway for the bridged interface, and edit /etc/resolv.conf appropriately.

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Jeff Shantz (<jeff@csd.uwo.ca>)

```text
Copyright:: 2014, Western University

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
`
