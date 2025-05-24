class Evec {

  private float x,y;
  private PVector vec;
  private float magnitude;
  
  Evec(PVector pos, PVector pvec){
    this.x = pos.x;
    this.y = pos.y;
    this.vec = pvec;
    this.magnitude = this.vec.mag();
  }
  
  float getX(){
    return this.x;
  }
  
  float getY(){
    return this.y;
  }
  
  void setVec(PVector vec){
    this.vec = vec;
  }
  
  void setMagnitude(float mag){
    this.magnitude = mag;
  }
  
  float getBrightness(){
    if(this.magnitude>=255)
      return 255;
    
    else if(this.magnitude<5)
      return 0;
      
    return this.magnitude;
  }
  
float dis(float x1,float y1,float x2,float y2){
  PVector v1 = new PVector(x1,y1); 
  PVector v2 = new PVector(x2,y2); 
  return v1.dist(v2);
}
  
  void update(){
    //We will need thw next line for the function updatFiled in the main instead of this function
    //because in the main we have the array list of the chargs. ->
    //this.magnitude = 10000/dis(mouseX,mouseY,getX(),getY());
    
  }
  
  void show(){
    int x = 4 ;
    PVector normalVec = this.vec.normalize().mult(x);
    PVector verticalVec = new PVector(normalVec.y,-normalVec.x);
   
    stroke(getBrightness());
    strokeWeight(2);
    line(this.x-2*normalVec.x,this.y-2*normalVec.y,this.x+2*normalVec.x,this.y+2*normalVec.y);
    
    strokeWeight(2);
    line(this.x+normalVec.x+verticalVec.x,this.y+normalVec.y+verticalVec.y,this.x+2*normalVec.x,this.y+2*normalVec.y);
    line(this.x+normalVec.x-verticalVec.x,this.y+normalVec.y-verticalVec.y,this.x+2*normalVec.x,this.y+2*normalVec.y);
    
    //stroke(0);
    //point(this.x,this.y);
    
  }
  
  
}
