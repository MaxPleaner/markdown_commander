#### Markdown Commander

Ruby Server docs

---

**Set Up**

The ruby server lives in `ruby_server.rb`

Install its dependencies with `bundle`, then start it with `bundle exec ruby start_server.rb`

By default, it will run on `localhost:1776`, but you can also run it on custom port / host:

If you go to the root page you will see a directory of your markdown files. Just click one to load it.

```ruby
env APP_HOST='0.0.0.0' APP_PORT='2016' bundle exec ruby start_server.rb`
```

When the repo is cloned, it includes a `.env.example` file. To change the Database connection parameters, rename this file to `.env` and edit it. 

It uses a sqlite database so the `sqlite3` system library must be installed (i'm only testing this on ubuntu).

---

**Usage**

_on-the-fly compilation_

This server enables compilation on a one-off basis when a file is requested.
It listens on stdin for a filepath, makes a temporary compilation, and runs it.

_added commands_

- `(req) <path>`
  - if the paths are ruby scripts, require them, otherwise run them in separate threads.

- `(html) <out_file>`
  - Set Markdown Commander into "html mode", meaning it will compile this file to HTML at `<out_file>`

_database_

The database is make available to Ruby scripts by the `DB` constant.

There is only one model pre-defined, `DB.Record` with columns `name` (string), `data` (text), and `metadata` (text).

It's an ActiveRecord model.

You can either add models via a Markdown Commander script (see [models.rb](./lib/models.rb) for an example) or by editing that file


