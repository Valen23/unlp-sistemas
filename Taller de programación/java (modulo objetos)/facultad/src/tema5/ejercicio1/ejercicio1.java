/*
 * https://github.com/Valen23
 */
package tema5;

public class ejercicio1 {
    
    public static void main(String[] args) {
        
        Proyecto nuevoProyecto = new Proyecto("Cosas y cosos", 3377, "Alejo");
        
        Investigador invest1 = new Investigador("Carlitox", 2, "Jojojo");
        Investigador invest2 = new Investigador("Gregory", 2, "Mmmbuenodale");
        Investigador invest3 = new Investigador("El Viejo", 2, "Viteh");
        
        nuevoProyecto.agregarInvestigador(invest1);
        nuevoProyecto.agregarInvestigador(invest2);
        nuevoProyecto.agregarInvestigador(invest3);
        
        Subsidio unSubsidio = new Subsidio(3300, "Razones justificadas.");
        invest1.agregarSubsidio(unSubsidio);
        invest1.agregarSubsidio(unSubsidio);
        invest2.agregarSubsidio(unSubsidio);
        invest2.agregarSubsidio(unSubsidio);
        invest3.agregarSubsidio(unSubsidio);
        invest3.agregarSubsidio(unSubsidio);
        
        nuevoProyecto.otorgarTodos("Gregory");
        
        System.out.println(nuevoProyecto.toString());
        
    }
    
}
