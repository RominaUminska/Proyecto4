import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import processing.sound.*;

float DETECT_SCALE = 1.2;
int DETECT_MINNEIGHBOURS = 7;
int DETECT_MINSIZE = 0;
int DETECT_MAXSIZE = 0;

Capture video;
OpenCV opencv;
Rectangle[] faces;
PImage portada;
PImage lados;
PImage calavera;
PImage calavera2;
PImage calavera3;
SoundFile intro;
int gameScreen;
int filtro;

void setup() {
  size(640, 480);
  frameRate(30);
  portada = loadImage("portada2.jpg");
  lados = loadImage("TAMAÑO2.png");
  calavera = loadImage("CALAVERA.png");
  calavera2 = loadImage("CALAVERA2.png");
  calavera3 = loadImage("CALAVERA3.png");
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  video = new Capture(this, 640, 480);
  video.start();
  ppal = new Pantalla();
  intro = new SoundFile(this, "Spookster_R.mp3");
}

void draw() {
  ppal.display();
}

Pantalla ppal;
