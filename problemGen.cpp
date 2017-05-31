#include <iostream>
#include <fstream>
#include <string>
#include <list>

using namespace std;

typedef struct{
	
	string nombre;
	string tipo;
	list <string> incompatibles;
} platos;

vector<string> dias ("d0", "lunes", "martes", "miercoles", "jueves",
"viernes");
vector<platos> platosPrimeros (); #Llenar
vector<platos> platosSegundos ();

int main (int argc, char* argv[]) {
    if (argc != 2) {
        cerr << "Uso: " << argv[0] << " <nombre problema>" << endl;
        return 1;
    }
	ofstream problema;
	problema.open(argv[1]);
	problema << "(define (problem "<< argv[1] << ") (:domain menu)" << endl;
	problema << "(:objects " << endl;
	int i = 0;
	while (i < dias.length()){
		problema << "dias[i] ";
	}
	problema << "- dia" << endl;
	
	problema.close();
	return 0;
	
}

