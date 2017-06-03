;;TODO : BORRAR TIENE PRIMERO Y tienesegundo
;; ./ff-metric -o AI_PDDL-master/menus.pddl -f AI_PDDL-master/p1.pddl | grep "CREARMENUDIA"
;; TODO: jocs de prova. Numeros de precio i calorias realistes
;; TODO: Comprovar minimize

(define (domain menu)
(:requirements :typing :strips :adl :fluents)
(:types plato tipo dia - object
		primero segundo - plato)
		
(:functions
    (caloriasP ?p - plato)
    (precioP ?p - plato)
    (minCal)
    (maxCal)
	(precioTotal)	
)
		
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
        (>= (+ (caloriasP ?p1) (caloriasP ?p2)) (minCal))
        (<= (+ (caloriasP ?p1) (caloriasP ?p2)) (maxCal))
        )
:effect ( and (diacompleto ?d)         
         (increase (precioTotal) (+ (precioP ?p1) (precioP ?p2) ) )
        )
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
