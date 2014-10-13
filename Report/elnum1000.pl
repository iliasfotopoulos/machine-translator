% Rule for  X < 1000                                
elnum(X,[[N,Y,Z],X]) :-
                                integer(X), X < 1000,
                                N is floor(X / 100) * 100, % Ν = hundreds
                                Y is X mod 100-X mod 10, % Y = tens
                                Z is X mod 10. % Z = units
