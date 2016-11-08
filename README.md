M7 ASSIGNMENT README
====================

Rules to execute:
 - connection(Start,End,Path). // Returns a list of nodes traversed that results in an undirected path from Start to End.
 - path_d(Start,End,Path). // Returns a list of nodes traversed that results in a directed path from Start to End.

Example usage:
 - path(a,c). // Outputs a connects to c via path [a, b, c]. 
 - connection(a,c,Path). // Path = [a, b, c].
 - connection(c,a,Path). // Path = [c, b, a].
 - path_d(a,c,Path). // Path = [a, b, c].
 - path_d(c,a,Path). // false.
