package tema3;

public class Demo01ConstructoresLibro {

    public static void main(String[] args) {
        Autor nuevoAutor1 = new Autor("Herbert Schildt", "de chiquito escribia una banda", "Escocia");
        Libro libro1 = new Libro("Java: A Beginner's Guide",   
                                "Mcgraw-Hill", 2014,   
                                nuevoAutor1, "978-0071809252", 21.72);
        
        Autor nuevoAutor2 = new Autor("John Horton", "de chiquito escribia una banda", "Reino Unido");
        Libro libro2 = new Libro("Learning Java by Building Android Games",  
                                "CreateSpace Independent Publishing", 
                                nuevoAutor2, "978-1512108347");
        
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro 2: " + libro2.getPrecio());
        System.out.println("Año edición del libro 2: " + libro2.getAñoEdicion());
        Libro libro3 = new Libro(); 
    }
    
}
