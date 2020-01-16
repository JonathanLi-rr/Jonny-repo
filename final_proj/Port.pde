class Port{
  int xcoor;   //input port of gates and split
  int ycoor;
  boolean connected;
  Gate owner;   //which gate actually owns this, null if it is a split
  boolean tHis;   //if it is powered or not
  Switch connector;     //the switch it is connected to, null if none
  Gate connectorg;   //same as above except with gate
  Outport connectorp;  //same as above except with outport
  Port(int x, int y){
    this.xcoor=x;
    this.ycoor=y;
    this.connected=false;
    this.owner=null;
    this.tHis=false;
    this.connector=null;
    this.connectorg=null;
    this.connectorp=null;
  }
  
  
  
  
}
