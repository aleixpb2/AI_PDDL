(define (problem p1) (:domain menu)
(:objects
    lunes martes miercoles jueves viernes - dia
	fideua paella sopa_pescado macarrones_bolognesa ensalada canelones risotto crema_verduras ensalada_alemana espinacas platovaciop - primero
	bistec langostinos albondigas_con_patata fabada salmon hamburguesa quiche tortilla_espinacas bacalao_con_samfaina pizza platovacios - segundo 
)
(:init
		(esincompatible fideua bistec)
		(esincompatible fideua langostinos)
		(esincompatible fideua fabada)
		(esincompatible fideua salmon)
		(esincompatible fideua hamburguesa)
		(esincompatible fideua quiche)
		(esincompatible fideua tortilla_espinacas)
		(esincompatible fideua bacalao_con_samfaina)
		(esincompatible paella langostinos)
		(esincompatible paella salmon)
		(esincompatible sopa_pescado salmon)
		(esincompatible ensalada_alemana albondigas_con_patata)
)

(:goal ( and (diacompleto lunes) (diacompleto martes) (diacompleto miercoles) (diacompleto jueves) (diacompleto viernes)
        )
)

)
