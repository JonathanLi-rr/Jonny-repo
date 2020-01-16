class Light{
  int xcoor;
  int ycoor;
  boolean tHis;
  boolean connected;
  Gate congate;
  Switch con;
  Outport conout;
  Light(int x, int y){
   this.xcoor=x;
   this.ycoor=y;
   this.tHis=false; 
   this.connected=false;
   this.con=null;
   this.congate=null;
   this.conout=null;
 }
 
 void appear(){
  
  if (!this.tHis)
    fill(200, 200, 200);
     
   else
     fill(255, 233, 0);
   
   ellipse(this.xcoor-10, this.ycoor-20, 20, 40);
   fill(255);
   ellipse(this.xcoor-10,this.ycoor,12,12);
    //if (this.connected){
    //  stroke(255);
    //line(this.xcoor+30, this.ycoor, this.con.xcoor+30, this.con.ycoor);
    //stroke(0);
    //}
}

}
