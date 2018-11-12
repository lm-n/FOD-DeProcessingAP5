/**
 * Pastel 
 * 
 * utiliza arc() para generar gráfico basado
 * en datos guardados en colección. 
 */

int[] angls = { 30, 10, 45, 35, 60, 38, 75, 67 };
float diametro = 300;

void setup() {
  size(640, 360);
  noStroke();
  noLoop();  // Corre el codigo solo una vez
}

void draw() {
  background(100);
  
  float ultAngl = 0;
  for (int i = 0; i < angls.length; i++) {
    float rojo = map(i, 0, angls.length, 0, 255);
    fill(rojo,0,0);
    arc(width/2, height/2, diametro, diametro, ultAngl, ultAngl+radians(angls[i]));
    ultAngl += radians(angls[i]);
  }
}
