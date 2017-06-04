#include <iostream>
#include <fstream>
#include <string>
#include <set>
#include <random>

using namespace std;

typedef struct{
	
	string nombre;
	string tipo;
} platos;

typedef struct{
	string p1;
	string p2;
} incompatibles;

vector<string> dias ("d0", "lunes", "martes", "miercoles", "jueves","viernes");
vector<string> platosPrimeros ("fideua","paella","sopa_pescado","macarrones_bolognesa","ensalada","canelones","risotto","crema_verduras","ensalada_alemana","espinacas","platovaciop");
vector<string> platosSegundos ("bistec","langostinos","albondigas_con_patata","fabada","salmon","hamburguesa","quiche","tortilla_espinacas","bacalao_con_samfaina","pizza","platovacios");
vector<string> tipos ("sopa","estofado","carne","pescado","verdura","pasta","tipovacio");

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
	for (i=0; i < platosPrimeros.length(); ++i) problema << platosPrimeros[i] << " ";
	problema << "- primero\n";
	for (i=0; i < platosSegundos.length(); ++i) problema << platosSegundos[i] << " ";
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
					if (*it.p1 == platosPrimeros[numIndexP1] and *it.p2 == platosSegundos[numIndexP2]) found = true;
				}
				
				if (not found) {
					in.p1 = platosPrimeros[numIndexP1];
					in.p2 = platosSegundos[numIndexP2];
					asignado = true;
				}
				else numIndexP2 = distSegundos(gen);	
			}
			
		}
		else {
			in.p1 = platosPrimeros[numIndexP1];
			in.p2 = platosSegundos[numIndexP2];
		}
		incompats.insert(in);
		cout << in.p1 << " " << in.p2 << " has been inserted into the set.\n";
	}
	
	//Guardado en fichero de las incompatibilidades
	set<incompatibles>::iterator its = incompats.begin();
	for (its; its != incompats.end(); ++its) problema << "(esincompatible " << *its.p1 << " " << *its.p2 << ")\n";
	problema << "\n";
	
	//Genereacion de la secuencia de dias
	for (i = 0; i < dias.length(); ++i) {
		problema << "(diasiguiente " << dias[i] << " ";
		if (i+1 < dias.length()) problema << dias[i+1] << ")\n";
		else problema << "d0)\n";
	}
	
	//Generacion de los tipos de los platos
	
	//Extensiones
	
	//Asignacion de platos vacios y dia centinela
	problema << "(esdetipo platovaciop tipovacio)\n";
	problema << "(esdetipo platovacios tipovacio)\n";
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

