[![Gem Version](https://fury-badge.herokuapp.com/rb/hash_template.png)](http://badge.fury.io/rb/hash_template)
[![Build Status](https://api.travis-ci.org/denispeplin/hash_template.png?branch=master)](http://travis-ci.org/denispeplin/hash_template)

## hash_template

Transform a flat hash to a structured hash using template.

## Installation

```
gem install hash_template
```

## Example

```ruby
require 'hash_template'
require 'pp'

data = {
  address: 'milton.waddams@initech.com',
  password: 'No salt',
  first_name: 'Milton',
  last_name: 'Waddams',
  department: 'Reporting',
  title: 'Collator',
  privacy: true,
  org_unit_path: '/BasementDwellers'
}

mapping = {
  primaryEmail: :address,
  password: :password,
  name: {
    givenName: :first_name,
    familyName: :last_name
  },
  organizations: [
    {
      department: :department,
      title: :title
    }
  ],
  includeInGlobalAddressList: '!privacy',
  orgUnitPath: 'org_unit_path'
}

pp HashTemplate.new(mapping).map(data)
#{
#  primaryEmail: 'milton.waddams@initech.com',
#  password: 'No salt',
#  name: {
#    givenName: 'Milton',
#    familyName: 'Waddams'
#  },
#  organizations: [
#    {
#      department: 'Reporting',
#      title: 'Collator'
#    }
#  ],
#  includeInGlobalAddressList: false,
#  orgUnitPath: '/BasementDwellers'
#}
```

## Thanks

Inspired by Adam Crownoble's article: [Transforming Hashes: A Refactoring Story](http://codenoble.com/blog/transforming-hashes-a-refactoring-story/)

## Backward transformation

For backward transformation use [hash_map_hash](https://github.com/7Pikes/hash_map_hash) gem.

## License

MIT.
