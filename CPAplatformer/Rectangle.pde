class Rectangle{
  PVector centre;
  PVector vitesse = new PVector(0,0);
  float L;
  float H;
  color col = CouleurAleatoire();
  
  Rectangle(float x, float y , float largeur, float hauteur){
    centre = new PVector(x,y);
    L = largeur;
    H = hauteur;
  }
  
  void affiche(){
    rectMode(CENTER);
    noStroke();
    fill(col);
    rect(centre.x, centre.y, L, H);
  }
  
  void appliqueLaVitesse(float dt){
    centre.add(PVector.mult(vitesse, dt));
  }
  
  float distanceAuCoteGaucheDe(Rectangle autreRect){
    return autreRect.centre.x - autreRect.L/2 - (centre.x + L/2);
  }
  float distanceAuCoteDroitDe(Rectangle autreRect){
    return centre.x - L/2 - (autreRect.centre.x + autreRect.L/2);
  }
  float distanceAuCoteHautDe(Rectangle autreRect){
    return autreRect.centre.y - autreRect.H/2 - (centre.y + H/2);
  }
  float distanceAuCoteBasDe(Rectangle autreRect){
    return centre.y - H/2 - (autreRect.centre.y + autreRect.H/2);
  }
}
