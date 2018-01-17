:- dynamic('$option'/1).
:- dynamic('$query_succedee'/1).
:- private('$option'/1).
:- private('$query_succedee'/1).

%
'$loop' :-
    repeat,
    read_query(Query, Bindings, ExpandedBindings),
    answer_query(Query, Bindings, ExpandedBindingsy),
    fail.

%
read_query(Query, Bindings, ExpandedBindings) :-
	write("|?- "),
	current_input(Stream),
	options(Options),
    read_term(Stream, Term, Options),
	expand_goal(Term, Query, Bindings, ExpandedBindings).

%
answer_query(Query, Bindings, ExpandedBindingsy):-
    more_solutions(Query, Bindings, ExpandedBindings ),

%
more_solutions(Query, Bindings, ExpandedBindings ):-
    succeded_once_or_more(Query, Bindings, ExpandedBindings ).
			
%
options(Options) :-
%	cached(Options),
	findall(Option, '$option'(Option), Options),
	option(allow_list_as_functor_args, true),
	option(allow_anyterm_as_functor, true).




