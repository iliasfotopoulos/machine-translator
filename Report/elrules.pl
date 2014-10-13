% 9 Rules (Cases)

% Special cases 11,12 | Hundreds 100,200 | Tens 10,20 | Units 1,2
el(N) --> eidikoiarithmoi(N);ekatontades(N);dekades(N);monades(N).

% Example: 128 
el(N) --> ekatontades(N1),dekades(N2),monades(N3),
{N is N1 + N2 + N3,N =\= 11, N =\= 12}.

% Example: 42
el(N) --> dekades(N1),monades(N2),
{N is N1 + N2,N =\= 11, N =\= 12}.

% Example: 140
el(N)--> ekatontades(N1),dekades(N2),
        {N is N1 + N2,N =\= 11, N =\= 12}.

% Example: 302        
el(N)--> ekatontades(N1),monades(N2),
        {N is N1 + N2,N =\= 11, N =\= 12}.

% Example 112
el(N)--> ekatontades(N1),eidikoiarithmoi(N2),
		{N is N1 + N2,N2 =\= 100, N2 =\= 0},!.  
