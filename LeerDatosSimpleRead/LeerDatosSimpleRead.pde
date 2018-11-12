/**
 * Leer Datos Simple Read
 * Traducido del ejemplo SimpleRead de Processing
 * 
 * Lee datos del puerto serial y cambia el color de un rectángulo
 * cuando un switch conectado al arduino es presionado y soltado.
 * Este ejemplo funciona con el programa Arduino disponible abajo.
 */


import processing.serial.*;

Serial myPort;  // Crea objeto de la clase Serial 
int val;      // Datos recibidos del puerto Serial

void setup() 
{
  size(200, 200);
  printArray(Serial.list()); // permite imprimir la lista de puertos seriales
  String portName = Serial.list()[0]; // hay que elegir el puerto que se utiliza
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  if ( myPort.available() > 0) {  //Si hay datos disponibles,
    val = myPort.read();         // leerlos y guardarlos en val
  }
  background(255);             // Cambiar el fondo a blanco
  if (val == 0) {              // Si el valor serial es 0,
    fill(0);                   // El relleno es negro
  } 
  else {                       // Si el valor serial no es 0,
    fill(204);                 // El relleno es gris
  }
  rect(50, 50, 100, 100);
}



/*

// Código de Arduino
// Código para sensar el estado de un switch y enviar el valor al puerto serial

int switchPin = 4;                       // Switch conectado al pin 4

void setup() {
  pinMode(switchPin, INPUT);             // Define el pin 0 como input
  Serial.begin(9600);                    // Inicia la comunicación serial a 9600 bps
}

void loop() {
  if (digitalRead(switchPin) == HIGH) {  // Si el switch está ON,
    Serial.write(1);               // enviar 1 a Processing
  } else {                               // si el switch no está ON,
    Serial.write(0);               // enviar 0 a Processing
  }
  delay(100);                            // esperar 100 millisegundos
}

*/
