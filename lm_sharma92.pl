:-[bigram_sharma92.pl].
:-[unigram_sharma92.pl].

V is 15294.

calc_prob(ListOfWords,SmoothedLog10Probability):- calc_prob(ListOfWords,0,SmoothedLog10Probability).

calc_prob([], N1, N).
calc_prob([A, B|L], Ntemp, N) :-
bigram(X, A, B), unigram(Y, A),
P is log10((X+1)/(Y + V)),
N_next is P + Ntemp,
CalcLength(L, Result),
Result -> calc_prob(L, N_next, N), write(Nnext); calc_prob([B|L], N_next, N).


CalcLength(L, Empty) :-
length(L, Len),
(   Len == 0
->  Empty = true
;   Empty = false
).
