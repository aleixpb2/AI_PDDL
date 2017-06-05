#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
#include <set>
#include <random>
#include <algorithm>
#include <iterator>

using namespace std;

struct platos{
	
	string nombre;
	string tipo;
};

struct incompatibles{
	platos p1;
	platos p2;
};

ifstream entrada;
vector<platos> platosPrimeros;
vector<platos> platosSegundos;
vector<string> tipos;
vector<string> dias;

void loadPlatos(vector<platos> &pp1, vector<platos> &pp2, vector<string> &ts, vector<string> &d) {
    
    string temp;
    int caso = 0;
    while(getline(entrada, temp)){
        if(temp == "-primeros"){
            caso = 1;
            getline(entrada,temp);
        }
        else if (temp == "-segundos"){
            caso = 2;
            getline(entrada,temp);
        }
        else if (temp == "-dias"){
            caso = 3;
            getline(entrada,temp);
        }
        
        platos p;
        string palabra;
        istringstream input(temp);
        switch (caso){
            case 1:
                input >> palabra;
                p.nombre = palabra;
                input >> palabra;
                p.tipo = palabra;
                pp1.push_back(p);
                break;
                
            case 2:
                input >> palabra;
                p.nombre = palabra;
                input >> palabra;
                p.tipo = palabra;
                pp2.push_back(p);
                break;
                
            case 3:
                d.push_back(temp);
                break;
        }
        
    }
    
}


int main (int argc, char* argv[]) {
    if (argc != 2) {
        cerr << "Uso: " << argv[0] << " <nombre del problema a generar>" << endl;
        return 1;
    }
    
    //Abrimos el fichero del problema de salida
	ofstream problema;
	problema.open(argv[1]);
    
    //Abrimos el fichero de entrada de platos
    
    entrada.open("platos.txt");
    if (entrada.is_open()){
        loadPlatos(platosPrimeros, platosSegundos, tipos, dias);
    }
    else cout << "Fichero de platos no encontrado" << endl;
   /*
    for (int i = 0; i < dias.size()-1; ++i){
        cout << dias[i] << endl;
    }
    for (int i = 0; i < platosPrimeros.size()-1; ++i){
        cout << platosPrimeros[i].nombre << " " << platosPrimeros[i].tipo <<endl;
    }
    
    for (int i = 0; i < platosSegundos.size()-1; ++i){
        cout << platosSegundos[i].nombre << " " << platosSegundos[i].tipo <<endl;
    }
    */

//Define and Domain
	problema << "(define (problem "<< argv[1] << ") (:domain menu)\n";
	
//Objects
	problema << "(:objects\n";
	int i;
	for(i = 0; i < dias.size(); ++i)problema << dias[i] << " ";
	problema << "- dia\n";
	for (i = 0; i < platosPrimeros.size(); ++i) problema << platosPrimeros[i].nombre << " ";
	problema << "- primero\n";
	for (i = 0; i < platosSegundos.size(); ++i) problema << platosSegundos[i].nombre << " ";
	problema << "- segundo\n";
	for (i = 0; i < tipos.size(); ++i) problema << tipos[i] << " ";
	problema << "- tipo )\n\n"; //Este ultimo ) cierra la seccion Objects!
	
//Init
	problema << "(:init\n";
	
///////////Generacion aleatoria de incompatibilidades///////////
	default_random_engine gen;
	
	//Distribucion uniforme para primeros y segundos
	uniform_int_distribution<int> distPrimeros (0, platosPrimeros.size());
	uniform_int_distribution<int> distSegundos (0, platosSegundos.size());
	
	//Numero de incompatibilidades a generar
	int numIncompatibles = distPrimeros(gen)+distSegundos(gen);
	
	//Set con todas las incompatibilidades (inicialmente null)
	set<incompatibles> incompats;
	
	//Generacion de incompatibilidades
	for (i = 0; i < numIncompatibles; ++i){
		
		//Struct a insertar en el set
        incompatibles in;
		
		//Candidatos a incompatibilidad;
		int numIndexP1 = distPrimeros(gen);
		int numIndexP2 = distSegundos(gen);
		
		//Comprobaciones varias
        //Un set mantiene tan solo una copia de cada pareja insertada. Se hace la comprobacion para evitar hacer la misma insercion dos veces y tener menos incompatibilidades que las pedidas por el generador random. Se puede pasar este hecho por alto y simplemente considerar las incompatibilidades que aparecen.
		if (not incompats.empty()){
			
            bool asignado = false;
			while (not asignado){
				set<incompatibles>::iterator it = incompats.begin();
				bool encontrado = false;
				
				for (; it != incompats.end() and not encontrado; ++it){
					if (it->p1.nombre == platosPrimeros[numIndexP1].nombre and it->p2.nombre == platosSegundos[numIndexP2].nombre) encontrado = true;
				}
				
				if (not encontrado) {
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
		}
        
        incompats.insert(in);
		cout << in.p1.nombre << " con tipo " << in.p1.tipo << " es incompatible con " << in.p2.nombre << " con tipo " << in.p2.tipo << " y se ha insertado en el set\n";
	}
	
	//Guardado en fichero de las incompatibilidades
	set<incompatibles>::iterator its = incompats.begin();
	for (; its != incompats.end(); ++its) problema << "(esincompatible " << its->p1.nombre << " " << its->p2.nombre << ")\n";
	problema << "\n";
	
	//Genereacion de la secuencia de dias
	for (i = 0; i < dias.size(); ++i) {
		problema << "(diasiguiente " << dias[i] << " ";
		if (i+1 < dias.size()) problema << dias[i+1] << ")\n";
		else problema << "d0)\n";
	}
	
	//Generacion de los tipos de los platos
	for (i = 0; i < platosPrimeros.size(); ++i) problema << "(esdetipo " << platosPrimeros[i].nombre << " " << platosPrimeros[i].tipo << ")\n";
	
	for (i = 0; i < platosSegundos.size(); ++i) problema << "(esdetipo " << platosSegundos[i].nombre << " " << platosSegundos[i].tipo << ")\n";
	
	//Extensiones
	
	//Asignacion de platos vacios y dia centinela
	problema << "(asignadoprimero platovaciop d0)\n";
	problema << "(asignadosegundo platovacios d0)\n";
	problema << "(platoasignado platovaciop)\n";
	problema << "(platoasignado platovacios))\n"; //Este ultimo ) cierra la seccion init!
	
//Goal
	//Objetivo del problema -> conseguir que todos los dias tengan un menu asignado
	problema << "(:goal ( and (diacompleto lunes) (diacompleto martes) (diacompleto miercoles) (diacompleto jueves) (diacompleto viernes)))\n";
//Metric
	//Unused
	problema << ")\n"; //Este ultimo ) cierra la seccion define!

	problema.close();
	return 0;
	
}

