-module(recursive).
-export([fac/1, len/1, tail_fac/1, tail_len/1, duplicate/2, tail_duplicate/2, reverse/1, tail_reverse/1, sublist/2,
         tail_sublist/2, zip/2, tail_zip/2]).

fac(0) -> 1;
fac(N) -> N*fac(N-1).

tail_fac(N) -> tail_fac(N, 1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N-1, N * Acc).

len([]) -> 0;
len([_|T]) -> 1 + len(T).

tail_len(L) -> tail_len(L, 0).

tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T,Acc+1).

duplicate(0, _) -> [];
duplicate(N, Term) when N > 0 -> [Term | duplicate(N-1, Term)].

tail_duplicate(N, Term) -> tail_duplicate(N, Term, []).

tail_duplicate(0, _, List) -> List;
tail_duplicate(N, Term, List) when N > 0-> tail_duplicate(N-1, Term, [Term|List]).

reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H].

tail_reverse([H|T]) -> tail_reverse([H|T], []).

tail_reverse([], List) -> List;
tail_reverse([H|T], List) -> tail_reverse(T, [H|List]).

sublist(_, 0) -> [];
sublist([], _) -> [];
sublist([H|T], N) when N > 0 -> [H | sublist(T, N-1)].

tail_sublist(L, N) -> reverse(tail_sublist(L, N, [])).

tail_sublist(_, 0, Result) -> Result;
tail_sublist([], _, Result) -> Result;
tail_sublist([H|T], N, Result) when N > 0 -> tail_sublist(T, N-1, [H | Result]).

zip([], _) -> [];
zip(_, []) -> [];
zip([H1|T1], [H2|T2]) -> [{H1, H2} | zip(T1, T2)].

tail_zip(L1, L2) -> reverse(tail_zip(L1, L2, [])).

tail_zip([], _, Acc) -> Acc;
tail_zip(_, [], Acc) -> Acc;
tail_zip([H1|T1], [H2|T2], Acc) -> tail_zip(T1, T2, [{H1, H2} | Acc]).
