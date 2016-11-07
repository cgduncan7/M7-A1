M7 ASSIGNMENT README
====================

Rules to execute:
 - path(Start,End,Path). // Returns a list of nodes traversed that results in an undirected path from Start to End.
 - path_d(Start,End,Path). // Returns a list of nodes traversed that results in a directed path from Start to End.

Example usage:
 - path(a,c,Path). // Path = [a, b, c].
 - path(c,a,Path). // Path = [c, b, a].
 - path_d(a,c,Path). // Path = [a, b, c].
 - path_d(c,a,Path). // false.
