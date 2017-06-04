#include <iostream>
#include <fstream>
#include <string>
#include <set>
#include <random>
#include <algorithm>
#include <iterator>

using namespace std;

typedef struct{
	
	string nombre;
	string tipo;
} platos;

typedef struct{
	string p1;
	string p2;
} incompatibles;

vector<string> dias = ("d0", "lunes", "martes", "miercoles", "jueves","viernes");

vector<platos> platosPrimeros = ({"fideua", "pasta"},
								{"paella","pasta"},
								{"sopa_pescado","sopa"},
								{"macarrones_bolognesa","pasta"},
								{"ensalada","verdura"},
								{"canelones","pasta"},
								{"risotto","pasta"},
								{"crema_verduras","verdura"},
								{"ensalada_alemana","verdura"},
								{"espinacas","verdura"},
								{"platovaciop","tipovacio"} );

vector<platos> platosSegundos = ({"bistec","carne"},
								{"langostinos","pescado"},
								{"albondigas_con_patata","carne"},
								{"fabada","verdura"},
								{"salmon","pescado"},
								{"hamburguesa","carne"},
								{"quiche","pasta"},
								{"tortilla_espinacas","verdura"},
								{"bacalao_con_samfaina","pescado"},
								{"pizza","pasta"},
								{"platovacios","tipovacio"} );
								
vector<string> tipos = ("sopa", "estofado", "carne", "pescado", "verdura", "tipovacio", "pasta");

//void loadPrimeros();
//void loadSegundos();
//void loadTipos();

int main (int argc, char* argv[]) {
    if (argc != 2) {
        cerr << "Uso: " << argv[0] << " <nombre problema>" << endl;
        return 1;
    }
	ofstream problema;
	problema.open(argv[1]);
	
//Define and Domain
	problema << "(define (problem "<< argv[1] << ") (:domain menu)\n";
	
//Objects
	problema << "(:objects\n";
	int i = 0;
	for(i; i < dias.length(); ++i)problema << dias[i] << " ";
	problema << "- dia\n";
	for (i=0; i < platosPrimeros.length(); ++i) problema << platosPrimeros[i].nombre << " ";
	problema << "- primero\n";
	for (i=0; i < platosSegundos.length(); ++i) problema << platosSegundos[i].nombre << " ";
	problema << "- segundo\n";
	for (i=0; i < tipos.length(); ++i) problema << tipos[i] << " ";
	problema << "- tipo )\n\n"; //Este ultimo ) cierra la seccion Objects!
	
//Init
	problema << "(:init\n";
	
///////////Generacion aleatoria de incompatibilidades///////////
	default_random_engine gen;
	
	//Distribucion uniforme para primeros y segundos
	uniform_int_distribution<int> distPrimeros (0, platosPrimeros.length());
	uniform_int_distribution<int> distSegundos (0, platosSegundos.length());
	
	//Numero de incompatibilidades a generar
	int numIncompatibles = distPrimeros(gen)+distSegundos(gen);
	
	//Set con todas las incompatibilidades (inicialmente null)
	set<incompatibles> incompats = new set<incompatibles>();
	
	//Generacion de incompatibilidades
	for (i = 0; i < numIncompatibles; ++i){
		
		//Struct a insertar en el set
		incompatibles in = new incompatibles;
		
		//Candidatos a incompatibilidad;
		int numIndexP1 = distPrimeros(gen);
		int numIndexP2 = distSegundos(gen);
		
		//Comprobaciones varias
		if (not incompats.empty()){
			
			bool asignado = false;
			while (not asignado){
				set<incompatibles>::iterator it = incompats.begin();
				bool encontrado = false;
				
				for (it; it != incompats.end() and not found; ++it){
					if (*it.p1.nombre == platosPrimeros[numIndexP1].nombre and *it.p2.nombre == platosSegundos[numIndexP2].nombre) found = true;
				}
				
				if (not found) {
					in.p1.nombre = platosPrimeros[numIndexP1].nombre;
					in.p2.nombre = platosSegundos[numIndexP2].nombre;
					in.p1.tipo = platosPrimeros[numIndexP1].tipo;
					in.p2.tipo = platosSegundos[numIndexP2].tipo;
					asignado = true;
				}
				else numIndexP2 = distSegundos(gen);	
			}
			
		}
		else {
			in.p1.nombre = platosPrimeros[numIndexP1].nombre;
			in.p2.nombre = platosSegundos[numIndexP2].nombre;
			in.p1.tipo = platosPrimeros[numIndexP1].tipo;
			in.p2.tipo = platosSegundos[numIndexP2].tipo;
			asignado = true;
		}
		incompats.insert(in);
		cout << in.p1.nombre << " con tipo " << in.p1.tipo << " es incompatible con " << in.p2.nombre << " con tipo " << in.p2.tipo << " y se ha insertado en el set\n";
	}
	
	//Guardado en fichero de las incompatibilidades
	set<incompatibles>::iterator its = incompats.begin();
	for (its; its != incompats.end(); ++its) problema << "(esincompatible " << *its.p1.nombre << " " << *its.p2.nombre << ")\n";
	problema << "\n";
	
	//Genereacion de la secuencia de dias
	for (i = 0; i < dias.length(); ++i) {
		problema << "(diasiguiente " << dias[i] << " ";
		if (i+1 < dias.length()) problema << dias[i+1] << ")\n";
		else problema << "d0)\n";
	}
	
	//Generacion de los tipos de los platos
	for (i = 0; i < platosPrimeros.length(); ++i) problema << "(esdetipo " << platosPrimeros[i].nombre << " " << platosPrimeros[i].tipo << ")\n";
	
	for (i = 0; i < platosSegundos.length(); ++i) problema << "(esdetipo " << platosSegundos[i].nombre << " " << platosSegundos[i].tipo << ")\n";
	
	//Extensiones
	
	//Asignacion de platos vacios y dia centinela
	problema << "(asignadoprimero platovaciop d0)\n";
	problema << "(asignadosegundo platovacios d0)\n";
	problema << "(platoasignado platovaciop)\n";
	problema << "(platoasignado platovacios))\n"; //Este ultimo ) cierra la seccion init!
	
//Goal
	//Objetivo del problema -> conseguir que todos los dias tengan un menu asignado
	problema << "(:goal ( and (diacompleto lunes) (diacompleto martes) (diacompleto miercoles) (diacompleto jueves) (diacompleto viernes)))\n;
//Metric
	//Unused
	problema << ")\n"; //Este ultimo ) cierra la seccion define!
	
	problema.close();
	return 0;
	
}

