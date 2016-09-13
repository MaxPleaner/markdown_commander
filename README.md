Markdown Commander

---

**About**

This is a note-taking system with embeddable code.

The code can be loaded by another program.

**To Run**

1. `clone`
2. `bundle`
3. `env MD='./markdown' OUT='./out' bundle exec ruby mc.rb`
  - this will find any markdown files in the `ENV["MD"]` folder and compile them into `ENV["OUT"]`
  
**Compilation / Syntax**

Here's how the compilation step parses through the markdown source and constructs its results:

**Special Commands**

| Command        | Regex           | Effect  |
| ------------- |:-------------:| -----:|
| () at beginning of line      | /^\(\)/ | function declaration ([docs](./docs/function.md)) |

