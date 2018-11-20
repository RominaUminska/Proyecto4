class Pantalla {

  void startGame() {
    gameScreen=1;
  }

  void inicio() {

    image(portada, 0, 0);
    intro.loop();
    if (mousePressed) {
      gameScreen=1;
      filtro = 1;
    }
  }
  void filtro() {
    if (video.available()==true) {
      video.read();
    }

    image(video, 0, 0);
    opencv.loadImage(video);
    opencv.useColor();
    faces = opencv.detect(DETECT_SCALE, DETECT_MINNEIGHBOURS, 0, DETECT_MINSIZE, DETECT_MAXSIZE);
    noStroke();
    fill(79, 56, 100, 99);
    rect(0, 0, 640, 480);
    image(lados, 0, 0);

    for (int i = 0; i<faces.length; i++) {

      if ((key=='a') || (key == 'A') ) {
        pushMatrix();
        translate(-277, -180);
        image(calavera, faces[i].x, faces[i].y);
        popMatrix();
        filtro=1;
      } else if ((key=='b') || (key == 'B') ) {
        pushMatrix();
        translate(-277, -180);
        image(calavera2, faces[i].x, faces[i].y);
        popMatrix();
        filtro=2;
      } else if ((key=='c') || (key == 'C') ) {
        pushMatrix();
        translate(-277, -180);
        image(calavera3, faces[i].x, faces[i].y);
        popMatrix();
      }
    }

    textSize(10);
    fill(255);
    text("PRESIONA A B o C PARA CAMBIAR EL FILTRO", 230, 420);
  }

  void display() {
    switch(gameScreen) {
    case 0:
      inicio();
      break;
    case 1:
      filtro();
      break;
    }
  }

  void captureEvent(Capture c) {
    c.read();
  }
}
