#!/bin/bash

# alias rm=trash
# set -o vi
# set the rate for cursor move
xset r rate 300 50

#python
# export PYTHON_HOME=/Users/jakejing/anaconda/bin
# export PYTHONPATH=/Library/Python/2.7/site-packages

export LIBS="-L/Users/jakejing/Documents/pythonwd/word_alignment/PA3/boost_1_52_0/stage/lib "
export CPPFLAGS="-I/Users/jakejing/Documents/pythonwd/word_alignment/PA3/boost_1_52_0 "

#java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home
export CLASSPATH=$CLASSPATH:/Users/jakejing/jython2.7.0
export PATH=/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:$JAVA_HOME/bin:$JYTHON_HOME/:$JYTHONPATH:/usr/local/opt/coreutils/libexec/gnubin:$HOME/.rvm/bin:$HOME/.gem/ruby/2.7.0/bin:/Users/jakejing/.rvm/gems/ruby-2.7.0:/Users/jakejing/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0


. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
