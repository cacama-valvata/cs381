/***************************************/
%     CS 381 - Programming Lab #5       %
%                                       %
%  Casey Colley                         %
%  colleyc@oregonstate.edu              %
%                                       %
/***************************************/

% load family tree
:- consult('royal.pl').

% enables piping in tests
portray(Term) :- atom(Term), format("~s", Term).


% ugh

mother(M,C):- parent(M,C), female(M).

father(F,C):- parent(F,C), male(F).

spouse(P,Q):- married(P,Q); married(Q,P).

child(C,P):- parent(P,C).

son(S,P):- child(S,P), male(S).

daughter(D,P):- child(D,P), female(D).

sibling(S,T):- parent(Y,S), parent(Y,T).

brother(B,C):- sibling(B,C), male(B).

sister(S,C):- sibling(S,C), female(S).

uncle(U,C):- parent(Y,C), brother(U,Y).
uncle(U,C):- parent(Y,C), sibling(Z,Y), spouse(U,Z), male(U).

aunt(A,C):- parent(Y,C), sister(A,Y).
aunt(A,C):- parent(Y,C), sibling(Z,Y), spouse(A,Z), female(A).

grandparent(G,C):- parent(Y,C), parent(G,Y).

grandfather(G,C):- grandparent(G,C), male(G).

grandmother(G,C):- grandparent(G,C), female(G).

grandchild(C,G):- child(C,Y), child(Y,G).
