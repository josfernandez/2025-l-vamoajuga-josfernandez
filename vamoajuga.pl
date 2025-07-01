% Predicados
persona(maria, empleado, ventas).
persona(juan, cadete, ventas).
persona(roque, pasante, ventas).

persona(nora, empleado, compras).
persona(pedro, cadete, compras).

persona(felipe, empleado, administracion).
persona(hugo, empleado, administracion).
persona(ana, cadete, administracion).

trabajaen(Persona, Departamento):-
    persona(Persona,_,Departamento).

mismodepto(Persona1,Persona2):-
    persona(Persona1,_,Departamento),
    persona(Persona2,_,Departamento),
    Persona1 \= Persona2. 

superior(empleado,cadete).
superior(cadete,pasante).
superior(empleado,pasante).

puededarordenes(Persona1,APersona2):-
    persona(Persona1,Cargo1,Depto),
    persona(APersona2,Cargo2,Depto),
    superior(Cargo1,Cargo2).

sellevan(Persona1,Persona2):-
    mismodepto(Persona1,Persona2),
    \+ puededarordenes(Persona1,Persona2),
    \+ puededarordenes(Persona2,Persona1).

:- begin_tests(programa).

% Tests del punto 3: puededarordenes
test(si_le_puede_dar_ordenes) :-
    puededarordenes(maria, juan),       % empleada > cadete
    puededarordenes(maria, roque),    % empleada > pasante
    puededarordenes(juan, roque).     % cadete > pasante

test(no_le_puede_dar_ordenes) :-
    \+ puededarordenes(roque, maria), % pasante no puede mandar a empleada
    \+ puededarordenes(felipe, hugo), % mismo cargo
    \+ puededarordenes(ana, felipe).  % cadete no puede mandar a empleado

% Tests del punto 4: sellevan
test(se_llevan_bien) :-
    sellevan(felipe, hugo),       % mismo cargo
    sellevan(juan, roque).        % ninguno puede dar órdenes al otro

test(no_se_llevan_bien) :-
    \+ sellevan(maria, juan),     % maria sí puede dar órdenes a juan
    \+ sellevan(nora, pedro),     % nora sí puede dar órdenes a pedro
    \+ sellevan(roque, nora).     % distintos departamentos

:- end_tests(programa).
