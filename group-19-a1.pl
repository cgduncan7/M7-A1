/**
 * LINK FACTS
 */

link(a,b).
link(b,p).
link(b,c).
link(c,d).
link(d,q).
link(d,r).

/**
 * HELPER RULES
 */

/* makes solution for an undirected graph */
linked(X,Y) :- link(X,Y) ; link(Y,X).

/* simple rule to append arrays */
append([],X,X).
append([X|Y],Z,[X|W]) :- append(Y,Z,W).

/* simple rule to check if X is within [Y|T] */
in(X, [Y|T]) :- X = Y ; in(X,T).


/**
 * ASSIGNMENT RULES
 */

/**
 * Path takes in a start node X, an end node Y, and a placeholder variable which will contain the list of nodes
 * traversed if a path exists from X to Y. This rule calls the visit rule with the given inputs/outputs and
 * returns the result in P.
 */
path(X,Y,P) :- 
	visit(X,Y,[X],P).

/** 
 *  Visit takes a start, end, visited list, and output variable (P). Visit then finds all links from the start
 *  node to an intermediary node, X. Visit then checks to make sure that the intermediary node X is not equal
 *  to the end node of the path, and that it has not been visited already. After that, it performs recursive
 *  calls until the base case (below) is reached. The base case is reached when X == E.
 *  
 *  S = start
 *  E = end
 *  V = visited
 *  P = path
 */
visit(S,E,V,P) :-
	linked(S,X),
	X \== E,		/* falls through to base case if true */
	not(in(X,V)),
	append([],[X],T),
	append(V,T,Q),
	visit(X,E,Q,P).

/** 
 *  Base case for visit... if S <--> E then set the path (final parameter) to be the list of visited nodes where
 *  the new head is the final end node.
 *  S = start
 *  E = end
 *  P = visited nodes
 *  [E|P] = list with End appended to visited nodes.
 */
visit(S,E,P,F) :-
	linked(S,E),
	append(P,[E],F).

/**
 * Below are the same definitions but for a directed graph! The only difference is the rule linked was switched
 * back to the individual facts which restricts linkage to directional linkage only.
 */
path_d(X,Y,P) :-
	visit_d(X,Y,[X],P).

visit_d(S,E,V,P) :-
	link(S,X),
	X \== E,
	not(in(X,V)),
	append([],[X],T),
	append(V,T,Q),
	visit_d(X,E,Q,P).

visit_d(S,E,P,Q) :-
	link(S,E),
	append(P,[E],Q).


