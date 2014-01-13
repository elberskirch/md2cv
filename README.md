# md2cv

This gem contains a simple tool named md2cv, which converts a cv in markdown format 
to html & pdf using wkhtml2pdf. 

The whole thing is inspired by markdown-cv (https://github.com/bitlyfied/markdown-cv) 
and the flow of the html/pdf generation is derived from that project. 

## Installation

Simply run:

    $ gem install md2cv

This installes a binary called md2cv in your path. 

Make sure you have the wkhtml2pdf binary installed.  
## Usage

    $ md2cv cv-in-markdown.md
   
This creates a directory named "build" in the current directory and 
copies stylesheets from the template in that directory. In "build" you'll
also find cv-in-markdown.[html|pdf].

## Templates

Under lib/template/ there's a slim template and the according css files that 
are installed & used by default. 

If you want to write your own stylesheets just have a look at the base.slim template 
and make sure the links to the css are not pointing to a sub-directory but are in the same directory.

md2cv expects a slim template named "base.slim". 
