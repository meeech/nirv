NirvanaHQ Gem
=============

A gem for the [NirvanaHQ.com](http://nirvanahq.com) API. 

Includes a command line tool, **nirv**

NirvanaHQ is an online todo/task manager, based around the GTD method. 

**gem install nirvanahq**

Features
--------

Command Line Tool: 

* Add a task via the CLI
* Backup

Gem / Library: (API docs coming - have to spend a few hours reading up on RDoc)

Have a look at the lib & tests for some example usage. 

This is by no means a final version, so you know the deal.


Usage (CLI)
-----------

First thing: run **`nirv init`**

This will create **~/.nirvanahq/config.rb**. You need to edit that file - change the values for your username and password.

**Add Task**

basic: 

**`nirv add "task name"`** adds a task to your inbox  

with tags & a note:

**`nirv add "task name" -n "this will show up in the task note." -t "Tag 1,Tag 2"`**  

**Backup**

**nirv backup**

Dumps a full copy of your account to ~/.nirvanahq/backup.json. 

I added it just because. For the data loss paranoid, or those just wanting their data.

**Everything Else**

**nirv version** obvious.

**nirv help** pretty much the info in this section. 


About
-----

Wanted a quick way to add tasks from the cli. Also learning ruby, so this seemed a good fit. So, started a gem with a cli tool.

Right now, just focused on adding a task easily. 

You can examine the nirvanahq api in your browser - their web app uses it, so its pretty straight-forward to see whats going on.

**gems - what why and how** from [ruby learning blog](http://rubylearning.com/blog/2010/12/14/ruby-gems-%E2%80%94-what-why-and-how/) helped, as well as studying  [boom](https://github.com/holman/boom). Was a good example to work & learn from initially. Seems to be doing something similar to what I wanted to do, so picked up some gem tips there. And just talking to some people :) 

comments/examples how to improve it welcome. 

no association with nirvanahq.com, so any problems you have, open ticket on the [github site](https://github.com/meeech/nirv/issues). 

m.