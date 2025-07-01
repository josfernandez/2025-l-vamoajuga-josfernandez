% Predicados
% genero(Juego, Genero)
genero(fortnite, battleRoyale).
genero(minecraft, sandbox).
genero(amongUs, party).
genero(genshinImpact, rpg).
genero(callOfDuty, fps).
genero(apexLegends, battleRoyale).
genero(roblox, sandbox).
genero(fifa, deportes).
genero(valorant, fps).
genero(lol, moba).
genero(dota, moba).

% juega(Persona, Juego).
juega(tom, lol).
juega(naza, lol).
juega(cande, lol).
juega(rocio, lol).
juega(naza, minecraft).
juega(tito, minecraft).
juega(santi, minecraft).
juega(cande, minecraft).
juega(rocio, minecraft).
juega(rocio, roblox).
juega(santi, fifa).
juega(rocio, fifa).

juegoDelPueblo(Juego):-forall(juega(Persona,_), juega(Persona,Juego)).

amaElLol(Persona):-forall(juega(Persona,Juego),Juego = lol).

tienearmas(battleRoyale).
tienearmas(party).
tienearmas(rpg).
tienearmas(fps).

pacifista(Persona):-forall(juega(Persona,Juego),(genero(Juego,Genero), \+ tienearmas(Genero))).

monotematica(Persona):-
    juega(Persona,Juego),%tengo los juegos de esa persona
    genero(Juego,Genero),%tengo los generos que juega esa persona
    forall(juega(Persona,Juego2),(genero(Juego2,Genero))).%tengo los juegos de esa persona, y por cada juego chequeo que he


:- begin_tests(monotematica).

% Persona que juega solo juegos del mismo género 
test(monotematica_Verdadero) :-
    monotematica(tom).

% Persona que juega juegos de géneros distintos
test(monotematica_Falso) :-
    \+ monotematica(rocio). 

:- end_tests(monotematica).