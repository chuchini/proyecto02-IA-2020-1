/**
 * Representación de un tablero del juego Reversi/Othello.
 * La representación del tablero es mediante un arreglo bidimensional de enteros
 * que representan: 0 = casilla vacia, 1 = disco del jugador 1, 2 = disco del jugador 2.
 * @author  Rodrigo Colín
 * @version %I%, %G%
 */
class Tablero {
  int ancho;
  int alto;
  int tamano;
  int[][] mundo;
  color p1Color = color(0, 0, 0);
  color p2Color = color(255, 255, 255);
  color p3color= color(255, 255, 51);
  int opciones[][]; // Arreglo que guarda la cantidad de fichas a voltear, para cada opción encontrada.
  int[] min, max; // Variables para guardar la mejor y la peor opción.

  /**
   * Constructor por default de un Tablero de 8x8 con tamaño de casilla 100px.
   */
  Tablero() {
    this(8, 8, 100);
  }

  /**
   * Constructor por default de un Tablero de 8x8.
   * @param tamano tamaño en pixeles de cada casilla cuadrada del tablero
   */
  Tablero(int tamano) {
    this(8, 8, tamano);
  }

  /**
   * Constructor principal de un tablero.
   * @param  ancho  anchura, en casillas, del tablero
   * @param  alto   altura, en casillas, del tablero
   * @param  tamano tamaño en pixeles de cada casilla cuadrada del tablero
   */
  Tablero(int ancho, int alto, int tamano) {
    this.ancho = ancho;
    this.alto = alto;
    this.tamano = tamano;
    mundo = new int[alto][ancho];
    for (int i = 0; i < this.alto; i++) {
      for (int j = 0; j < this.ancho; j++) {
        mundo[i][j] = 0;
      }
    }
    // Configuración inicial
    mundo[alto/2][ancho/2] = 1;
    mundo[alto/2-1][ancho/2] = 2;
    mundo[alto/2][ancho/2-1] = 2;
    mundo[alto/2-1][ancho/2-1] = 1;
  }

  /**
   * Constructor de copia para un Tablero.
   * @param mundo representa la configutación que será copiada para crear el nuevo Tablero
   */
  Tablero(int[][] mundo) {
    this(mundo, 100);
  }

  /**
   * Constructor de copia para un Tablero con tamaño de casilla personalizado.
   * @param mundo  representa la configutación que será copiada para crear el nuevo Tablero
   * @param tamano tamaño en pixeles de cada casilla cuadrada del tablero
   */
  Tablero(int[][] mundo, int tamano) {
    ancho = mundo[0].length;
    alto = mundo.length;
    this.tamano = tamano; 
    this.mundo = new int[mundo.length][mundo[0].length];
    for (int i = 0; i < alto; i++) {
      for (int j = 0; j < ancho; j++) {
        this.mundo[i][j] = mundo[i][j];
      }
    }
  }

  /**
   * Conversor de pixel a número de casilla dentro de un Tablero.
   * Útil al dar clic sobre la pantalla y determinar la posición (x ó y) en el Tablero.
   * @param n valor en pixel con respecto a la ventana
   * @return  entero que representa el número de casilla en el Tablero
   */
  int toTileInt(int n) {
    return floor(n/tamano);
  }

  /**
   * Cuenta la cantidad de discos/fichas de un determinado jugador en el Tablero.
   * @param  player identificador del jugador, es decir: 1 = Jugador 1, 2 = Jugador 2
   * @return        cantidad de discos/fichas en el tablero del jugador dado como parámetro 
   */
  int count(int player) {
    int total = 0;
    for (int i = 0; i < alto; i++) {
      for (int j = 0; j < ancho; j++) {
        if (mundo[i][j] == player) {
          total += 1;
        }
      }
    }
    return total;
  }
  
  /**
   * Establece o cambia un disco/ficha del tablero en la posición indicada.
   * Nota: no se realiza ninguna verificación sobre la posición o cambios en los demás discos
   * @param x      posición X en coordenadas del tablero (no en pixeles) donde se estable el disco
   * @param y      posición Y en coordenadas del tablero (no en pixeles) donde se estable el disco
   * @param player identificador del jugador, es decir: 1 = Jugador 1, 2 = Jugador 2
   */
  void setDisk(int x, int y, int player) {
    mundo[y][x] = player;
  }

