/**
 * Funciones con el mouse. 
 * 
 * Haga clic en el cuadro y arrástrelo en la pantalla. 
 */
 
float cuadX;
float cuadY;
int tam = 75;
boolean sobreCuad = false;
boolean agarrado = false;
float xDist = 0.0; 
float yDist = 0.0; 

void setup() {
  size(640, 360);
  cuadX = width/2.0;
  cuadY = height/2.0;
  rectMode(RADIUS);  
}

void draw() { 
  background(0);
  
  // Test if the cursor is over the box 
  if (mouseX > cuadX-tam && mouseX < cuadX+tam && 
      mouseY > cuadY-tam && mouseY < cuadY+tam) {
    sobreCuad = true;  
    if(!agarrado) { 
      stroke(255); 
      fill(153);
    } 
  } else {
    stroke(153);
    fill(153);
    sobreCuad = false;
  }
  
  // Dibuja el cuadrado
  rect(cuadX, cuadY, tam, tam);
}

void mousePressed() {
  if(sobreCuad) { 
    agarrado = true; 
    fill(255, 255, 255);
  } else {
    agarrado = false;
  }
  xDist = mouseX-cuadX; 
  yDist = mouseY-cuadY; 

}

void mouseDragged() {
  if(agarrado) {
    cuadX = mouseX-xDist; 
    cuadY = mouseY-yDist; 
  }
}

void mouseReleased() {
  agarrado = false;
}
