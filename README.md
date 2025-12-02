# servicely

A lightweight Rails-oriented service generator and execution toolkit.  
It helps you structure your application using a clean service-layer architecture — fully compatible with Rails apps **and** Rails engines.

`servicely` gives you:

- `rails generate service User::Create` (for app and engines)
- Namespaced service folders
- Optional result object pattern
- Autoload-ready structure for Rails 7+ / Rails 8 / Zeitwerk
- Minimal API — no dependencies unless you enable RSpec tasks

---

## Installation

Add this line to your application's Gemfile:

```ruby
gem "servicely"
