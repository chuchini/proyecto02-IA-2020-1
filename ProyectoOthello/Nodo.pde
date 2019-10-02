import java.util.List;

/**
* Clase encargada de representar los nodos que conforman un árbol.
*/
public class Nodo<T>{
    public Movimiento data;
    public List<Nodo> hijo = new ArrayList<Nodo>();
    public Nodo padre = null;

    /**
    * Contructor de la clase Nodo.
    * @param Movimiento data. La información sobre el tiro que contendrá el nodo.
    */
    public Nodo(Movimiento data) {
        this.data = data;
    }

    /**
    * Método que sirve para agregar nodos hijo al árbol.
    * @param Nodo hijo. el nodo hijo a agregar.
    */
    public void agregaHijo(Nodo hijo) {
        hijo.setPadre(this);
        this.hijo.add(hijo);
    }

    /**
    * /**
    * Método que sirve para agregar nodos hijo al árbol con información sobre los movimientos.
    * @param Movimiento data. La información que contiene el nuevo hijo.
    */
    public void agregaHijo(Movimiento data) {
        Nodo<Movimiento> hijoNuevo = new Nodo(data);
        hijoNuevo.setPadre(this);
        hijo.add(hijoNuevo);
    }

    /**
    * Metodo para modificar los nodos al agregar un nuevo hijo.
    * @param List<Nodos> hijo. Lista de nodos a modificar con el hijo.
    */
    public void agregaHijo(List<Nodo> hijo) {
        for(Nodo t : hijo) {
            t.setPadre(this);
        }
        this.hijo.addAll(hijo);
    }

    /**
    * Método para obtener el hijo.
    * @return hijo.
    */
    public List<Nodo> getHijo() {
        return hijo;
    }

    /**
    * Método para obtener la información del movimiento.
    * @return data. La información del movimiento.
    */
    public Movimiento getData() {
        return data;
    }

    /**
    * Método para modificar la información del movimiento.
    * @param data. La información del movimiento.
    */
    public void setData(Movimiento data) {
        this.data = data;
    }

    /**
    * Método para modificar la información del padre.
    * @param padre. El nodo padre.
    */
    private void setPadre(Nodo padre) {
        this.padre = padre;
    }

    /**
    * Método para modificar la información del movimiento.
    * @return padre. El nodo padre.
    */
    public Nodo getPadre() {
        return padre;
    }
}
