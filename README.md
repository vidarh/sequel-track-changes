
# Sequel plugin to track table changes #

(C) 2011 Vidar Hokstad <vidar@hokstad.com>. See LICENSE for license terms (MIT license)

This plugin is **not** yet ready for general use. It's just some code I've torn out of 
another project, and it'll take a few revisions before I'll have packaged it up neatly.
It works for me in a small Sinatra project, though.

Include this plugin in any model you want to track changes to objects manipulated through
Sequel model objects. Note that since it relies on Sequel hooks, it's subject to all
the caveats (e.g. you can easily bypass this tracking by using explicit SQL statements,
updating it from outside Sequel, or otherwise being a smartass - if that's an issue for you,
triggers or replication + logging are safer solutions for you).