  /**
   * Determina si la casilla seleccionada es válida para colocar un disco/ficha.
   * TODO: Realizar una validación más exhaustiva, por el momento solo revisa si la casilla es vacia
   * @param x posición X en coordenadas del tablero (no en pixeles) donde se valida la casilla
   * @param y posición Y en coordenadas del tablero (no en pixeles) donde se valida la casilla
   */
  boolean isValid(int x, int y) {
    if (mundo[y][x] == 4)
      return true;
    return false;
  }
  
  //--------------------------------------------------------------------------------------------------------
  //selecciona las casillas donde puedes poner tu ficha
  boolean permiso(int player ) {
    int x=0;
    int y=0;
    boolean para=false;
    boolean hayOpcion=false; // Indica si se encontró alguna opcion para moverse.
    opciones = new int[alto][ancho]; // Se reinician las opciones.
    //ver hacia la izquierda
    for(int i=0;i<alto;i++){
      for(int j=0;j<ancho;j++){
        if(mundo[i][j]==player){
          x=i;
          y=j;
          para=false;
         
          y--;
          if(y>0){
            if(mundo(x,y)!=0){
              if(mundo(x,y)!=player){
                while(para==false && mundo(x,y)!=player && mundo(x,y)!=4){
                  if(y>0){
                  y--;
                  if(mundo[x][y]==0 ){
                    mundo[x][y]=4;
                    opciones[x][y]+=j-y;
                    System.out.println("Valor para (" + x + "," + y + "): " + opciones[x][y]);
                    if(min==null || opciones[min[0]][min[1]] > opciones[x][y]) min = new int[]{x,y};
                    if(max==null || opciones[max[0]][max[1]] < opciones[x][y]) max = new int[]{x,y};
                    para=true; hayOpcion=true;  
                  }      
                 }else{
                 break;
                 }
              }
             }
         }
          }
     }
   }
    }
   //ver a la derecha 
    for(int i=0;i<alto;i++){
      for(int j=0;j<ancho;j++){
        if(mundo[i][j]==player){
          x=i;
          y=j;
          para=false;
          if(y!=7){
          y++;
            if(mundo(x,y)!=0){
              if(mundo(x,y)!=player){
                while(para==false && mundo(x,y)!=player && mundo(x,y)!=4){
                  y++;
                  if(y<7){
                  if(mundo[x][y]==0 ){
                    mundo[x][y]=4;
                    opciones[x][y]+=y-j;
                    System.out.println("Valor para (" + x + "," + y + "): " + opciones[x][y]);
                    if(min==null || opciones[min[0]][min[1]] > opciones[x][y]) min = new int[]{x,y};
                    if(max==null || opciones[max[0]][max[1]] < opciones[x][y]) max = new int[]{x,y};
                    para=true; hayOpcion=true;  
                  }      
                 }else{
                 break;
                 }
                }
              }
             }
          }
         }
     }
   }
   
   //ver hacia arriba 
    for(int i=0;i<alto;i++){
      for(int j=0;j<ancho;j++){
        if(mundo[i][j]==player){
          x=i;
          y=j;
          para=false;
          
          x--;
          if(x>0){
            if(mundo(x,y)!=0){
              if(mundo(x,y)!=player){
                while(para==false && mundo(x,y)!=player && mundo(x,y)!=4 ){
                  x--;
                  if(x>0){
                  if(mundo[x][y]==0 ){
                    mundo[x][y]=4;
                    opciones[x][y]+=i-x;
                    System.out.println("Valor para (" + x + "," + y + "): " + opciones[x][y]);
                    if(min==null || opciones[min[0]][min[1]] > opciones[x][y]) min = new int[]{x,y};
                    if(max==null || opciones[max[0]][max[1]] < opciones[x][y]) max = new int[]{x,y};
                    para=true; hayOpcion=true;  
                  }
                  }else{
                    break;
                }
                 }
                 
              }
             }
         }
     }
   }
    }
   
   
   //ver hacia abajo 
    for(int i=0;i<alto;i++){
      for(int j=0;j<ancho;j++){
        if(mundo[i][j]==player){
          x=i;
          y=j;
          para=false;
         
          x++;
          if(x<7){
            if(mundo(x,y)!=0){
              if(mundo(x,y)!=player){
                while(para==false && mundo(x,y)!=player && mundo(x,y)!=4){
                  
                  x++;
                  if(x<7){
                  if(mundo[x][y]==0 ){
                    mundo[x][y]=4;
                    opciones[x][y]+=x-i;
                    System.out.println("Valor para (" + x + "," + y + "): " + opciones[x][y]);
                    if(min==null || opciones[min[0]][min[1]] > opciones[x][y]) min = new int[]{x,y};
                    if(max==null || opciones[max[0]][max[1]] < opciones[x][y]) max = new int[]{x,y};
                    para=true; hayOpcion=true;  
                  }
                  } else para=true;
                 }
              }
             }
         }
     }
   }
    }
   
   
   //diagonal arriba  derecha
    for(int i=0;i<alto;i++){
      for(int j=0;j<ancho;j++){
        if(mundo[i][j]==player){
          x=i;
          y=j;
          para=false;
        
          y++;
          x--;
           if(y<7 && x>0){
            if(mundo(x,y)!=0){
              if(mundo(x,y)!=player){
                while(para==false && mundo(x,y)!=player && mundo(x,y)!=4){
                 
                  y++;
                  x--;
                 if(y<7 && x>0){ 
                  if(mundo[x][y]==0 ){
                    mundo[x][y]=4;
                    opciones[x][y]+=((y-j + i-x)/2);
                    System.out.println("Valor para (" + x + "," + y + "): " + opciones[x][y]);
                    if(min==null || opciones[min[0]][min[1]] > opciones[x][y]) min = new int[]{x,y};
                    if(max==null || opciones[max[0]][max[1]] < opciones[x][y]) max = new int[]{x,y};
                    para=true; hayOpcion=true;  
                  }      
                 }else{
                   break;
                 }
                }
              }
             }
         }
         }
     }
   }
   
   
    //diagonal abajo izquierda
    for(int i=0;i<alto;i++){
      for(int j=0;j<ancho;j++){
        if(mundo[i][j]==player){
          x=i;
          y=j;
          para=false;
          
          y--;
          x++;
          if(y>0 && x<7){
            if(mundo(x,y)!=0){
              if(mundo(x,y)!=player){
                while(para==false && mundo(x,y)!=player && mundo(x,y)!=4){
                  
                  y--;
                  x++;
                  if(x<7 && y>0){
                  if(mundo[x][y]==0 ){
                    mundo[x][y]=4;
                    opciones[x][y]+=((j-y + x-i)/2);
                    System.out.println("Valor para (" + x + "," + y + "): " + opciones[x][y]);
                    if(min==null || opciones[min[0]][min[1]] > opciones[x][y]) min = new int[]{x,y};
                    if(max==null || opciones[max[0]][max[1]] < opciones[x][y]) max = new int[]{x,y};
                    para=true; hayOpcion=true;  
                  }      
                  }
                  else{
                  break;
                  }
               }
                 
              }
             }
          }
         }
     }
   }
   
   
   
    //diagonal abajo derecha
    for(int i=0;i<alto;i++){
      for(int j=0;j<ancho;j++){
        if(mundo[i][j]==player){
          x=i;
          y=j;
          para=false;
          y++;
          x++;
          if(x<7 && y<7 ){
            if(mundo(x,y)!=0){
              if(mundo(x,y)!=player){
                while(para==false && mundo(x,y)!=player && mundo(x,y)!=4){
                  y++;
                  x++;
                  if(x<7 && y<7 ){
                  if(mundo[x][y]==0 ){
                    mundo[x][y]=4;
                    opciones[x][y]+=((y-j + x-i)/2);
                    System.out.println("Valor para (" + x + "," + y + "): " + opciones[x][y]);
                    if(min==null || opciones[min[0]][min[1]] > opciones[x][y]) min = new int[]{x,y};
                    if(max==null || opciones[max[0]][max[1]] < opciones[x][y]) max = new int[]{x,y};
                    para=true; hayOpcion=true;  
                  }
                  }else{
                  break;
                  }
                 }
              }
             }
         }
     }
   }
    }
   
   
   //diagonal arriba  izquierda
    for(int i=0;i<alto;i++){
      for(int j=0;j<ancho;j++){
        if(mundo[i][j]==player){
          x=i;
          y=j;
          para=false;
          y--;
          x--;
          if(x>0 && y>0){
            if(mundo(x,y)!=0){
              if(mundo(x,y)!=player){
                while(para==false && mundo(x,y)!=player && mundo(x,y)!=4){
                  y--;
                  x--;
                  if(x>0 && y>0){
                  if(mundo[x][y]==0 ){
                    mundo[x][y]=4;
                    opciones[x][y]+=((j-y + i-x)/2);
                    System.out.println("Valor para (" + x + "," + y + "): " + opciones[x][y]);
                    if(min==null || opciones[min[0]][min[1]] > opciones[x][y]) min = new int[]{x,y};
                    if(max==null || opciones[max[0]][max[1]] < opciones[x][y]) max = new int[]{x,y};
                    para=true; hayOpcion=true;  
                  }
                  }else{
                  break;
                  }
                 }
              }
             }
         }
     }
   }
    }
   return hayOpcion;   
  }
  
