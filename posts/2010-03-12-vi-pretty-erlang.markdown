---
title: Using VIM to make erlang pretty
description: Quick hack to format erlang code in vim
---

I recently read an article ( Which no longer exists  ) talking about purtifying erlang. This inspired me to create a quick function in vim to do this for me!
Here it is:

    function! ErlPretty()
        silent !erl -noshell -eval 'erl_tidy:file("%",[verbose]).' -s erlang halt
    endfunction
    nmap ep :execute ErlPretty()
