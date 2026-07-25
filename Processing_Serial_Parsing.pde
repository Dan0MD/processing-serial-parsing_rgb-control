int byte_speed = 9600;


import processing.serial.*;
Serial serial;
import controlP5.*;
ControlP5 cp5;
String portName;
boolean skip = true;
boolean enable = false;
//============================
int bSize_x;
int bSize_y;
int xPercent1;
int xPercent5;
int xPercent10;
int xPercent50;
int yPercent1;
int yPercent5;
int yPercent10;
int yPercent50;
int Speed = 0;
int Last_Speed = 0;
int RED = 0;
int Last_RED = 0;
int GREEN = 0;
int Last_GREEN = 0;
int BLUE = 0;
int Last_BLUE = 0;
//========== colors ============
  color red= #f50000;
  color orange= #ff7a00;
  color yellow= #ffff00;
  color green= #00ff00;
  color darkgreen= #007a00;
  color blue= #0000ff;
  color purple= #ff00ff;
  color violet= #b700ff;
  color pink= #ff007a;
//=======================
void setup() {
  size(600, 400);
    SET_SIZES();
    setupGUI();

}
//===========================================================================
void draw() {
  background(orange);
  SERIAL_SEND();
}

//========================================================================
void SERIAL_SEND(){
  if(enable){
    if(RED != Last_RED){
      println(RED);
      serial.write("0, ");
      serial.write(RED);
      serial.write("; ");
      Last_RED = RED;
    }
    if(GREEN != Last_GREEN){
      println(GREEN);
      serial.write("1, ");
      serial.write(GREEN);
      serial.write("; ");
      Last_GREEN = GREEN;
    }
    if(BLUE != Last_BLUE){
      println(BLUE);
      serial.write("2, ");
      serial.write(BLUE);
      serial.write("; ");
      Last_BLUE = BLUE;
    }
  }
}
//========================================================================
void SET_SIZES(){
    xPercent1 = width/100;
    xPercent5 = width/20;
    xPercent10 = width/10;
    xPercent50 = width/2;
    yPercent1 = height/100;
    yPercent5 = height/20;
    yPercent10 = height/10;
    yPercent50 = height/2;
    bSize_x = xPercent10 + yPercent5;
    bSize_y = yPercent5; 
}
// ==================== Interface Initializating ====================
void setupGUI() {
  cp5 = new ControlP5(this);
  cp5.setFont(createFont("Calibri", 15));  // сделаем шрифт побольше

  // выпадающий список
  cp5.addScrollableList("com")
    .setPosition(0, 0)
    .setSize(bSize_x, bSize_y * 4)
    .setBarHeight(bSize_y)
    .setItemHeight(bSize_y)
    .close()
    .addItems(Serial.list());    
  ;
  
  cp5.addSlider("RED")
     .setPosition(xPercent10, yPercent10 * 4)
     .setSize(255, yPercent10)
     .setRange(0,255)
     ;
     
  cp5.addSlider("GREEN")
     .setPosition(xPercent10, yPercent10 * 6)
     .setSize(255, yPercent10)
     .setRange(0,255)
     ;
     
  cp5.addSlider("BLUE")
     .setPosition(xPercent10, yPercent10 * 8)
     .setSize(255, yPercent10)
     .setRange(0,255)
     ;

  // добавляем кнопки
  cp5.addButton("open").setPosition(bSize_x, 0).setSize(bSize_x, bSize_y);
  cp5.addButton("close").setPosition(bSize_x * 2, 0).setSize(bSize_x, bSize_y);
  
}


// ==================== Interface Processing ====================


//===== Com Ports List =====
void com(int n) {
  portName = Serial.list()[n];  // запоминаем выбранный порт в portName
}

//===== Open Port Button =====
void open() {
  if (portName != null && serial == null) {     // если выбран порт и сейчас он закрыт
    serial = new Serial(this, portName, byte_speed); // открываем portName
    skip = true;    // флаг на пропуск первого пакета
    enable = true;
  }
}

//===== Close Port Button =====
void close() {
  if (serial != null) { // если порт открыт
    serial.stop();      // закрываем portName
    serial = null;      // serial выключен
    enable = false;
  }
}
