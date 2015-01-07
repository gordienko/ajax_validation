# AjaxValidation

AjaxValidation allows easy client side form validation for Rails 4.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ajax_validation'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install ajax_validation
```

### Include ajax_validation javascript assets

Add the following to your `app/assets/javascripts/application.js`:

```
//= require ajax_validation
```

Localization:

```
//= require ajax_validation/jquery.validate.localization/messages_xx
```

Theme:

```
//= require ajax_validation/theme_bootstrap3
```

### Mount the engine in your routes file, as follows:

```ruby
# config/routes.rb
mount AjaxValidation::Engine => "/ajax_validation"
```

## Usage

### Add a simple validation to your model.

```ruby
# app/models/project.rb
class Project < ActiveRecord::Base
  validates :name, :presence => true,  uniqueness: { case_sensitive: false }, :length => { maximum: 10 }
end
```

### Create app/assets/javascripts/validate.js.coffee

```
jQuery ->

  token = $('meta[name="csrf-token"]').attr('content')
  $.ajaxPrefilter((options, originalOptions, xhr)->
    xhr.setRequestHeader('X-CSRF-Token', token)
  )

  validate_url = '/ajax_validation/validate'
  id = null

  form = $('#new_project, [id^=edit_project_]')
  action = form.attr('action')
  id = action.split('/')[2] if typeof action != "undefined"
  form.validate(
    debug: false
    onkeyup: false
    rules:
      'project[name]':
        required: true
        remote:
          url: validate_url
          data:
            id: id
          type: 'post'
  )

```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
