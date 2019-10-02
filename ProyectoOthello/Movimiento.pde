/*
* Representación de un movimiento. 
* Representa la información de los tiros y son guardados en
* el árbol (representación usada con la clase Nodo).
*/
public class Movimiento{
  public int valor;
  public int x;
  public int y;
  public int[][] mundo;
  
  /**
  * Constructor de la clase Movimiento
  * @param int valor, valor del tiro.
  * @param int x, posición x en el mundo.
  * @param int y, posición y en el mundo.
  * @param int[][] mundo, mundo (tablero) sobre el cual se trabaja.
  */
  public Movimiento(int valor, int x, int y, int[][] mundo){
    this.valor = valor;
    this.x = x;
    this.y = y;
    this.mundo = mundo;
  }
  
  /**
  * Constructor de la clase Movimiento
  * @param int x, posición x en el mundo.
  * @param int y, posición y en el mundo.
  * @param int[][] mundo, mundo (tablero) sobre el cual se trabaja.
  */
  public Movimiento(int x, int y, int[][] mundo){
    this.x = x;
    this.y = y;
    this.mundo = mundo;
  }
  
  /**
  * Constructor de la clase Movimiento
  * @param int valor, valor del tiro.
  */
  public Movimiento(int valor){
    this.valor = valor;
  }
  
  /**
  * Constructor de la clase Movimiento
  * @param int[][] mundo, mundo (tablero) sobre el cual se trabaja.
  */
  public Movimiento(int[][] mundo){
    this.mundo = mundo;
  }
  
/**
* Cuenta la cantidad de fichas de un determinado jugador en el Tablero.
* @param int jugador. Identificador del jugador. 1: Jugador_1, 2: Jugador_2.
* @return int total. Cantidad de fichas en el tablero del jugador dado como parámetro 
*/
  public int count(int jugador) {
    int total = 0;
    for (int i = 0; i < alto; i++) {
      for (int j = 0; j < ancho; j++) {
        if (mundo[i][j] == jugador) {
          total += 1;
        }
      }
    }
    return total;
  }
}