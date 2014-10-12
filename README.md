# Machine Translator

Machine translation of numbers (in words) from greek to english and vice versa using Prolog for [NTUA](http://www.ece.ntua.gr/en) Knowledge Representation and Reasoning Course.

## Assignment summary

Goal of the assignment is to translate numbers (written in words) from a natural language to another.

### For example

* Ελληνικά: εκατό, ενενήντα τρία, εξακόσια δώδεκα, ...
* Αγγλικά: a hundred, ninety three, six hundred twelve, ...
* Γαλλικά: cent, quatre vingt treize, six cents douze, ...
* Γερμανικά: ein Hundert, drei und neunzig, sechs Hundert zwoelf, ...

### Natural Language Parser

Design a natural language machine translator that takes as input a number from zero to nine hundred and ninety-nine in a Language A and translates it to an other Language B and vice versa.

#### Examples

* εκατό => a hundred, ein Hundert
* treize, quatorze, quinze ... => δέκα τρία, δέκα τέσσερα, δέκα πέντε
* thirteen, fourteen, fifteen ... => δέκα τρία, δέκα τέσσερα, δέκα πέντε
* ογδόντα => quatre vingt
* ενενήντα => quatre vingt dix
* εξακόσια => six hundred

## Programming Enviroment

Usage of DCG (definite clause grammar), using [GULP 3.1](http://www.cs.toronto.edu/~dianaz/2501/Parser/gulp3mod.pl) Prolog extension for Unification-Based Grammar.