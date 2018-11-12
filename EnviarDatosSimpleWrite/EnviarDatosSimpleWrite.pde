/**
 * Enviar Datos (Simple Write). 
 * Traducido del ejemplo Simple Write de Processing
 * Si el mouse está sobre un rectángulo envía el estado al puerto serial.
 * Este ejeemplo incluye el código de Arduino en la parte de abajo.
 */


import processing.serial.*;

Serial myPort;  // Crea un objeto de la clase serial
int val;        

void setup() 
{
  size(200, 200);
  printArray(Serial.list()); // permite imprimir la lista de puertos seriales
  String portName = Serial.list()[0]; // hay que elegir el puerto que se utiliza
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(255);
  if (mouseSobreRect() == true) {  // Si el mouse está sobre el rect,
    fill(204);                    // cambia el color y
    myPort.write('H');              // envía una H para indicar que el mouse está sobre el rect
  } 
  else {                        // Si el mouse no está sobre el rect,
    fill(0);                      // cambia el color y 
    myPort.write('L');              // envía una L
  }
  rect(50, 50, 100, 100);         // Dibuja un cuadrado
}

boolean mouseSobreRect() { // TPrueba si el mouse está sobre el rect
  return ((mouseX >= 50) && (mouseX <= 150) && (mouseY >= 50) && (mouseY <= 150));
}


/*
  //Código Arduino:
 // Lee los datos del puerto serial y enciende o apaga una luz dependiendo del valor
 
 char val; // Datos recividos del puerto serial
 int ledPin = 4; 
 
 void setup() {
 pinMode(ledPin, OUTPUT); // Declara el pin como OUTPUT
 Serial.begin(9600); // Inicia la comunicación serial a 9600 bps
 }
 
 void loop() {
 while (Serial.available()) { // Si hay datos que se puedan leer
 val = Serial.read(); // leerlos y guardarlos en val 
 }
 if (val == 'H') { // Si recibe H 
 digitalWrite(ledPin, HIGH); // encienda el LED
 } else {
 digitalWrite(ledPin, LOW); // si no apaguelo
 }
 delay(100); // espere 100 millisegundos para la siguiente lectura
 }
 
 */
