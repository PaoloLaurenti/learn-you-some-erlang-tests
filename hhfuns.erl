-module(hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X, Y) -> X() + Y().

increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H-1|decrement(T)].

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F, T)].

incr(X) -> X + 1.
decr(X) -> X - 1.

%% only keep even numbers
even([], Acc) -> Acc;
even([H|T], Acc) when H rem 2 =:= 0 ->
  even(T, [H|Acc]);
even([_|T], Acc) ->
  even(T, Acc).

even(L) -> lists:reverse(even(L, [])).

%% only keep men older than 60
old_men([], Acc) -> Acc;
old_men([Person = {male, Age}|People], Acc) when Age > 60 ->
  old_men(People, [Person|Acc]);
old_men([_|People], Acc) ->
  old_men(People, Acc).

old_men(L) -> lists:reverse(old_men(L, [])).

filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
  case Pred(H) of
    true -> filter(Pred, T, [H|Acc]);
    false -> filter(Pred, T, Acc)
  end.

filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).
