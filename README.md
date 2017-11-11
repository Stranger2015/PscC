# PscC
Perfect Super(vised) Compiler collection is the container of the source-to-source optimizers. 
The super-compiler source language is the same as the target's one. This condition is hold for the some reasons (self-application, etc.).

The algorithms are used by this supercompiler follow the classical super-compilation algorithms (V. Turchin et al.) as much as possible.
The 'Perfect' word doesn't mean 'excellent' but ithis specifies the kind of information gathering by the program. 
The most of supercompilation algorithms are 'Positive' i.e. they take into account the positive data about transformed program (var-to-value mappings, substitutions, or equalities).

Perfect supercompiler uses both positive and negative data ( equalities and disequalities i.e. constraints ). So, in this case we have to maintain constraint system.

Perfect supercompilation is described in (Sorensen et al.).
