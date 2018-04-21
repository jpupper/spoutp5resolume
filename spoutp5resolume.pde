// IMPORT THE SPOUT LIBRARY
import spout.*;

// DECLARE A SPOUT OBJECT
Spout spout;

// CONTROL ARRAYS
String[] controlName;
int[] controlType;
float[] controlValue;
String[] controlText;


float r, g, b;
boolean rectoellipse = true;
String text;
void setup() {

  size(600, 600, P2D);
  // CREATE A NEW SPOUT OBJECT
  spout = new Spout(this);

  spout.createSender("spoutp5resolume");
  spout.openSpoutControls("spoutp5resolume");
   // CREATE CONTROL ARRAYS
  controlName = new String[20];
  controlType = new int[20];
  controlValue = new float[20];
  controlText = new String[20];
  
  r = 100;
  g = 200;
  b = 50;
  text = "Valor inicial";
  
}

void draw() {
  checkControls();
  //Feedback
  fill(0, 5);
  rectMode(CORNER);
  rect(0, 0, width, height);

  //Dibujo principal:
  fill(r, g, b);
  if (rectoellipse) {
    ellipse(mouseX, mouseY, 100, 100);
  } else {
    rectMode(CENTER);
    rect(mouseX, mouseY, 100, 100);
  }
  textSize(30);
  text(text,50,50);
  spout.sendTexture();
}


void checkControls() {
  // CHECK FOR UPDATED CONTROLS FROM THE CONTROLLER
  int nControls = spout.checkSpoutControls(controlName, controlType, controlValue, controlText);
  if (nControls > 0) {
    // For all controls
    for (int i = 0; i < nControls; i++) {
   
      if (controlName[i].equals("User text")) {
        if (controlText[i] != null && !controlText[i].isEmpty())
          text = controlText[i];
      }
      
      if (controlName[i].equals("red")){
        r = controlValue[i];
      }
      if (controlName[i].equals("green")){
        g = controlValue[i];
      }
      if (controlName[i].equals("blue")){
        b = controlValue[i];
      }
      if (controlName[i].equals("Rectoellipse")){
        rectoellipse = (boolean)(controlValue[i] == 1);
      }
    }
  }
}