import java.util.List;

public class Nodo<T>{
    public Movimiento data;
    public List<Nodo> children = new ArrayList<Nodo>();
    public Nodo parent = null;

    public Nodo(Movimiento data) {
        this.data = data;
    }

    public void addChild(Nodo child) {
        child.setParent(this);
        this.children.add(child);
    }

    public void addChild(Movimiento data) {
        Nodo<Movimiento> newChild = new Nodo(data);
        newChild.setParent(this);
        children.add(newChild);
    }

    public void addChildren(List<Nodo> children) {
        for(Nodo t : children) {
            t.setParent(this);
        }
        this.children.addAll(children);
    }

    public List<Nodo> getChildren() {
        return children;
    }

    public Movimiento getData() {
        return data;
    }

    public void setData(Movimiento data) {
        this.data = data;
    }

    private void setParent(Nodo parent) {
        this.parent = parent;
    }

    public Nodo getParent() {
        return parent;
    }
}