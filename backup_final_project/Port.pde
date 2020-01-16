class Port{
  int xcoor;
  int ycoor;
  boolean connected;
  Gate owner;
  boolean tHis;
  Switch connector;
  Gate connectorg;
  Outport connectorp;
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
