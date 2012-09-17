/**
 * Multivalue Read
 * 
 * Read comma separated value from the serial port 
   and change the color of rectangles.
   
 */


import processing.serial.*;  // Import Serial class library
Serial myPort;  // Create object from Serial class



float val1 = 0;
float val2 = 0;

void setup() 
{
  size(400, 400);
 
  //for Windows
  //String portName = "COM97"; //change this port the same name as Arduino->Tool->Serial Port
  //for Mac OSX
  String portName = Serial.list()[0]; //the first port
   
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); // buffer incoming characters until line feed.
}

//serialEvent function is called when incoming character reaches '\n'
void serialEvent(Serial p){
  String s = "";        // string value received.
  String[] values;      // splitted string values.
  
  if(p.available() > 0){  // check number of characters in the serial buffer 
    s = p.readString();   // read string.
    if(s != null){ 
      println("received:"+s);
      
      values = s.split(",");     // separate values with ',' characters.
      println(values);           
      
      val1 = float(values[0]);
      val2 = float(values[1]);
    }
  }
}

void draw()
{
  background(255);             // Set background to white                   // change fill color
  fill(val1);
quad(80,200,100,100,160,100,200,200);// top part1
quad(200,200,240,100,300,100,320,200);//top part2
  fill(val2); 
  quad(80,200,140,200,120,300,60,300);// bottom 1;
quad(140,200,260,200,230,260,170,260);//bpttom 2
quad(260,200,320,200,340,300,280,300);// bottom 3;

}

/**

Forming a 'M' with 5 quadrilateral.
sia carling 24/8/12
a0075221@nus.edu.sg
*/

