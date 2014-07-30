bash-doxygen
============

A basic doxygen filter (originaly written for GNU sed) allowing you to
add inline-documentation to your bash shell scripts.

### Supported shell syntaxes

* All lines starting with a `## ` (without any leading blanks) are
  provided to doxygen. You can use all doxygen command you want in
  those lines. (see
  [http://www.stack.nl/~dimitri/doxygen/manual/commands.html](doxygen
  documentation))

* Some top level declarations will be recognized if you use the
  `declare` primitive: 
  * `declare -a` for arrays
  * `declare -A` for associavite arrays
  * `declare -i` for integers
  * `declare -r` for read-only strings
  * Any other top-level `declare` statement will consider variable is a string.

* Functions declaration will be recognized if:
  1. a `## @fn` line is found
  2. function is declared **without** the non-posix `function` keyword
  3. the opening { is on the same line than the `funcname()` instruction

How to use it
-------------

Mention doxygen-bash.sed in either the INTPUT_FILTER or the
FILTER_PATTERN directive of your Doxyfile. If doxygen-bash.sed is in
your $PATH, then you can just invoke it as is, else use `sed -n -f
/path/to/doxygen-bash.sed --`.

Remember than you can generate a brand new Doxyfile by simply running
`doxygen -g`.


Known limitations
-----------------

Yes.

FAQ
---

Q. Does it actually work ?  
A. The [bash-argsparse](https://github.com/Anvil/bash-argsparse)
project uses this filter. Check
[http://argsparse.livna.org/doxygen/](the result). Click on the
links. See by yourself.

Q. Why is the project named bash-doxygen while the filter is named
doxygen-bash ?  
A. Yeah, haha. Seriously.