  //--------------------------------------------------------------------------------------------------------------------------------------------
  //cambia las fichas de diferente color deacuerdo a las reglas del juego
  
  void cambia(int a, int b,int player){
      int x=a;
    int y=b;
    boolean camb=false;
    //cambia izquierda 
    
   x--;
   if(x>0){
    //-------analisis
    
   while(mundo(y,x)!=0){
     if(mundo[y][x]==player){
       camb=true;
      break;
     }else{
       x--;
     camb=false;
     }
    }
    
    
    
    //----fin del analisis
    y=b;
   x=a;
   x--;
   if(camb==true){
    
   while(mundo(y,x)!=player ){
     if(mundo[y][x]==player || mundo[y][x]==0 || mundo[y][x]==4){
       break;
     }else{
     tablero.setDisk(x,y,player); 
       x--;
      System.out.println("--dentro del while---"+x); 

    }
   }
  }
    }
  //------------------------------------------------------------fin
  //derecha
      camb=false;
      x=a;
     y=b;
     
   x++;
   if(x<7){
   //------analiza
   
   
   while(mundo(y,x)!=0 && mundo(y,x)!=4){
     if(mundo[y][x]==player){
       camb=true;
      break;
     }else{
       x++;
     camb=false;
     }
    }
   
  //-----------fin analisis
   y=b;
   x=a;
   x++;
   if(camb==true){
   while(mundo(y,x)!=player ){
     if(mundo[y][x]==player || mundo[y][x]==0){
       break;
     }else{
     tablero.setDisk(x,y,player); 
       x++;
      System.out.println("--dentro del while---"+x); 

    }
   //}
  }
  }
  }
  //---------------------------------------------------------------fin
  //arriba
    camb=false;
      x=a;
     y=b;
    //__________analisis
    
    y--;
    if(y>0){
    while(mundo(y,x)!=0 && mundo(y,x)!=4){
     if(mundo[y][x]==player){
       camb=true;
      break;
     }else{
       y--;
     camb=false;
     }
    }
    //__________
   y=b;
   x=a;
   y--;
   
   if(camb==true){
   while(mundo(y,x)!=player ){
     if(mundo[y][x]==player || mundo[y][x]==0){
       break;
     }else{
     tablero.setDisk(x,y,player); 
       y--;
      System.out.println("--dentro del while---"+x); 

    }
   //}
  }
}
}
  //---------------------------------------------------------fin
  
  //abajo
      camb=false;
      x=a;
     y=b;
   if(y<7){ 
   y++;
   //---------analisis
   
    
    while(mundo(y,x)!=0 && mundo(y,x)!=4){
     if(mundo[y][x]==player){
       camb=true;
      break;
     }else{
       y++;
     camb=false;
     }
    }
   
   
   
   //---------fin del analisis
   
   y=b;
   x=a;
   y++;
   
   if(camb==true){
   while(mundo(y,x)!=player ){
     if(mundo[y][x]==player || mundo[y][x]==0){
       break;
     }else{
     tablero.setDisk(x,y,player); 
       y++;
      System.out.println("--dentro del while---"+x); 

    }
   //}
  }
  }
  }
  //---------------------------------------------------------fin
  
  
    //abajo  derecha
      camb=false;
      x=a;
     y=b;
    if(y!=7 && x!=7 ){
   y++;
   x++;
   //---------analisis
   
    
    while(mundo(y,x)!=0 && mundo(y,x)!=4){
     if(mundo[y][x]==player){
       camb=true;
      break;
     }else{
       y++;
       x++;
     camb=false;
     }
    }
   
   
   
   //---------fin del analisis
   
   y=b;
   x=a;
   y++;
   x++;
   
   if(camb==true){
   while(mundo(y,x)!=player ){
     if(mundo[y][x]==player || mundo[y][x]==0){
       break;
     }else{
     tablero.setDisk(x,y,player); 
       y++;
       x++;
      System.out.println("--dentro del while---"+x); 

    }
   //}
  }
  }
  }
  //---------------------------------------------------------fin
  
  
  
  
  
  
  //abajo  izquierda
      camb=false;
      x=a;
     y=b;
    if(x!=0 && y!=7 ){
   y++;
   x--;
   //---------analisis
   
    
    while(mundo(y,x)!=0 && mundo(y,x)!=4){
     if(mundo[y][x]==player){
       camb=true;
      break;
     }else{
       y++;
       x--;
     camb=false;
     }
    }
   
   
   
   //---------fin del analisis
   
   y=b;
   x=a;
   y++;
   x--;
   
   if(camb==true){
   while(mundo(y,x)!=player ){
     if(mundo[y][x]==player || mundo[y][x]==0){
       break;
     }else{
     tablero.setDisk(x,y,player); 
       y++;
       x--;
      System.out.println("--dentro del while---"+x); 

    }
   //}
  }
  }
  }
  //---------------------------------------------------------fin
    
    
    
    //arriba  izquierda
      camb=false;
      x=a;
     y=b;
     if(x>0 && y>0 ){ 
   y--;
   x--;
   //---------analisis
   
    
    while(mundo(y,x)!=0 && mundo(y,x)!=4){
     if(mundo[y][x]==player){
       camb=true;
      break;
     }else{
       y--;
       x--;
     camb=false;
     }
    }
   
   
   
   //---------fin del analisis
   
   y=b;
   x=a;
   y--;
   x--;
   
   if(camb==true){
   while(mundo(y,x)!=player ){
     if(mundo[y][x]==player || mundo[y][x]==0){
       break;
     }else{
     tablero.setDisk(x,y,player); 
       y--;
       x--;
      System.out.println("--dentro del while---"+x); 

    }
   //}
  }
  }
  }
  //---------------------------------------------------------fin
    
    
    //arriba  derecha
      camb=false;
      x=a;
     y=b;
    if(y!=0 && x!=7){
   y--;
   x++;
   //---------analisis
   
    
    while(mundo(y,x)!=0 && mundo(y,x)!=4){
     if(mundo[y][x]==player){
       camb=true;
      break;
     }else{
       y--;
       x++;
     camb=false;
     }
    }
   
   
   
   //---------fin del analisis
   
   y=b;
   x=a;
   y--;
   x++;
   
   if(camb==true){
   while(mundo(y,x)!=player ){
     if(mundo[y][x]==player || mundo[y][x]==0){
       break;
     }else{
     tablero.setDisk(x,y,player); 
       y--;
       x++;
      System.out.println("--dentro del while---"+x); 

    }
   //}
  }
  }
  }
  //---------------------------------------------------------fin
    
    
    
    for(int i=0;i<alto;i++){
      for(int j=0;j<ancho;j++){
        if(mundo[i][j]==4){
          mundo[i][j]=0;    
          }
  
      }
     }
    
    
    
    
  }
    
