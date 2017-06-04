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
		
		;; Platos obligados
		(asignadoprimero paella jueves)
		(tieneprimero jueves)
		(platoasignado paella)
        
        (asignadosegundo bistec miercoles)
		(tienesegundo miercoles)
		(platoasignado bistec)
		;;;;;
        
		(asignadoprimero platovaciop d0)
		(asignadosegundo platovacios d0)
		(platoasignado platovaciop)
		(platoasignado platovacios)
		
		
		 (= (precioP fideua) 7) 
		 (= (precioP paella) 20) 
		 (= (precioP sopa_pescado) 6) 
		 (= (precioP macarrones_bolognesa) 7) 
		 (= (precioP ensalada) 5) 
		 (= (precioP canelones) 10) 
		 (= (precioP risotto) 8) 
		 (= (precioP crema_verduras) 6) 
		 (= (precioP ensalada_alemana) 6) 
		 (= (precioP espinacas) 9) 
		 (= (precioP langostinos) 15) 
		 (= (precioP albondigas_con_patata) 12) 
		 (= (precioP bistec) 17) 
		 (= (precioP fabada) 10) 
		 (= (precioP salmon) 11) 
		 (= (precioP quiche) 7) 
		 (= (precioP hamburguesa) 12) 
		 (= (precioP tortilla_espinacas) 10) 
		 (= (precioP bacalao_con_samfaina) 11) 
		 (= (precioP pizza) 7)		 
		 
		 
		 (= (caloriasP fideua) 700) 
		 (= (caloriasP paella) 900) 
		 (= (caloriasP sopa_pescado) 500) 
		 (= (caloriasP macarrones_bolognesa) 500) 
		 (= (caloriasP ensalada) 400) 
		 (= (caloriasP canelones) 700) 
		 (= (caloriasP risotto) 600) 
		 (= (caloriasP crema_verduras) 400) 
		 (= (caloriasP ensalada_alemana) 450) 
		 (= (caloriasP espinacas) 500) 
		 (= (caloriasP langostinos) 650) 
		 (= (caloriasP albondigas_con_patata) 800) 
		 (= (caloriasP bistec) 850) 
		 (= (caloriasP fabada) 900) 
		 (= (caloriasP salmon) 450) 
		 (= (caloriasP quiche) 450) 
		 (= (caloriasP hamburguesa) 750) 
		 (= (caloriasP tortilla_espinacas) 600) 
		 (= (caloriasP bacalao_con_samfaina) 700) 
		 (= (caloriasP pizza) 500)
		 
		 ( = (precioTotal) 0)
		 ( = (minCal) 1000)
		 ( = (maxCal) 1500)
)

(:goal ( and (diacompleto lunes) (diacompleto martes) (diacompleto miercoles) (diacompleto jueves) (diacompleto viernes)
         )
)

(:metric minimize (precioTotal) ) 

)
