NirvanaHQ Gem
=============

A gem for the NirvanaHQ.com API. 

Includes a command line tool, **nirv**

Features
--------

Command Line Tool: 

* Add a task via the CLI
* Backup

Gem / Library: (API docs coming - have to spend a few hours reading up on RDoc)

But have a look at the lib & tests for some example usage. I've been good about that at least.


Usage
-----

**Add Task**

basic: 

**nirv add "task name"** adds a task to your inbox  

with tags & a note:

**nirv add "task name" -n "this will show up in the task note." -t "Tag 1,Tag 2"**  

**nirv help** : list all commands


**Backup**

**nirv backup**

Todo
----

* add post install action - create ~/.nirvanahq
* switch test/example/task.json to task.rb so we can have some dyn info
* test what happens when a different user tries

~/.nirvanahq/config.rb

Thanks to [ruby learning blog](http://rubylearning.com/blog/2010/12/14/ruby-gems-%E2%80%94-what-why-and-how/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+LearningRubyBlog+%28Learning+Ruby+Blog%29) This helped. 

Thanks to [boom](https://github.com/holman/boom). Was a good example to work & learn from. Seems to be doing something similar to what I wanted to do, so picked up some gem tips there. 

Between those two, I have been able to cobble together something that works. :) 

Code reviews & suggestions welcome.

todo
create config folder if not found