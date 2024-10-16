/*
 * https://github.com/Valen23
 */
package tema5.ejercicio4;

public class ejercicio5 {

    public static void main(String[] args) {
        
        Director unDirector = new Director("Valentino", 555, 18, 3);
        Semicircular coroSemicircular = new Semicircular(3, "Coro semicircular", unDirector);
        Corista corista1 = new Corista("Pepe", 333, 3, 4);
        Corista corista2 = new Corista("Juan", 444, 2, 3);
        Corista corista3 = new Corista("Rocio", 666, 1, 2);
        coroSemicircular.agregarCorista(corista1);
        coroSemicircular.agregarCorista(corista2);
        coroSemicircular.agregarCorista(corista3);
        System.out.println(coroSemicircular.toString()); 
        System.out.println(coroSemicircular.estaLleno());
        System.out.println(coroSemicircular.estaOrdenado());
        
        System.out.println("-------------------");
        
        Director unDirector2 = new Director("Juampi", 222, 21,2);
        Hileras coroHileras = new Hileras(3, 4, "Coro hileras", unDirector2);
        Corista corista4 = new Corista("Gonzalo", 542, 3, 1);
        Corista corista5 = new Corista("Veronica", 324, 3, 1);
        Corista corista6 = new Corista("Laura", 675, 3, 4);
        Corista corista7 = new Corista("Eduardo", 338, 1, 2);
        Corista corista8 = new Corista("Victoria", 427, 1, 2);
        Corista corista9 = new Corista("Cecilia", 926, 1, 1);
        coroHileras.agregarCorista(corista4);
        coroHileras.agregarCorista(corista5);
        coroHileras.agregarCorista(corista6);
        coroHileras.agregarCorista(corista7);
        coroHileras.agregarCorista(corista8);
        coroHileras.agregarCorista(corista9);
        System.out.println(coroHileras.toString());
        System.out.println(coroHileras.estaLleno());
        System.out.println(coroHileras.estaOrdenado());
        
    }
    
}
