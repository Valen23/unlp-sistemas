/*
 * https://github.com/Valen23
 */
package tema5.ejercicio2;

public class ejercicio2 {

    public static void main(String[] args) {
        
        Estacionamiento miEstacionamiento = new Estacionamiento("Tucu Correa", "Segurola y Habana", "07:00", "21:00", 3, 3);
        Auto miAuto = new Auto("German Beder", "IJK-314");
        
        miEstacionamiento.agregarAuto(1, 1, miAuto);
        miEstacionamiento.agregarAuto(2, 1, miAuto);
        miEstacionamiento.agregarAuto(3, 1, miAuto);
        miEstacionamiento.agregarAuto(1, 2, miAuto);
        miEstacionamiento.agregarAuto(2, 2, miAuto);
        miEstacionamiento.agregarAuto(3, 2, miAuto);
        
        System.out.println(miEstacionamiento.toString());
        System.out.println(miEstacionamiento.contarPlaza(1));
        System.out.println(miEstacionamiento.buscarAuto("IJK-314"));
    }
    
}
