/*
 * https://github.com/Valen23
 */
package parciales.parcialK;

public class parcialMain {
    
    public static void main(String[] args){
        
        Tradicional miBancoT = new Tradicional("Alcorta al 700", "9 de Julio", "Valentino", 30, 10);
        Digital miBancoD = new Digital("hola", "Valentino", 15, 10);
    
        Cuenta nuevaCuenta1 = new Cuenta(1514, "arroz", 3340, "pesos");
        Cuenta nuevaCuenta2 = new Cuenta(1515, "arroz", 3341, "pesos");
        Cuenta nuevaCuenta3 = new Cuenta(1516, "arroz", 3342, "dolares");
        Cuenta nuevaCuenta4 = new Cuenta(1517, "arroz", 3343, "dolares");
        Cuenta nuevaCuenta5 = new Cuenta(1518, "arroz", 3345, "pesos");
        
        System.out.println(miBancoT.agregarCuenta(nuevaCuenta1));
        System.out.println(miBancoD.agregarCuenta(nuevaCuenta2));
        
        miBancoT.depositarDinero(1515, 3000);
        
    }
    
}
