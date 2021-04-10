
import oscP5.*;
import java.awt.*;
import java.awt.Toolkit;


OscP5 oscP5;
Robot bob;  

PImage img;
PImage bg;
PImage grass;
float carX;
float carY;
float speed;
float concentration;
float stripeX;
float score;
float currentAttention;
int currentScene;
int mp;
float time;
boolean loop = true;

Camera worldCamera;
void setup() {
  size(800, 600);
  img = loadImage("sprite6.png");
  carX = 30;
  speed = 0.1;
  concentration = 0;
  stripeX = 10;
  worldCamera = new Camera();
  score = 0;
  bg = loadImage("bg3.jpg");
  grass = loadImage("grass2.jpg");
  carY = height/2;
  mp = 1;
  oscP5 = new OscP5(this, 7771); // Start listening for incoming messages at port 7771

  try { // Try and create a new robot named bob
    bob = new Robot();
  }
  catch (AWTException e) { // If there is an error, print it out to the console
    e.printStackTrace();
  }
}
void draw() {
  switch(mp) {
  case 1: 
    Scene1();
    break;
  case 2:

    Scene2();

    break;
  case 3: 
    Scene3();
    break;
  default: 
    Scene1();
  }
}
void mousePressed() {
  switch(mp) {
  case 1: 
    mp = 2;
    break;
  case 3:
    System.exit(0);
    break;
  }
}

void oscEvent(OscMessage theMessage) {
  // Print the address and typetag of the message to the console
  // println("OSC Message received! The address pattern is " + theMessage.addrPattern() + ". The typetag is: " + theMessage.typetag());

  // Check for Attention messages only
  //println(theMessage);
  /*if (theMessage.checkAddrPattern("/signal") == true) {
   currentSignal = theMessage.get(0).floatValue();
   println("The signal quality is at: " + currentSignal);
   }*/

  if (theMessage.checkAddrPattern("/attention") == true) {
    currentAttention = theMessage.get(0).floatValue();
    println("Your attention is at: " + currentAttention);
  }
}
