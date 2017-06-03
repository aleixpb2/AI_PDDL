(define (domain menu)
(:requirements :typing)
(:types plato tipo dia - object
		primero segundo - plato)
		
(:predicates
	(esincompatible ?p1 - primero ?p2 - segundo)
	(esdetipo ?p - plato ?t - tipo)
	(asignadoprimero ?p1 - primero ?d - dia)
	(asignadosegundo ?p2 - segundo ?d - dia)
			
	(tieneprimero ?d - dia)
	(tienesegundo ?d - dia)
	(diacompleto ?d - dia)
    
	(diasiguiente ?d1 - dia ?d2 - dia)
	
	(platoasignado ?p - plato)
)	

(:action crearmenuDia
:parameters (?d - dia ?p1 - primero ?p2 - segundo)
:precondition (and 
        (asignadoprimero ?p1 ?d) 
        (asignadosegundo ?p2 ?d)
        )
:effect ( diacompleto ?d)
)

(:action asignarprimero
:parameters (?d - dia ?p1 - primero  ?da - dia ?p3 - primero ?t3 - tipo ?t1 - tipo)
:precondition (and 
    (not (platoasignado ?p1))
    (not (tieneprimero ?d)) 
    (esdetipo ?p1 ?t1)
    (diasiguiente ?da ?d)
    (asignadoprimero ?p3 ?da)
    (esdetipo ?p3 ?t3)
    (not (= ?t1 ?t3))    
	)
:effect (and (platoasignado ?p1) 
            (tieneprimero ?d) 
            (asignadoprimero ?p1 ?d)            
        )
)
	
(:action asignarsegundo
:parameters (?d - dia ?p1 - primero ?p2 - segundo ?da - dia ?p3 - segundo ?t3 - tipo ?t1 - tipo)
:precondition (and 
            (not (platoasignado ?p2)) 
            (not (tienesegundo ?d)) 
            (esdetipo ?p2 ?t1)
            (diasiguiente ?da ?d)
            (asignadosegundo ?p3 ?da)
            (esdetipo ?p3 ?t3)
            (not (= ?t1 ?t3)) 
            (asignadoprimero ?p1 ?d)
            (not (esincompatible ?p1 ?p2))
	)
:effect (and (platoasignado ?p2) 
            (tienesegundo ?d) 
            (asignadosegundo ?p2 ?d)            
        )
)
)
