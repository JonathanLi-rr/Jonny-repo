class Light{
  int xcoor;
  int ycoor;
  boolean tHis;   //whether it is powered or not
  boolean connected;
  Gate congate;    //same as other classes
  Switch con;    //see above
  Outport conout;   //see above
  color filling;    //the type of colour this shines, this way its more convinient to add more colour
  Light(int x, int y){
   this.xcoor=x;
   this.ycoor=y;
   this.tHis=false; 
   this.connected=false;
   this.con=null;
   this.congate=null;
   this.conout=null;
   this.filling = color(255, 233, 0);
 }
 
 void appear(){
  
  if (!this.tHis)
    fill(200, 200, 200);
     
   else
     fill(this.filling);
   
   ellipse(this.xcoor-10, this.ycoor-20, 20, 40);
   fill(255);
   ellipse(this.xcoor-10,this.ycoor,12,12);
    
}

}
