/*
 * https://github.com/Valen23
 */
package tema5;

public class Subsidio {
    
    private double monto;
    private String motivo;
    private boolean otorgado = false;

    public Subsidio(double monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
}
