% Main Functions

% Number to Greek
greeknum(X,Y) :-
                elnum(X,[_,Z]),
                el(Z,Y,[]).

% Number to English
englishnum(X,Y) :-
                ennum(X,[_,Z]),
                en(Z,Y,[]).

% Greek to Number
greekalpha(Y,X) :-
                el(Z,Y,[]),
                elnum(X,[_,Z]).


% English to Number
englishalpha(Y,X) :-
                en(Z,Y,[]),
                ennum(X,[_,Z]).

% Translate from Greek to English
translategreek(Y,Z) :-
                greekalpha(Y,X),
                englishnum(X,Z),
                write('Το νούμερο'),write(Y),write('στα αγγλικά είναι:').

% Translate from English to Greek
translateenglish(Y,Z) :-
	       		englishalpha(Y,X),
                greeknum(X,Z),
                write('The number'),write(Y),write('in Greek is:').
