textobj-latex — Vim text objects for LaTeX code
===============================================

This plugin provides text objects for common LaTeX stuff that are not
conveniently described by builtin Vim text objects.

Currently supported text objects are:

=== === ================================================
a   i   Description
--- --- ------------------------------------------------
a\\ i\\ Inline math surrounded by ``\\(`` and ``\\)``.
a$  i$  Inline math surrounded by dollar signs.
aq  iq  Single-quoted text ``\`like this'``.
aQ  iQ  Double-quoted text ``\``like this''``.
ae  ie  Environment ``\begin{...}–\end{...}``
=== === ================================================

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


