# psc4j8-8
Perfect Super(vised) Compiler for Java 8 (target & source) is the source-to-source optimizer for Java 8 programs. 
The super-compiler source language is the same as the target's one. Such a condition is hold for the some reasons (self-application, etc.).
This project is unrelated but slightly inspired by the project described in www.supercompilers.ru as well as the last (but not least) scpj.
The algorithms are using in this supercompiler follow the classical super-compilation algorithms (V. Turchin et al.) as much as possible. The 'Perfect' word doesn't mean 'excellent' but it specifies the kind of information gathering by the program. The most of supercompilation algorithms are 'Positive' i.e. take into account the positive data about transformed program (var-to-value mappings, substitutions or equalities). Perfect supercompiler uses both positive and negative data(equalities and disequalities i.e. constraints). So, we have to maintain the constraint system (constraint satisfaction, constraint solving).
Perfect super-compilation is described in (Sorensen et al.).
