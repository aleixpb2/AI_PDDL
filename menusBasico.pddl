(define (domain menu)
(:requirements :typing)
(:types plato dia - object
		primero segundo - plato)
		
(:predicates
	(esincompatible ?p1 - primero ?p2 - segundo)
	(asignadoprimero ?p1 - primero ?d - dia)
	(asignadosegundo ?p2 - segundo ?d - dia)		
	
	(tieneprimero ?d - dia)
	(tienesegundo ?d - dia)
	(diacompleto ?d - dia)
)

(:action crearmenuDia
:parameters (?d - dia ?p1 - primero ?p2 - segundo)
:precondition (and 
        (asignadoprimero ?p1 ?d) 
        (asignadosegundo ?p2 ?d)
        )
:effect ( diacompleto ?d )
)

(:action asignarprimero
:parameters (?d - dia ?p1 - primero)
:precondition (not (tieneprimero ?d))        
:effect (and 
            (tieneprimero ?d) 
            (asignadoprimero ?p1 ?d)             
        )
)

(:action asignarsegundo
:parameters (?d - dia ?p1 - primero ?p2 - segundo)
:precondition (and
            (not (tienesegundo ?d)) 
            (asignadoprimero ?p1 ?d)
            (not (esincompatible ?p1 ?p2))
	)
:effect (and
            (tienesegundo ?d) 
            (asignadosegundo ?p2 ?d)            
        )
)
)
