/**
 * Implementacion del Juego Reversi/Othello 
 */
int ancho = 8, 
  alto = 8, 
  tamano = 60;
boolean p1Turn = true;
int playerCode;
Tablero tablero; 
int valor; // Valor de la jugada elegida.
boolean minimax = false; // Variable para decidir la estrategia de cada turno.
int dificultad = 1; // Variable para elegir la estrategia general de la computadora.

// Inicial para establecer tamaño de ventana con variables
void settings() {
  size((ancho * tamano)+1, (alto * tamano)+1);
}

// Inicialización
void setup() {
  tablero = new Tablero(ancho, alto, tamano);
}

// Update. Continuamente ejecuta y dibuja el código contenido en él
void draw() {
  tablero.display();  
  if (p1Turn) {    
    tablero.permiso(1);
  } else {    
    tablero.permiso(2);
  }
  if(valor==0){
    int x=tablero.max[0], y=tablero.max[1];
    valor=tablero.opciones[x][y];
    System.out.println("Mejor opción: (" + x + "," + y + "): " + valor);
   if(!p1Turn){
      if(minimax) {
        x=tablero.min[0];
        y=tablero.min[1];
      } minimax = !minimax;
      System.out.println("Opción elegida por la computadora: (" + x + "," + y + "): " + valor);
      playerCode = 2;
      if(valor==0) 
        valor=-1; // Para que no se cicle.
      else 
        flanquear(y,x); // Se voltean las fichas.
    } 
 
  }
}

// Callback. Evento que ocurre después de presionar el botón del mouse
void mouseClicked() {
  if (p1Turn) {
    playerCode = 1;
    //tablero.permiso(1);
  } else {
    playerCode = 2;
    //tablero.permiso(2);        
  }
  flanquear(tablero.toTileInt(mouseX), tablero.toTileInt(mouseY));
}

// Método que realiza el cambio de color en las fichas.
public void flanquear(int x, int y){
    System.out.println("MouseX: " + x + "\tMouseY: " + y);
  // Colocar un disco/ficha en el tablero:
  if(tablero.isValid(x, y)){    
   tablero.cambia(x, y, playerCode );  
    tablero.setDisk(x, y, playerCode);
    System.out.println("----jugador-------");
     System.out.println(playerCode);
    p1Turn = !p1Turn;
  }
  // Conteo de discos/fichas
  println("Player " + playerCode + " discs: " + tablero.count(playerCode));
 /*  System.out.println("------tablero-------------");
  tablero.imprimeTab();
 */
 System.out.println(playerCode);
   System.out.println("-----cordenadas de pieza--------");
  System.out.println(x + "," + y + "\n");
  valor=0; // Se reinicia el valor de la jugada.
}
