PVector gravite = new PVector(0, 400);

color backgroundCol = color(255);
ArrayList<Rectangle> decors = new ArrayList<Rectangle>();
Joueur joueur;

KeyDownManager keyDownManager = new KeyDownManager();

void setup(){
  size(800,800);
  joueur = new Joueur(width/2, height/2, 40, 120);
  // Sol
  decors.add(new Rectangle(width/2, height+500, width, 1000));
  // Mur gauche
  decors.add(new Rectangle(-500, height, 1000, 2*height));
  // Mur droit
  decors.add(new Rectangle(width+500, height, 1000, 2*height));
  // Plateformes
  for( int k = 0; k < 10; ++k )
    decors.add(new Rectangle(random(width), random(height), random(50, 300), 30));
}

void draw(){
  background(backgroundCol);
  // Deplacement
  joueur.calculeDeplacement(1./frameRate);
  // Check collisions
  for( Rectangle rect : decors){
    rect.affiche();
    joueur.checkEtResoudCollisionAvec(rect);
  }
  // Affichage
  joueur.affiche();
  
  // Controle avec les touches
  if( keyPressed){
    if( keyDownManager.isDown(' ')){
      joueur.saute();
    }
    if( keyDownManager.isDown('d') ){
      joueur.setVitesse(PVector.add(joueur.vitesse, new PVector(100, 0)));
    }  
    if( keyDownManager.isDown('q') ){
      joueur.setVitesse(PVector.add(joueur.vitesse, new PVector(-100, 0)));
    }
  }
  
}



void keyPressed(){
  keyDownManager.onKeyDown();
}
void keyReleased(){
  keyDownManager.onKeyUp();
}