  void imprimeTab(){
     for(int i=0;i<alto;i++){
      System.out.println("");
       for(int j=0;j<ancho;j++){
        
         System.out.print(mundo[i][j]);    
          
  
      }
     }
    
  }
  
  

  /**
   * Dibuja una representación gráfica del tablero en la ventana de Processing. 
   */
  void display() {
    for (int i = 0; i < alto; i++) {
      for (int j = 0; j < ancho; j++) {
        // Dibujar las casillas del tablero:
        fill(77, 132, 75);
        stroke(255);
        rect(j * tamano, i * tamano, tamano, tamano);
        // Dibujar los discos/fichas del tablero:
        if (mundo[i][j] == 1) {
          fill(p1Color);
          noStroke();
          ellipse((j*tamano)+(tamano/2), (i*tamano)+(tamano/2), tamano/2, tamano/2);
        } else if (mundo[i][j] == 2) {
          fill(p2Color);
          noStroke();
          ellipse((j*tamano)+(tamano/2), (i*tamano)+(tamano/2), tamano/2, tamano/2);
        }else if (mundo[i][j] == 4) {
          fill(p3color);
          noStroke();
          ellipse((j*tamano)+(tamano/2), (i*tamano)+(tamano/2), tamano/2, tamano/2);
        }
      }
    }
  }

  public int mundo(int y, int x) {
    return mundo[(y+alto)%alto][(x+ancho)%ancho];
  }
}
