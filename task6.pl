/*
5
Сформировать списки [1, 3, 5, 7, 9] и [2, 4, б, 8, 10] и объединить их в один. 
*/

append([], L, L).
append([H | T1], L2, [H | Res]):- append(T1, L2, Res).

genl(N2, N2, []):- !.
genl(N1, N2, [N1 | L]):- N1 < N2, N is N1 + 2, genl(N, N2, L).
merge(Res):- genl(1, 11, L1), genl(2, 12, L2), append(L1, L2, Res).

?- merge(Res), print(Res), nl.

/*
11
Сформировать список из N последовательных натуральных чисел, начиная с 10. Найти
сумму его элементов .
*/

genNat(0, _, []).
genNat(N, Cur, [Cur | Rest]):- N > 0
                             , Next is Cur + 1
                             , N1 is N - 1
                             , genNat(N1, Next, Rest).
genNatList(N, List):- genNat(N, 10, List).

listSum([], 0):- !.
listSum([Cur | L], Sum):- listSum(L, LSum), Sum is Cur + LSum.
listSum(L):- listSum(L, Sum), print(Sum).

genNatSum(N):- genNatList(N, L), listSum(L, Sum), print(Sum).

?- genNatSum(1), nl.
?- genNatSum(3), nl.
?- genNatSum(5), nl.

/*
3
Определить произведение элементов списка.
*/

listProd([], 1):- !.
listProd([Cur | L], Res):- listProd(L, LRes), Res is Cur * LRes.
listProd([]):- print(0), !.
listProd(L):- listProd(L, Res), print(Res), !.

?- listProd([1, 2, 3]), nl.
?- listProd([]), nl.
?- listProd([0, 1, 3, 5]), nl.
?- listProd([10, 1, 3, 5]), nl.

/*
9
Определить отношение разбиение_списка(Список, Список1, Список2) так, чтобы оно
распределяло элементы списка между двумя списками Список1 и Список2, длины
которых отличаются друг от друга не более чем на единицу.
*/

разбиение_списка([], [], []):- !.
разбиение_списка([X], [X], []):- !.
разбиение_списка([X, Y | T], [X | L1], [Y | L2]):- разбиение_списка(T, L1, L2).
разбиение_списка([X | T], [X | L1], L2):- разбиение_списка(T, L1, L2).

?- разбиение_списка([1, 2, 3, 4, 5], Список1, Список2), print(Список1), nl
                                                      , print(Список2), nl.

?- разбиение_списка([1, 2, 3, 4], Список1, Список2), print(Список1), nl
                                                   , print(Список2), nl.

