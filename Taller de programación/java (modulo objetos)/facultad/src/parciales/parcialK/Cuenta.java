/*
 * https://github.com/Valen23
 */
package parciales.parcialK;

public class Cuenta {
    
    private int CBU;
    private String alias;
    private int DNI;
    private String moneda;
    private double monto = 0;

    public Cuenta(int CBU, String alias, int DNI, String moneda) {
        this.CBU = CBU;
        this.alias = alias;
        this.DNI = DNI;
        this.moneda = moneda;
    }

    public int getCBU() {
        return CBU;
    }

    public void setCBU(int CBU) {
        this.CBU = CBU;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public String getMoneda() {
        return moneda;
    }

    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }   
}
