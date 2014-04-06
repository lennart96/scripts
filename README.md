scripts
=======

```
shrc:      usable as both .bashrc and .zshrc
cross:     contains makefile for gcc-cross-compiler
           usage: cd cross; make TARGET=x86_64-elf
con.sh:    parallel task spawning
           usage: sh cons.sh sleep 1 2 3 4 # sleeps 4 seconds on 4+ core system
```
