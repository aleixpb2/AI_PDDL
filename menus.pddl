(define (domain menu)
(:requirements :typing :strips :adl)
(:types plato tipo dia calorias precio - object
		primero segundo - plato)
(:predicates
	(esincompatible ?p1 - primero ?p2 - segundo)
	(esdetipo ?p - plato ?t - tipo)
	(tieneprecio ?p - plato ?pr - precio)
	(tienecal ?p - plato ?c - calorias)
	(asignadoprimero ?p1 - primero ?d - dia)
	(asignadosegundo ?p2 - segundo ?d - dia)
	
	
	
	(tieneprimero ?d - dia)
	(tienesegundo ?d - dia)
	(diacompleto ?d - dia)
	(diasiguiente ?d1 - dia ?d2 - dia) ;; dia centinela
	
	(platoasignado ?p - plato)
)	


(:action asignarprimero
:parameters (?p1 - primero ?d - dia ?p2 - segundo)
:precondition (and (not (platoasignado ?p1)) (not (tieneprimero ?d)) 
	(imply ( and (tienesegundo ?d) (asignadosegundo ?p2 ?d)) (not (esincompatible ?p1 ?p2)))
	;;TO-DO: mirar dias consecutivos con mismo tipo plato
	)
:effect (and (platoasignado ?p1) (tieneprimero ?d) (asignadoprimero ?p1 ?d));; (imply (tienesegundo ?d) (diacompleto ?d)) )

)
	
(:action asignarsegundo
:parameters (?p2 - segundo ?d - dia ?p1 - primero)
:precondition (and (not (platoasignado ?p2)) (not (tienesegundo ?d)) 
	(imply ( and (tieneprimero ?d) (asignadoprimero ?p1 ?d)) (not (esincompatible ?p1 ?p2)))
	;;TO-DO: mirar dias consecutivos con mismo tipo plato
	)
:effect (and (platoasignado ?p2) (tienesegundo ?d) (asignadosegundo ?p2 ?d));; (imply (tieneprimero ?d) (diacompleto ?d)))

)

)
