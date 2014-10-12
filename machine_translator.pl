%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Greek Language rules

% Seperate rules for 11,12

elnum(11,[[11],11]):- !.
elnum(12,[[12],12]):- !.

% Rule for 1-9
elnum(X,[[X],X]):-
                        integer(X),X < 10,!.

% Rule for 10,20 ... 90
elnum(X,[[X],X]):-
                        integer(X),X < 100,
                        X mod 10 =:= 0,!.

% Rule for  X < 100
elnum(X,[[Y,Z],X]) :-
                                integer(X), X < 100,
                                Y is floor(X / 10) * 10, % Υ = tens
                                Z is X mod 10. % Z = units

% Rule for  X < 1000                                
elnum(X,[[N,Y,Z],X]) :-
                                integer(X), X < 1000,
                                N is floor(X / 100) * 100, % Ν = hundreds
                                Y is X mod 100-X mod 10, % Y = tens
                                Z is X mod 10. % Z = units

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% English Language rules

ennum(11,[[11],11]):- !.
ennum(12,[[12],12]):- !.
ennum(13,[[13],13]):- !.
ennum(14,[[14],14]):- !.
ennum(15,[[15],15]):- !.
ennum(16,[[16],16]):- !.
ennum(17,[[17],17]):- !.
ennum(18,[[18],18]):- !.
ennum(19,[[19],19]):- !.

% Rule for 1-9
ennum(X,[[X],X]):-
                        integer(X),X < 10,!.

% Rule for 10,20 ... 90
ennum(X,[[X],X]):-
                        integer(X),X < 100,
                        X mod 10 =:= 0,!.

% Rule for  X < 100
ennum(X,[[Y,Z],X]) :-
                                integer(X), X < 100,
                                Y is floor(X / 10) * 10, % Υ = tens
                                Z is X mod 10. % Z = units

% Rule for  X < 1000                                
ennum(X,[[N,Y,Z],X]) :-
                                integer(X), X < 1000,
                                N is floor(X / 100) * 100, % Ν = hundreds
                                Y is X mod 100-X mod 10, % Y = tens
                                Z is X mod 10. % Z = units

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Greek alphanumeric and dictionary

el(N) --> eidikoiarithmoi(N);ekatontades(N);dekades(N);monades(N).
el(N) --> ekatontades(N1),dekades(N2),monades(N3),
{N is N1 + N2 + N3,N =\= 11, N =\= 12}.
el(N) --> dekades(N1),monades(N2),
{N is N1 + N2,N =\= 11, N =\= 12}.
el(N)--> ekatontades(N1),dekades(N2),
        {N is N1 + N2,N =\= 11, N =\= 12}.
el(N)--> ekatontades(N1),monades(N2),
        {N is N1 + N2,N =\= 11, N =\= 12}.


eidikoiarithmoi(N)--> mhden(N);enteka(N);dwdeka(N);ekato(N).

ekatontades(N)--> ekaton(N);diakosia(N);triakosia(N);tetrakosia(N);pentakosia(N);
                exakosia(N);eftakosia(N);oktakosia(N);enniakosia(N).

dekades(N) --> deka(N);eikosi(N);trianta(N);saranta(N);penhnta(N);
                exhnta(N);ebdomhnta(N);ogdonta(N);ennenhnta(N).


monades(N) --> ena(N);duo(N);tria(N);tessera(N);pente(N);
                exi(N);efta(N);oktw(N);ennia(N).

mhden(0) --> [μηδέν].
ena(1) --> [ένα].
duo(2) --> [δύο].
tria(3) --> [τρία].
tessera(4) --> [τέσσερα].
pente(5) --> [πέντε].
exi(6) --> [έξι].
efta(7) --> [εφτά].
oktw(8) --> [οχτώ].
ennia(9) --> [εννιά].
deka(10) --> [δέκα].
enteka(11) --> [έντεκα].
dwdeka(12) --> [δώδεκα].
eikosi(20) --> [είκοσι].
trianta(30) --> [τριάντα].
saranta(40) --> [σαράντα].
penhnta(50) --> [πενήντα].
exhnta(60) --> [εξήντα].
ebdomhnta(70) --> [εβδομήντα].
ogdonta(80) --> [ογδόντα].
ennenhnta(90) --> [ενενήντα].
ekato(100)--> [εκατό].
ekaton(100) --> [εκατόν].
diakosia(200) --> [διακόσια].
triakosia(300) --> [τριακόσια].
tetrakosia(400) --> [τετρακόσια].
pentakosia(500) --> [πεντακόσια].
exakosia(600) --> [εξακόσια].
eftakosia(700) --> [εφτακόσια].
oktakosia(800) --> [οχτακόσια].
enniakosia(900) --> [εννιακόσια].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%