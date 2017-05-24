(define (problem p1) (:domain menu)
(:objects
    d0 d1 d2 d3 d4 d5 - dia
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
		
		
		(diasiguiente d0 d1)
		(diasiguiente d1 d2)
		(diasiguiente d2 d3)
		(diasiguiente d3 d4)
		(diasiguiente d4 d5)
		(diasiguiente d5 d0)


)

(:goal ( and (tieneprimero d1) (tieneprimero d2) (tieneprimero d3) (tieneprimero d4) (tieneprimero d5))

)

)