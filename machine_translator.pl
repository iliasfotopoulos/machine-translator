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
% 6 Rules (Cases)

%Special cases 11,12 | Hundreds 100,200 | Tens 10,20 | Units 1,2
el(N) --> eidikoiarithmoi(N);ekatontades(N);dekades(N);monades(N).

%Example: 128 
el(N) --> ekatontades(N1),dekades(N2),monades(N3),
{N is N1 + N2 + N3,N =\= 11, N =\= 12}.

%Example: 42
el(N) --> dekades(N1),monades(N2),
{N is N1 + N2,N =\= 11, N =\= 12}.

%Example: 140
el(N)--> ekatontades(N1),dekades(N2),
        {N is N1 + N2,N =\= 11, N =\= 12}.

%Example: 302        
el(N)--> ekatontades(N1),monades(N2),
        {N is N1 + N2,N =\= 11, N =\= 12}.

%Example 112
ell(N)--> ekatontades(N1),eidikoiarithmoi(N2),
		{N is N1 + N2,N2 =\= 100, N2 =\= 0},!.        


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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% English alphanumeric and dictionary

en(N) --> specialcases(N);hundreds(N);tens(N);units(N).

en(N)-->hundreds(N1),specialcases(N2),
{N is N1 + N2,N =\= 0},!.
en(N) --> hundreds(N1),tens(N2),units(N3),
{N is N1 + N2 + N3,N =\= 11, N =\= 12, N =\= 13, N =\= 14, N =\= 15, N =\= 16, N =\= 17, N =\= 18, N =\= 19,N2+N3=\=11,N2+N3=\=12,N2+N3=\=13,N2+N3=\=14,N2+N3=\=15,N2+N3=\=16,N2+N3=\=17,N2+N3=\=18,N2+N3=\=19}.
en(N) --> tens(N1),units(N2),
{N is N1 + N2,N =\= 11, N =\= 12, N =\= 13, N =\= 14, N =\= 15, N =\= 16, N =\= 17, N =\= 18, N =\= 19}.
en(N)-->hundreds(N1),tens(N2),
{N is N1 + N2,N =\= 11, N =\= 12, N =\= 13, N =\= 14, N =\= 15, N =\= 16, N =\= 17, N =\= 18, N =\= 19}.
en(N)-->hundreds(N1),units(N2),
{N is N1 + N2,N =\= 11, N =\= 12, N =\= 13, N =\= 14, N =\= 15, N =\= 16, N =\= 17, N =\= 18, N =\= 19}.


specialcases(N)--> zero(N);eleven(N);twelve(N);thirteen(N);fourteen(N);fifteen(N);sixteen(N);seventeen(N);eighteen(N);nineteen(N).

hundreds(N)--> onehundred(N);twohundred(N);threehundred(N);fourhundred(N);fivehundred(N);
                sixhundred(N);sevenhundred(N);eighthundred(N);ninehundred(N).

tens(N) --> ten(N);twenty(N);thirty(N);fourty(N);fifty(N);
                sixty(N);seventy(N);eighty(N);ninety(N).


units(N) --> one(N);two(N);three(N);four(N);five(N);
                six(N);seven(N);eight(N);nine(N).

zero(0) --> [zero].
one(1) --> [one].
two(2) --> [two].
three(3) --> [three].
four(4) --> [four].
five(5) --> [five].
six(6) --> [six].
seven(7) --> [seven].
eight(8) --> [eight].
nine(9) --> [nine].
ten(10) --> [ten].
eleven(11) --> [eleven].
twelve(12) --> [twelve].
thirteen(13) --> [thirteen].
fourteen(14) --> [fourteen].
fifteen(15) --> [fifteen].
sixteen(16) --> [sixteen].
seventeen(17) --> [seventeen].
eighteen(18) --> [eighteen].
nineteen(19) --> [nineteen].
twenty(20) --> [twenty].
thirty(30) --> [thirty].
fourty(40) --> [fourty].
fifty(50) --> [fifty].
sixty(60) --> [sixty].
seventy(70) --> [seventy].
eighty(80) --> [eighty].
ninety(90) --> [ninety].
onehundred(100) --> ['one hundred'].
twohundred(200) --> ['two hundred'].
threehundred(300) --> ['three hundred'].
fourhundred(400) --> ['four hundred'].
fivehundred(500) --> ['five hundred'].
sixhundred(600) --> ['six hundred'].
sevenhundred(700) --> ['seven hundred'].
eighthundred(800) --> ['eight hundred'].
ninehundred(900) --> ['nine hundred'].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%