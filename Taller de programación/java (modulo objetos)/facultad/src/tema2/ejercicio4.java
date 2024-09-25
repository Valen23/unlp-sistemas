/*
 * https://github.com/Valen23
 */
package tema2;
import PaqueteLectura.Lector;

public class ejercicio4 {

    public static void main(String[] args) {
        
        int cantidadPersonas = 8;
        int cantidadDias = 5;
        int i = 0;
        int j = 0;
        
        Persona[][] matriz = new Persona[cantidadDias][cantidadPersonas];
        String nombreAux;
        int contadorAux = 0;
        int dia;
        int horario;

        System.out.print("Ingrese su nombre: "); // Primero leo el nombre para verificar si crear un nuevo espacio
        nombreAux = Lector.leerString();
        
        while(!nombreAux.equals("Z")&&(i < cantidadDias)&&(contadorAux < 40)){ // Verificamos que el nombre sea distinto de "Z" y que no desborde el indice 'i'
            
            System.out.print("Ingrese un dia: "); // Leo el dia y el horario
            dia = Lector.leerInt();
            
            if((vector[dia] < 8)&&(!nombreAux.equals("Z"))){ // Si la posicion no está ocupada y el nombre ingresado no es "Z" se crea un nuevo espacio
                contadorAux++; // Aumento el contador
                
                matriz[dia][vector[dia]] = new Persona(); // Nuevo espacio
                
                matriz[dia][vector[dia]].setNombre(nombreAux);
                System.out.print("Ingrese su DNI: ");
                matriz[dia][vector[dia]].setDNI(Lector.leerInt());
                System.out.print("Ingrese su edad: ");
                matriz[dia][vector[dia]].setEdad(Lector.leerInt());
                vector[dia]++;
            } else {
                System.out.println("Dia invalido, el dia esta completo!");
            }
        }
        
    }
    
}
