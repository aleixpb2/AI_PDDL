(define (problem p1) (:domain menu)
(:objects
    d0 lunes martes miercoles jueves viernes - dia
	fideua paella sopa_pescado macarrones_bolognesa ensalada canelones risotto crema_verduras ensalada_alemana espinacas platovaciop - primero
	bistec langostinos albondigas_con_patata fabada salmon hamburguesa quiche tortilla_espinacas bacalao_con_samfaina pizza platovacios - segundo 
	
	sopa estofado carne pescado verdura tipovacio pasta - tipo
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
		(esincompatible canelones bistec)
		
		(diasiguiente d0 lunes)
		(diasiguiente lunes martes)
		(diasiguiente martes miercoles)
		(diasiguiente miercoles jueves)
		(diasiguiente jueves viernes)
		(diasiguiente viernes d0)
		
		(esdetipo fideua pasta)
		(esdetipo paella pasta)
		(esdetipo sopa_pescado sopa)
		(esdetipo macarrones_bolognesa pasta)
		(esdetipo ensalada verdura)
		(esdetipo canelones pasta)
		(esdetipo risotto pasta)
		(esdetipo crema_verduras verdura)		
		(esdetipo ensalada_alemana verdura)
		(esdetipo espinacas verdura)
		
		(esdetipo bistec carne)
		(esdetipo langostinos pescado)
		(esdetipo albondigas_con_patata carne)
		(esdetipo fabada verdura)
		(esdetipo salmon pescado)
		(esdetipo hamburguesa carne)
		(esdetipo quiche pasta)
		(esdetipo tortilla_espinacas verdura)		
		(esdetipo bacalao_con_samfaina pescado)
		(esdetipo pizza pasta)		
		
		(esdetipo platovaciop tipovacio)
		(esdetipo platovacios tipovacio)
		
		;; Platos obligados, extension 3
		(asignadoprimero paella jueves)
		(tieneprimero jueves)
		(platoasignado paella)
        
        (asignadosegundo hamburguesa martes)
		(tienesegundo martes)
		(platoasignado hamburguesa)
		;;;;;
        
		(asignadoprimero platovaciop d0)
		(asignadosegundo platovacios d0)
        (tieneprimero d0)
        (tienesegundo d0)
		(platoasignado platovaciop)
		(platoasignado platovacios)		
)

(:goal ( and (diacompleto lunes) (diacompleto martes) (diacompleto miercoles) (diacompleto jueves) (diacompleto viernes)
         )
)

)
