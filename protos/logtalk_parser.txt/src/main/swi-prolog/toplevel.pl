
:- use_module(library(clpfd)).
:- use_module(term_algebra).

%todo catches
build_process_tree( ProcessTree ) :-
    repeat,
    unprocessed_node( ProcessTree, Beta )-> true; ignore(fail),
    relevant_ancestors( Ancestors, Beta ),
    found_in_ancestors( Ancestors, Beta, Alpha ) -> true; produce(Beta),
    equivalent( Alpha, Beta ) ->
        fold(ProcessTree, Alpha, Beta)
        ;
        (context(Alpha, ContextA),
        context( Beta, ContextB )),
    more_restrictive_than( ContextA, ContextB )->
        (replace_node( ProcessTree, Alpha, ChildNode ),
        context(ChildNode, true))%fixme
        ;
    instance_of( Alpha, Beta ) ->
        make_abstraction( ProcessTree, Beta, Alpha )
        ;
    incommensurable( ProcessTree, Beta )->
        split( ProcessTree, Beta )
        ;
        make_abstraction( ProcessTree, Alpha, Beta ),
    fail.

unprocessed_node( ProcessTree, Beta ) :-
    unprocessed_nodes( ProcessTree, Nodes),
    Nodes == [] -> fail.%fixme
