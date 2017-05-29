(define (problem p1) (:domain menu)
(:objects
    d0 lunes martes miercoles jueves viernes - dia
	fideua paella sopa_pescado macarrones_bolognesa ensalada canelones risotto crema_verduras ensalada_alemana espinacas - primero
	bistec langostinos albondigas_con_patata fabada salmon hamburguesa quiche tortilla_espinacas bacalao_con_samfaina pizza - segundo 
	sopa estofado carne pescado - tipo
	ca1 - calorias
	preci1 - precio
)
(:init
		(esincompatible fideua fabada)
		(esincompatible paella langostinos)
		(esincompatible sopa_pescado salmon)
		(esincompatible ensalada_alemana albondigas_con_patata)
		
		
		(diasiguiente d0 lunes)
		(diasiguiente lunes martes)
		(diasiguiente martes miercoles)
		(diasiguiente miercoles jueves)
		(diasiguiente jueves viernes)
		(diasiguiente viernes d0)
		
		;;; todo : asignar a cada plato su tipo


)

(:goal ( and (tieneprimero lunes) (tieneprimero martes) (tieneprimero miercoles) (tieneprimero jueves) (tieneprimero viernes) (tienesegundo lunes) (tienesegundo martes) (tienesegundo miercoles) (tienesegundo jueves) (tienesegundo viernes))

)

)