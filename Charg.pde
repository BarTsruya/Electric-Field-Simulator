class Charg{

  private int sign;
  private PVector pos;
  static final int R = 12;
  
  //Constructor
   Charg(int sign,PVector position){
    this.sign = sign;
    this.pos = position;
  }
  
  
  


  void setSign(int s){
    this.sign = s;
  }
  
  int getSign(){
    return this.sign;
  }

  void setPos(PVector p){
    this.pos = p;
  }
  
  PVector getPos(){
    return this.pos;
  }
  
  
  public void positiveChargDrawing(int x, int y){
    strokeWeight(2);
    stroke(0);
    fill(255,0,0);
    ellipse(x,y,2*R,2*R);
    
    strokeWeight(1);
    fill(255);
    rect(x-R/2,y-R/6,R,R/3);
    rect(x-R/6,y-R/2,R/3,R);
    
    stroke(255);
    line(x-R/6,y-R/6,x-R/6,y+R/6);
    line(x+R/6,y-R/6,x+R/6,y+R/6);
    
    stroke(0);
    point(x-R/6,y-R/6);
    point(x+R/6,y-R/6);
    point(x-R/6,y+R/6);
    point(x+R/6,y+R/6);
  }
  
  void negativeChargDrawing(int x, int y){
    strokeWeight(2);
    stroke(0);
    fill(0,0,255);
    ellipse(x,y,2*R,2*R);
    
    strokeWeight(1);
    fill(255);
    rect(x-R/2,y-R/6,R,R/3);
  }
  
  void testChargDrawing(int x, int y){
    strokeWeight(2);
    stroke(0);
    fill(230,230,0);
    ellipse(x,y,2*R,2*R);
    fill(0);
    textSize(15);
    text("t",x-2,y+5);
    
    
    
    
  }
  
  void getForceVec(ArrayList<Charg> chargers){
    PVector force = new PVector(0,0);
    
    
    for(int i=0;i<chargers.size();i++){
      if(chargers.get(i)!=this){
        PVector d = new PVector(chargers.get(i).getSign()*(this.pos.x-chargers.get(i).getPos().x),chargers.get(i).getSign()*(this.pos.y-chargers.get(i).getPos().y));
        force.add(d.normalize().mult(13000/chargers.get(i).getPos().dist(pos)));
      }
    }
    stroke(255);
    strokeWeight(5);
    line(this.pos.x, this.pos.y,this.pos.x+force.x, this.pos.y+force.y);
  }

  void show(){
    strokeWeight(1);
    
    if(this.sign == 1)
      positiveChargDrawing(int(this.pos.x),int(this.pos.y));
    else if(this.sign == -1)
      negativeChargDrawing(int(this.pos.x),int(this.pos.y));
    else//sign=0 -> a test charg
      testChargDrawing(int(this.pos.x),int(this.pos.y));
    
    
  }

}
