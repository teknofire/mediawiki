# mediawiki-cookbook

Installs MediaWiki software from https://www.mediawiki.org.

## Supported Platforms

RHEL 6

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['mediawiki']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['mediawiki']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['mediawiki']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['mediawiki']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### mediawiki::default

Include `mediawiki` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[mediawiki::default]"
  ]
}
```
## TODO

wgLogo Support
Port numbers
Wiki extensions attribute array?
Don't always force https
Change and setup upload dir
Fill out documentation
SELinux Support
MySQL Support
Setup wgEmergencyContact and wgPasswordSender
Tests

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Jeremiah Dabney (<jsdabney@alaska.edu>)
