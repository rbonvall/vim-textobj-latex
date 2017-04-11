textobj-latex — Vim text objects for LaTeX code
===============================================

This plugin provides text objects for common LaTeX stuff that are not
conveniently described by builtin Vim text objects.

Currently supported text objects are:

=== === ================================================
a   i   Description
--- --- ------------------------------------------------
a\\ i\\ Inline math surrounded by ``\(`` and ``\)``.
a$  i$  Inline math surrounded by dollar signs.
aq  iq  Single-quoted text ```like this'``.
aQ  iQ  Double-quoted text ````like this''``.
ae  ie  Environment ``\begin{…}`` to ``\end{…}``
=== === ================================================

Example
-------
Let █ be the position of the cursor.

Start with this::

    \begin{document}
    \begin{frame}{Example}
    \begin{minipage}[t]{0.4\textwidth}
      The ``quick'' brown fox jumped█
      over the ``lazy'' dog
      \(\sum_i n_i\) times this month
      where \(n_i\) is the number of jumps
      on day $i$.
    \end{minipage}
    \end{frame}
    \end{document}

Press ``>ae`` to indent the minipage::

    \begin{document}
    \begin{frame}{Example}
      \begin{minipage}[t]{0.4\textwidth}
        The ``quick'' brown fox jumped█
        over the ``lazy'' dog
        \(\sum_i n_i\) times this month
        where \(n_i\) is the number of jumps
        on day $i$.
      \end{minipage}
    \end{frame}
    \end{document}

Press ``Fq`` and then ``gUiQ`` to convert
the double-quoted text to uppercase::

    \begin{document}
    \begin{frame}{Example}
      \begin{minipage}[t]{0.4\textwidth}
        The ``█QUICK'' brown fox jumped
        over the ``lazy'' dog
        \(\sum_i n_i\) times this month
        where \(n_i\) is the number of jumps
        on day $i$.
      \end{minipage}
    \end{frame}
    \end{document}

Press ``jj`` and then ``ci\`` to start changing the equation::

    \begin{document}
    \begin{frame}{Example}
      \begin{minipage}[t]{0.4\textwidth}
        The ``QUICK'' brown fox jumped
        over the ``lazy'' dog
        \(█\) times this month
        where \(n_i\) is the number of jumps
        on day $i$.
      \end{minipage}
    \end{frame}
    \end{document}

Type something, then ``<Esc>`` and ``jjh``::

    \begin{document}
    \begin{frame}{Example}
      \begin{minipage}[t]{0.4\textwidth}
        The ``QUICK'' brown fox jumped
        over the ``lazy'' dog
        \(n_1 + \cdots + n_30\) times this month
        where \(n_i\) is the number of jumps
        on day $i$█.
      \end{minipage}
    \end{frame}
    \end{document}

``da$``, ``B`` and ``p`` moves the equation
before its preceding word::

    \begin{document}
    \begin{frame}{Example}
      \begin{minipage}[t]{0.4\textwidth}
        The ``QUICK'' brown fox jumped
        over the ``lazy'' dog
        \(n_1 + \cdots + n_30\) times this month
        where \(n_i\) is the number of jumps
        on $i$█day .
      \end{minipage}
    \end{frame}
    \end{document}

``i``, ``-th``, ``<Esc>f<Space>x`` and you're done::

    \begin{document}
    \begin{frame}{Example}
      \begin{minipage}[t]{0.4\textwidth}
        The ``QUICK'' brown fox jumped
        over the ``lazy'' dog
        \(n_1 + \cdots + n_30\) times this month
        where \(n_i\) is the number of jumps
        on $i$-th day.█
      \end{minipage}
    \end{frame}
    \end{document}

Installation
------------
Textobj-latex depends on Kana's `textobj-user`_,
so you have to install it first.

If you use Vundle_, add the following lines to your .vimrc::

    Bundle 'kana/vim-textobj-user'
    Bundle 'rbonvall/vim-textobj-latex'

and then run ``:BundleInstall`` from within Vim.

If you use Pathogen_, clone both repos in your bundle directory::

    cd ~/.vim/bundle
    git clone git://github.com/kana/vim-textobj-user
    git clone git://github.com/rbonvall/vim-textobj-latex

If you don't use either: you should.

I have included dependency information for Vim Addon Manager and Vim Flavor,
but have made no effort whatsoever to test if they work properly.

.. _textobj-user: https://github.com/kana/vim-textobj-user
.. _Vundle: https://github.com/gmarik/vundle
.. _Pathogen: https://github.com/tpope/vim-pathogen

Author
------
Roberto Bonvallet <rbonvall@gmail.com>

License
-------
Same terms as Vim itself.


