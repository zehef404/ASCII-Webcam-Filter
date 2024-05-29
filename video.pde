import processing.video.*;

Capture cam;
int colorspace = GRAY ;
boolean recording = false;
PImage[] frames = new PImage[500]; 
// Objet de capture vidéo
PImage[] pixelImages = new PImage[10]; // Tableau pour stocker vos 10 images PIXEL
int scaleFactor = 3; // Facteur d'échelle pour agrandir l'ASCII art
//int blend_mode = SCREEN; 
void setup() {
  size(1000, 800);
 
 
 // size(1000, 800);
 


 
 // videoExport = new VideoExport(this, "output.mp4");
 

 // videoExport.setMovieFile("output.mp4"); // Remplacez "output.mp4" par le nom de votre fichier de sortie
//  videoExport.setFrameRate(30);
  
  // VideoExport = new export(this, width, height, "output.mp4", 30);
//  VideoExport.start();
 //movie = new MovieMaker(this, width/3, height/3, "output.mp4", 30, MovieMaker.H264, MovieMaker.AAC, 192);
//movie.start();
  cam = new Capture(this, width/3, height/3); // Initialiser la capture vidéo
  cam.start(); // Démarrer la capture vidéo
  
  // Charger vos images personnalisées PIXEL_01, PIXEL_02, ..., PIXEL_10
  for (int i = 0; i < 10; i++) {
    pixelImages[i] = loadImage("PIXEL_" + nf(i + 1, 2) + ".jpg");
  }
  
  
}

void draw() {
  frameRate(60);
  background(248,43,209);
   if (cam.available()) {
    cam.read();
    

    cam.loadPixels();
  //if (cam.available()) {
  //  cam.read(); // Lire une image de la webcam
   
  //  cam.loadPixels(); // Charger les pixels de l'image capturée
    
    for (int y = 0; y < cam.height; y++) {
      for (int x = 0; x < cam.width; x++) {
        int loc = x + y * cam.width; // Calculer la position du pixel dans le tableau des pixels
        color c = cam.pixels[loc]; // Obtenir la couleur du pixel de la webcam
        float grayValue = brightness(c); // Calculer la luminosité du pixel
        int index = int(map(grayValue, 60, mouseX, 0, 10)); // Mapper la luminosité aux images PIXEL_
       
        index = constrain(index, 0, 9);
       
        // Afficher l'image PIXEL_ correspondante à la luminosité
        PImage customImage = pixelImages[index];
     //  filter(SCREEN);
        //image(customImage, x * customImage.width, y * customImage.height, customImage.width, customImage.height);
   // image(customImage, x * customImage.width * scaleFactor, y * customImage.height * scaleFactor, customImage.width * scaleFactor, customImage.height * scaleFactor);
  image(customImage, x * customImage.width / scaleFactor, y * customImage.height / scaleFactor, customImage.width / scaleFactor, customImage.height / scaleFactor);

    }
    
    }
  }
  
    }
    void mousePressed() {
//  float omega = map(mouseX, 0, width, 0, 1);
//  omega = map(sqrt(omega), 0, 1, min_omega, max_omega);
//  float phase = map(mouseY, 0, height, 0, 1);
//  phase = map(sq(phase), 0, 1, min_phase_mult, max_phase_mult);
//  float max_phase = phase * omega;
 // println("Carrier: 2PI * t * " + (customImage/TWO_PI));
 // println("Phase shift (max signal amplitude): " + grayValue);
  
//  fixed_setup = !fixed_setup;
//  if(fixed_setup) println("Setup is fixed now."); else println("Move your mouse to change setup.");
  
}


//final static int[] blends = {
  //ADD, SUBTRACT, DARKEST, LIGHTEST, DIFFERENCE, EXCLUSION, MULTIPLY, SCREEN, OVERLAY, HARD_LIGHT, SOFT_LIGHT, DODGE, BURN
