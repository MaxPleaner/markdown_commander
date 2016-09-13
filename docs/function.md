#### Markdown Commander Docs

---

**Function**

Syntax: `<line start> () <declaration>`

There are a few components which make up a "declaration":

- `at the beginning of the function body, # <program> #` determines which executable runs the subsequent code.  
  - one could use `# node #` or # bash #` for example
- A declaration gets its name from the corresponding `end_f` line.

A simple example:

```txt

This is ./markdown/random_number.md

() # ruby #

  require 'securerandom'
  puts "a random number: #{SecureRandom.urlsafe_base64}"

end_f TestOutRuby

Back to regular markdown
   
``` 

When this file is compiled, an executable `./out/random_number` will be created.

It will look something like this:

```sh
#!/usr/bin/env ruby

def TestOutRuby
  require 'securerandom'
  puts "a random number: #{SecureRandom.urlsafe_base64}"
end
```

If you then require this file, you can run the code:

```ruby
require "./out/random_number"
# "zFJ51JJm8Ucdwo3dg6OTew" is printed
```

The functions are called as one-off scripts - state is not stored in memory between runs.

However, there is a Ruby server which can enable shared state and database persistence. ([docs](./ruby_server.md))
