package Beans;

public class ProductosBeans {
    
    String cod;
    String nom;
    String descrp;   
    String marca; 
    String categoria;
    int stock;
    double precio;
    double desc;    
    String imagen;

    public ProductosBeans(String cod, String nom, String descrp, String marca, String categoria, int stock, double precio, double desc, String imagen) {
        this.cod = cod;
        this.nom = nom;
        this.descrp = descrp;
        this.marca = marca;
        this.categoria = categoria;
        this.stock = stock;
        this.precio = precio;
        this.desc = desc;
        this.imagen = imagen;
    }

    public String getCod() {
        return cod;
    }

    public void setCod(String cod) {
        this.cod = cod;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescrp() {
        return descrp;
    }

    public void setDescrp(String descrp) {
        this.descrp = descrp;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getDesc() {
        return desc;
    }

    public void setDesc(double desc) {
        this.desc = desc;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    

    
}
