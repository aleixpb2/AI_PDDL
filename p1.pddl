(define (problem p1) (:domain menu)
(:objects
    d0 lunes martes miercoles jueves viernes - dia
	p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 - primero
	s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - segundo 
	sopa estofado carne - tipo
	ca1 - calorias
	preci1 - precio
)
(:init
		(esincompatible p1 s4)
		(esincompatible p2 s7)
		(esincompatible p4 s1)
		(esincompatible p5 s4)
		
		
		(diasiguiente d0 lunes)
		(diasiguiente lunes martes)
		(diasiguiente martes miercoles)
		(diasiguiente miercoles jueves)
		(diasiguiente jueves viernes)
		(diasiguiente viernes d0)
		
		;;; todo : asignar a cada plato su tipo


)

(:goal ( and (tieneprimero lunes) (tieneprimero martes) (tieneprimero miercoles) (tieneprimero jueves) (tieneprimero viernes))

)

)