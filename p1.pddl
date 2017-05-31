(define (problem p1) (:domain menu)
(:objects
    d0 lunes martes miercoles jueves viernes - dia
	fideua paella sopa_pescado macarrones_bolognesa ensalada canelones risotto crema_verduras ensalada_alemana espinacas platovaciop - primero
	bistec langostinos albondigas_con_patata fabada salmon hamburguesa quiche tortilla_espinacas bacalao_con_samfaina pizza platovacios - segundo 
	
	sopa estofado carne pescado verdura tipovacio pasta - tipo
	ca1 - calorias
	preci1 - precio
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
		
		;;;
		(asignadoprimero paella jueves)
		(tieneprimero jueves)
		(platoasignado paella)
		;;;
		(asignadoprimero platovaciop d0)
		(asignadosegundo platovacios d0)
		(platoasignado platovaciop)
		(platoasignado platovacios)
		
		
		 (= (precioP fideua) 10) 
		 (= (precioP paella) 10) 
		 (= (precioP sopa_pescado) 10) 
		 (= (precioP macarrones_bolognesa) 10) 
		 (= (precioP ensalada) 10) 
		 (= (precioP canelones) 10) 
		 (= (precioP risotto) 10) 
		 (= (precioP crema_verduras) 10) 
		 (= (precioP ensalada_alemana) 10) 
		 (= (precioP espinacas) 10) 
		 (= (precioP langostinos) 10) 
		 (= (precioP albondigas_con_patata) 10) 
		 (= (precioP bistec) 10) 
		 (= (precioP fabada) 10) 
		 (= (precioP salmon) 10) 
		 (= (precioP quiche) 10) 
		 (= (precioP hamburguesa) 10) 
		 (= (precioP tortilla_espinacas) 10) 
		 (= (precioP bacalao_con_samfaina) 10) 
		 (= (precioP pizza) 10)		 
		 
		 
		 (= (caloriasP fideua) 600) 
		 (= (caloriasP paella) 600) 
		 (= (caloriasP sopa_pescado) 600) 
		 (= (caloriasP macarrones_bolognesa) 600) 
		 (= (caloriasP ensalada) 600) 
		 (= (caloriasP canelones) 600) 
		 (= (caloriasP risotto) 600) 
		 (= (caloriasP crema_verduras) 600) 
		 (= (caloriasP ensalada_alemana) 600) 
		 (= (caloriasP espinacas) 600) 
		 (= (caloriasP langostinos) 600) 
		 (= (caloriasP albondigas_con_patata) 600) 
		 (= (caloriasP bistec) 600) 
		 (= (caloriasP fabada) 600) 
		 (= (caloriasP salmon) 600) 
		 (= (caloriasP quiche) 600) 
		 (= (caloriasP hamburguesa) 600) 
		 (= (caloriasP tortilla_espinacas) 600) 
		 (= (caloriasP bacalao_con_samfaina) 600) 
		 (= (caloriasP pizza) 600)
		 
		 ( = (precioTotal) 0)
		 ( = (minCal) 1000)
		 ( = (maxCal) 1500)
)

;;(:goal ( and (tieneprimero lunes) (tieneprimero martes) (tieneprimero miercoles) (tieneprimero jueves) (tieneprimero viernes) (tienesegundo lunes) (tienesegundo martes) (tienesegundo miercoles) (tienesegundo jueves) (tienesegundo viernes))
(:goal ( and (diacompleto lunes) (diacompleto martes) (diacompleto miercoles) (diacompleto jueves) (diacompleto viernes)
         )
)

(:metric minimize (+ (precioTotal lunes) (precioTotal martes) (precioTotal miercoles) (precioTotal jueves) (precioTotal viernes))

)
)    
