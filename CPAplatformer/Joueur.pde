class Joueur extends Rectangle{
  float forceDeSaut = 400;
  float frottement = 0.9;
  float vitesseMaxX = 300;
  float vitesseMaxY = 500;
  
  boolean estEnTrainDeSauter = false;
  
  Joueur(float x, float y, float w_, float h_){
   super(x, y ,w_, h_); 
  }
  
  void calculeDeplacement(float dt){
    // Application de la gravité
    vitesse.add(PVector.mult(gravite, dt));
    // Application des frottements avec le sol
    vitesse.x *= frottement;
    // Déplacement de la position
    appliqueLaVitesse(dt);
  }
  
  void setVitesse(PVector newVitesse){
    vitesse.x = constrain(newVitesse.x, -vitesseMaxX, vitesseMaxX);
    vitesse.y = constrain(newVitesse.y, -vitesseMaxY, vitesseMaxY);
  }
  
  void saute(){
    if( !estEnTrainDeSauter ){
      estEnTrainDeSauter = true;
      vitesse.y = -forceDeSaut;
    }    
  }
  
  void checkEtResoudCollisionAvec(Rectangle rect){
    float distGauche = distanceAuCoteGaucheDe(rect);
    float distDroite = distanceAuCoteDroitDe(rect);
    float distHaut   = distanceAuCoteHautDe(rect);
    float distBas    = distanceAuCoteBasDe(rect);
    
    if( distGauche < 0 && distDroite < 0 && distHaut < 0 && distBas < 0){
      float distCol = max(max(max(distGauche, distDroite), distHaut), distBas);
      if( distCol ==  distGauche){
        centre.x += distGauche*(1+EPSILON);
        vitesse.x = max(0, vitesse.x);
      }
      else if (distCol ==  distDroite) {
        centre.x -= distDroite*(1+EPSILON);
        vitesse.x = min(0, vitesse.x);
      }
      else if (distCol == distHaut){
        centre.y += distHaut*(1+EPSILON);
        estEnTrainDeSauter = false;
        vitesse.y = min(0, vitesse.y);
      }
      else{
        centre.y -= distBas*(1+EPSILON);
        vitesse.y = max(0, vitesse.y);
      }
    }
  }
}
