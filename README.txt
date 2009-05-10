scrummy
    by Anders Engström
    http://github.com/metamorph/scrummy

== DESCRIPTION:

A simple DSL and a set of tools to define and manage a sprint in a Scrum.

== FEATURES/PROBLEMS:

* Define the Sprint using a simple DSL.
* Use a similar DSL to record progress during daily scrums.
* Extract information (incl. Burndown Charts) from the sprint using a simple command line tool.

== SYNOPSIS:

Create a project:

  scrummy create [project_name]

Edit the created file ([project_name]/sprint.rb):

  Sprint.define "Name of the sprint" do

    # ...

  end 


== REQUIREMENTS:

FIXME: TDB.

== INSTALL:

* FIXME (sudo gem install, anything else)

== LICENSE:

(The MIT License)

Copyright (c) 2008 FIXME (different license?)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
