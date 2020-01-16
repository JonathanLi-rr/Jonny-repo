import g4p_controls.*;

ArrayList <Switch>switchlist;
ArrayList <Light>lightlist;
ArrayList <Gate>gatelist;
ArrayList <Split>splitlist;     //stores all gates

//just here for initial screen
Switch fish=new Switch(350, 350);
Switch Talbot=new Switch (100, 100);
Light Yagami=new Light(200, 100);
Gate Logic=new Gate(500, 300, 0);


boolean gateclicked=false;
int layer=1;
int xdist;
int ydist;
int x;
int y;
int x1;
int y1;
boolean troll=false;          //literally just turns off redrawing background, the program doesn't actually use this value, just here for me to mess with it

boolean dragging=false;            //this actually detects when switch are getting dragged
boolean draglight=false;
boolean draggate=false;
boolean dragsplit=false;                //determines which ype of objects is being dragged

int dragindex;        //indicates the object that's being dragged

boolean press=false;      //detects if the user is trying to connect to objects

boolean inorgate=false;       //just there so that i know which one to connect to which
boolean outported=false;


int n=0;
int m=0;


Gate tempgate=new Gate(0, 0, 0);
void setup() {
  size(1000, 700);
  background(0);
  switchlist=new ArrayList<Switch>();
  lightlist=new ArrayList<Light>();
  gatelist=new ArrayList<Gate>();
  splitlist=new ArrayList<Split>();


  switchlist.add(fish);     //you don't really need these, they are the ones in the starting screen
  switchlist.add(Talbot);
  lightlist.add(Yagami);
  gatelist.add(Logic);    


  createGUI();
}
void draw() {
  try {                          //in case something breaks when clearing things, sometimes objects get deleted in the middle of an update
    if (troll==false)                   //don't mind this if statement
      background(150, 150, 255);

    fill(255, 0, 0);
    text("trash can for deleting unwanted objects", width-50, height-60 );        //the trashbin at bottom right corner for the user to delete objects
    rect(width-50, height-50, 50, 50);

    //work.appear();
    for (int i=0; i<switchlist.size(); i++) {         //go through all the switch
      Switch sw= switchlist.get(i);

      if (sw.clock) {      //if it is a clock
        switchlist.get(i).timing++;
        //println(sw.timing);
        switchlist.get(i).update();     //check if it should be on or off
      }
      if (sw.push) {          //if it is a push button
        if (sw.tHis) {
          sw.timing++;
        } else            //just if it is a good old switch
        sw.timing=0;
        if (sw.timing>150)
          sw.tHis=false;
      }


      sw.appear();
      if (sw.connected==true) {
        if (sw.connectgate==false)                  //if the switch is connected to light
          switchlist.get(i).con.tHis=switchlist.get(i).tHis;
        else  //if not then it is connected to a port of some sort
        switchlist.get(i).conPort.tHis=switchlist.get(i).tHis;
      }
    }

    for (int i=0; i<gatelist.size(); i++) {    //go through all gates

      Gate ga=gatelist.get(i);

      ga.appear();

      int num=0;//counts how many powered inputs there are
      boolean conm=false;   //this will turn true if at least one of the inputs is connected to something

      for (int j=0; j<ga.inputs.size(); j++) {  //go through all inputs of a gate
        if (ga.inputs.get(j).connected==false)
          ga.inputs.get(j).tHis=false;
        else
          conm=true;

        if (ga.inputs.get(j).tHis && ga.inputs.get(j).connected)
          num=num+1;
      }

      if (conm) {
        if (ga.type==1) {  //not gate     
          if (num==0)
            gatelist.get(i).outputs=true;
          else
            gatelist.get(i).outputs=false;
        } 
        else if (ga.type==0) {   //and gate
          if (num==ga.inputs.size())
            gatelist.get(i).outputs=true;
          else
            ga.outputs=false;
        } 
        else if (ga.type==2) {  //or
          if (num>0)
            gatelist.get(i).outputs=true;
          else
            ga.outputs=false;
        } 
        else if (ga.type==3) {    //NAND
          if (num<ga.inputs.size())
            ga.outputs=true;
          else
            ga.outputs=false;
        } 
        else if (ga.type==4) {    //NOR
          if (num==0)
            ga.outputs=true;
          else
            ga.outputs=false;
        } 
        else if (ga.type==5) {  //XOR
          if (num!=0 && num!=ga.inputs.size())
            ga.outputs=true;
          else
            ga.outputs=false;
        } 
        else if (ga.type==6) {     //XNOR
          if (num!=0 && num!=ga.inputs.size())
            ga.outputs=false;
          else
            ga.outputs=true;
        } 
        else if (ga.type==7) {     //comparetor gate
          int tempnuma=0;       //stores number of powered inputs in bottom 3
          int tempnumb=0;        //stores number of pwoered inputs in top 3
          for (int j=0; j<3; j++) {
            if (ga.inputs.get(j).tHis)
              tempnuma++;
          }
          for (int j=3; j<6; j++) {
            if (ga.inputs.get(j).tHis)
              tempnumb++;
          }
          if (tempnumb>tempnuma)
            ga.outputs=true;
          else
            ga.outputs=false;
        } 
        else if (ga.type==10) {              //Timer gate
          if (num>0)             //only starts after timer start
            ga.timing++;
          if (num==0)
            ga.timing=0;

          float a=180/ga.inputs.size();

          if (ga.timing%180<float(num)*a)
            ga.outputs=true;
          else
            ga.outputs=false;
        }
      } 
      else
        ga.outputs=false;

      if (ga.connected) {        //checks the gates connection and updates the values for whatever is connected to the gate
        if (ga.outputs) {
          try {              //if it's connected to a light
            ga.con.tHis=true;
          }
          catch (Exception e) {
          }

          try {           //if it's connected to a gate
            ga.conPort.tHis=true;
          }
          catch (Exception e) {
          }
        } 
        else {         //if the gate is not outputting power
          if (ga.con!=null)

            ga.con.tHis=false;
          else {
            ga.conPort.tHis=false;
          }
        }
      }
    }
    for (int i=0; i<lightlist.size(); i++) {    //go through all lights
      lightlist.get(i).appear();
      if (lightlist.get(i).connected==false)
        lightlist.get(i).tHis=false;
    }
    for (int i=0; i<splitlist.size(); i++) {      //for the thing that splits
      Split p=splitlist.get(i);
      p.appear();
      if (p.input.connected) {   //checks if it is connected to anything and change them into the correct value
        if (p.input.connector!=null) {
          if (p.input.connector.tHis==true)
            p.input.tHis=true;
          else
            p.input.tHis=false;
        } 
        else if (p.input.connectorg!=null) {
          if (p.input.connectorg.outputs==true)
            p.input.tHis=true;
          else
            p.input.tHis=false;
        } 
        else if (p.input.connectorp!=null) {
          if (p.input.connectorp.tHis==true)
            p.input.tHis=true;
          else
            p.input.tHis=false;
        }
      } 
      else {
        p.input.tHis=false;
      }
      for (int j=0; j<p.outputs.size(); j++) {
        if (p.input.tHis)
          p.outputs.get(j).tHis= true;
        else
          p.outputs.get(j).tHis=false;

        if (p.outputs.get(j).conPort!=null) {
          p.outputs.get(j).conPort.tHis=p.outputs.get(j).tHis;
        } 
        else if (p.outputs.get(j).lightp!=null) {
          p.outputs.get(j).lightp.tHis=p.outputs.get(j).tHis;
        }
      }
    }
  }
  catch (Exception e) {
  }
}


void mouseClicked() {
  gateclicked=false;
  boolean thingclicked=false;
  for (int i=0; i<switchlist.size(); i++) {      //all switches

    Switch s = switchlist.get(i);   

    if (s.xcoor-30<=mouseX && mouseX<= s.xcoor+27 && s.ycoor-30<=mouseY && mouseY<= s.ycoor+30 && thingclicked==false) {       //if the user clicks on switch
      if (switchlist.get(i).clock==false) {
        switchlist.get(i).tHis=!switchlist.get(i).tHis;
        thingclicked=true;
      }
      
    }
    if (switchlist.get(i).xcoor+28<=mouseX && mouseX<=switchlist.get(i).xcoor+42 && switchlist.get(i).ycoor-4<=mouseY && mouseY<=switchlist.get(i).ycoor+12) {  //if user clicks on the port, which will disconnect its connection
      if (switchlist.get(i).connected) {
        switchlist.get(i).connected=false;
        if (switchlist.get(i).con!=null) {
          switchlist.get(i).con.connected=false;
          switchlist.get(i).con.con=null;
        } 
        else if (switchlist.get(i).conPort!=null) {
          switchlist.get(i).conPort.connected=false;
          switchlist.get(i).conPort.connector=null;
        }
        switchlist.get(i).con=null;
        switchlist.get(i).conPort=null;
      }
    }
  }
  for (int i=0; i<gatelist.size(); i++) {
    Gate g=gatelist.get(i);
    if (g.xcoor-30<=mouseX && mouseX<= g.xcoor+27 && g.ycoor-30<=mouseY && mouseY<= g.ycoor+30) {    //if gate has been clicked
      gateclicked=true;          //used for increase and decrease inputs
      tempgate=g;
    } 
    else if (g.xcoor+28<=mouseX && mouseX<=g.xcoor+42 && g.ycoor-4<=mouseY && mouseY<g.ycoor+12) {    //if the output port in the gate has been clicked, disconnect the connection for that port
      if (g.connected) {
        g.connected=false;
        if (g.con!=null) {
          g.con.connected=false;
          g.con.congate=null;
        } 
        else {
          g.conPort.connected=false;
          g.conPort.connectorg=null;
        }
        g.con=null;
        g.conPort=null;
      }
    }
    for (int j=0; j<g.inputs.size(); j++) {
      Port tem=g.inputs.get(j);
      if (tem.connected) {
        if (tem.xcoor-6<=mouseX && mouseX<= tem.xcoor+6 && tem.ycoor-6<=mouseY && mouseY<= tem.ycoor+6) {           //if the input ports of the gate has been clicked, disconnect things like above
          if (tem.connector!=null) {
            tem.connector.conPort=null;
            tem.connector.connectgate=false;
            tem.connector.connected=false;
            tem.connector=null;
            tem.connected=false;
          } 
          else if (tem.connectorg!=null) {
            tem.connectorg.conPort=null;
            tem.connectorg.connected=false;
            tem.connectorg=null;
            tem.connected=false;
          } 
          else if (tem.connectorp!=null) {
            tem.connectorp.conPort=null;
            tem.connectorp.connected=false;
            tem.connectorp=null;
            tem.connected=false;
          }
        }
      }
    }
  }

  for (int i=0; i<splitlist.size(); i++) {            //goes through all splits
    Port tempy=splitlist.get(i).input;
    if (tempy.connected) {
      if (tempy.xcoor-6<=mouseX && mouseX<=tempy.xcoor+6 && tempy.ycoor-6<=mouseY && mouseY<tempy.ycoor+6) {      //if the input of the split has been clicked, disconnect things like above
        if (tempy.connector!=null) {
          tempy.connector.conPort=null;
          tempy.connector.connectgate=false;
          tempy.connector.connected=false;
          tempy.connector=null;
          tempy.connected=false;
        } 
        else if (tempy.connectorg!=null) {
          tempy.connectorg.conPort=null;
          tempy.connectorg.connected=false;
          tempy.connectorg=null;
          tempy.connected=false;
        } 
        else if (tempy.connectorp!=null) {
          tempy.connectorp.conPort=null;
          tempy.connectorp.connected=false;
          tempy.connectorp=null;
          tempy.connected=false;
        }
      }
    }
    for (int j=0; j<splitlist.get(i).outputs.size(); j++) {
      Outport temport=splitlist.get(i).outputs.get(j);
      if (temport.xcoor-6<=mouseX && mouseX<=temport.xcoor+6 && temport.ycoor-6<=mouseY && mouseY<temport.ycoor+6) {     //if the output ports has been clicked, disconnect things like above
        if (temport.connected) {
          if (temport.conPort!=null) {
            temport.conPort.connectorp=null;
            temport.conPort.connected=false;
            temport.conPort=null;
          } 
          else if (temport.lightp!=null) {
            temport.lightp.conout=null;
            temport.lightp.connected=false;
            temport.lightp=null;
          }
        }
      }
    }
  }
  for (int i=0; i<lightlist.size(); i++) {
    Light templ=lightlist.get(i);
    if (lightlist.get(i).xcoor-20<=mouseX && mouseX<=lightlist.get(i).xcoor+20 && lightlist.get(i).ycoor-40<=mouseY && mouseY<=lightlist.get(i).ycoor+20 && press==false) {   //if the light's input port has been clicked
      if (templ.connected) {
        if (templ.con!=null) {
          templ.con.con=null;

          templ.con.connected=false;
          templ.con=null;
          templ.connected=false;
        } 
        else if (templ.congate!=null) {
          templ.congate.con=null;
          templ.congate.connected=false;
          templ.congate=null;
          templ.connected=false;
        } 
        else if (templ.conout!=null) {
          templ.conout.lightp=null;
          templ.conout.connected=false;
          templ.conout=null;
          templ.connected=false;
        }
      }
    }
  }
}

void mouseDragged() {
  
  if (dragging==true) {   //updates switch positions
    switchlist.get(dragindex).xcoor=mouseX+xdist;
    switchlist.get(dragindex).ycoor=mouseY+ydist;
  }
  if (draglight==true) {  //updates light positions
    lightlist.get(dragindex).xcoor=mouseX+xdist;
    lightlist.get(dragindex).ycoor=mouseY+ydist;
  }
  if (draggate==true) {    //updates gate positions
    gatelist.get(dragindex).xcoor=mouseX+xdist;
    gatelist.get(dragindex).ycoor=mouseY+ydist;
    
    //updates the ports for the gate positions
    Gate gatez=gatelist.get(dragindex);
    if (gatez.type!=7) {
      for (int j=0; j<gatez.inputs.size(); j++) {

        if (gatez.inputs.size()>1 && gatez.inputs.size()<=4) {
          gatelist.get(dragindex).inputs.get(j).ycoor=gatez.ycoor-30+j*(60/(gatez.inputs.size()-1));
          gatelist.get(dragindex).inputs.get(j).xcoor=gatez.xcoor-30;
        } 
        else if (gatez.inputs.size()>4 && gatez.inputs.size()<8)
          if (j<=3) {
            gatelist.get(dragindex).inputs.get(j).xcoor=gatez.xcoor-30;
            gatelist.get(dragindex).inputs.get(j).ycoor=gatez.ycoor-30+j*(60/(3));
          } 
          else {
            int a=j-3;
            gatelist.get(dragindex).inputs.get(j).xcoor=gatelist.get(dragindex).xcoor-30+a*(60/(gatelist.get(dragindex).inputs.size()-4));
            gatelist.get(dragindex).inputs.get(j).ycoor=gatelist.get(dragindex).ycoor-30;
        }
        if (gatez.inputs.size()==1) {
          gatelist.get(dragindex).inputs.get(j).ycoor=gatez.ycoor;
          gatelist.get(dragindex).inputs.get(j).xcoor=gatez.xcoor-30;
        }
      }
    } 
    else {
      for (int i=1; i<4; i++) {
        gatez.inputs.get(i-1).ycoor =gatez.ycoor-30+i*20;
        gatez.inputs.get(i-1).xcoor =gatez.xcoor-30;
      }
      for (int j=1; j<4; j++) {
        gatez.inputs.get(j+2).xcoor =gatez.xcoor-30+j*20;
        gatez.inputs.get(j+2).ycoor =gatez.ycoor-30;
      }
    }
  }
  if (dragsplit==true) {   //updates split positions
    splitlist.get(dragindex).xcoor=mouseX+xdist;
    splitlist.get(dragindex).ycoor=mouseY+ydist;
    Split splitz=splitlist.get(dragindex);
    splitz.input.xcoor=splitz.xcoor-30;
    splitz.input.ycoor=splitz.ycoor;
    
    //updates ports for splits positions
    for (int j=0; j<splitz.outputs.size(); j++) {
      splitlist.get(dragindex).outputs.get(j).ycoor=splitz.ycoor-30+j*20;
      splitlist.get(dragindex).outputs.get(j).xcoor=splitz.xcoor+30;
    }
  }
  
  if (press==true) {   //if the user is dragging from a port to try to connect things
    stroke(255);
    if (outported)
      line(x1, y1, mouseX, mouseY);
    else if (inorgate==false)
      line(x, y, mouseX, mouseY);
    else
      line(x1, y1, mouseX, mouseY);
    stroke(0);
  }
}


void mousePressed() {
  boolean tempb=false;
  //these are used when controls are getting dragged, this calculates the distance from mouse to the center of the object
  for (int i=0; i<switchlist.size(); i++) {    
    if (switchlist.get(i).xcoor-30<=mouseX && mouseX<=switchlist.get(i).xcoor+27 && switchlist.get(i).ycoor-30<=mouseY && mouseY<=switchlist.get(i).ycoor+30 && press==false) {  
      xdist=switchlist.get(i).xcoor-mouseX;
      ydist=switchlist.get(i).ycoor-mouseY;
      dragindex=i;
      dragging=true;
      tempb=true;
      break;
    }
  }
  if (tempb==false) {
    for (int i=0; i<lightlist.size(); i++) {
      if (lightlist.get(i).xcoor-20<=mouseX && mouseX<=lightlist.get(i).xcoor+20 && lightlist.get(i).ycoor-40<=mouseY && mouseY<=lightlist.get(i).ycoor+20 && press==false) {  
        xdist=lightlist.get(i).xcoor-mouseX;
        ydist=lightlist.get(i).ycoor-mouseY;
        dragindex=i;
        draglight=true;
        tempb=true;
        break;
      }
    }
  }
  if (tempb==false) {
    for (int i=0; i<gatelist.size(); i++) {

      if (gatelist.get(i).xcoor-30<=mouseX && mouseX<=gatelist.get(i).xcoor+27 && gatelist.get(i).ycoor-30<=mouseY && mouseY<=gatelist.get(i).ycoor+30 && press==false) {  

        xdist=gatelist.get(i).xcoor-mouseX;
        ydist=gatelist.get(i).ycoor-mouseY;
        dragindex=i;
        draggate=true;
        tempb=true;

        break;
      }
    }
  }
  if (tempb==false) {
    for (int i=0; i<splitlist.size(); i++) {
      if (splitlist.get(i).xcoor-30<=mouseX && mouseX<=splitlist.get(i).xcoor+27 && splitlist.get(i).ycoor-40<=mouseY && mouseY<=splitlist.get(i).ycoor+20 && press==false) {  
        xdist=splitlist.get(i).xcoor-mouseX;
        ydist=splitlist.get(i).ycoor-mouseY;
        dragindex=i;
        dragsplit=true;
        tempb=true;
        break;
      }
    }
  }
  
  
  if (press==false) {     //when someones try to connect things by dragging from ports to ports
    boolean tempboo=false;  //so that if one of them is detected, then it doesn't have to do the rest
    for (int i=0; i<switchlist.size(); i++) {
      if (switchlist.get(i).xcoor+28<=mouseX && mouseX<=switchlist.get(i).xcoor+42 && switchlist.get(i).ycoor-4<=mouseY && mouseY<=switchlist.get(i).ycoor+12 && switchlist.get(i).connected==false) {
        x=mouseX;
        y=mouseY;
        press=true;
        n=i;
        tempboo=true;
        inorgate=false;
        outported=false;
      }
    }
    if (tempboo==false) {
      for (int i=0; i<gatelist.size(); i++) {
        if (gatelist.get(i).xcoor+28<=mouseX && mouseX<=gatelist.get(i).xcoor+42 && gatelist.get(i).ycoor-4<=mouseY && mouseY<=gatelist.get(i).ycoor+12 && press==false) {
          x1=mouseX;
          y1=mouseY;
          press=true;
          n=i;
          inorgate=true;
          outported=false;
        }
      }
    }
    if (tempboo==false) {
      for (int i=0; i<splitlist.size(); i++) {
        for (int j=0; j<splitlist.get(i).outputs.size(); j++) {
          Outport op=splitlist.get(i).outputs.get(j);
          if (op.xcoor-2<=mouseX && mouseX<=op.xcoor+12 && op.ycoor-7<=mouseY && mouseY<=op.ycoor+7 && press==false) {
            x1=mouseX;
            y1=mouseY;
            press=true;
            n=i;
            m=j;
            inorgate=false;
            outported=true;
          }
        }
      }
    }
  }
}
void mouseReleased() {
  
  
  if (press==true) {//when connecting two things
    boolean tempb=false;  //here so that if it is detected that we are already connecting two things, it doesn't have to run the rest
    for (int i=0; i<lightlist.size(); i++) {  //connects things to light
      if (lightlist.get(i).xcoor-16<=mouseX && mouseX<=lightlist.get(i).xcoor+6 && lightlist.get(i).ycoor-3<=mouseY && mouseY<=lightlist.get(i).ycoor+21 && lightlist.get(i).connected==false) {
        stroke(0);
        if (outported)
          splitlist.get(n).outputs.get(m).connectl(lightlist.get(i));
        else if (inorgate==false)
          switchlist.get(n).connect(lightlist.get(i));
        else
          gatelist.get(n).connect(lightlist.get(i));

        tempb=true;
      }
    }
    
    if (tempb==false) {//connects things the logic gates
      for (int i=0; i<gatelist.size(); i++) {
        for (int j=0; j<gatelist.get(i).inputs.size(); j++) {

          Port s=gatelist.get(i).inputs.get(j);
          if (s.xcoor-12<=mouseX && mouseX<=s.xcoor+12 && s.ycoor-12<=mouseY && mouseY<=s.ycoor+12) {
            tempb=true;
            if (s.connected==false) {
              if (outported)
                splitlist.get(n).outputs.get(m).connectp((gatelist.get(i).inputs.get(j)));
              else if (inorgate==false)
                switchlist.get(n).connectg(gatelist.get(i).inputs.get(j));
              else {
                if (n!=i)
                  gatelist.get(n).connectg(gatelist.get(i).inputs.get(j));
              }
            }
          }
        }
      }
    }
    if (tempb==false) {
      for (int i=0; i<splitlist.size(); i++) {   //connects thigns to splitlist
        Port a=splitlist.get(i).input;
        if (a.xcoor-12<=mouseX && mouseX<=a.xcoor+12 && a.ycoor-12<=mouseY && mouseY<=a.ycoor+12  && a.connected==false) {
          if (outported) {
            if (i!=n)
              splitlist.get(n).outputs.get(m).connectp(a);
          } else if (inorgate==false)
            switchlist.get(n).connectg(a);
          else
            gatelist.get(n).connectg(a);
        }
      }
    }
  }
  press=false;
  
  
  if (dragging) {
    dragging=false;
    int i=dragindex;
    if (width-50<switchlist.get(dragindex).xcoor && height-50<switchlist.get(dragindex).ycoor) {        //if light is being dragged to trash bin
      if (switchlist.get(i).connected) {
        switchlist.get(i).connected=false;                     //disconnecting everything that's connected to this switch
        if (switchlist.get(i).con!=null) {
          switchlist.get(i).con.connected=false;
          switchlist.get(i).con.con=null;
        } 
        else if (switchlist.get(i).conPort!=null) {
          switchlist.get(i).conPort.connected=false;
          switchlist.get(i).conPort.connector=null;
        }
        switchlist.get(i).con=null;
        switchlist.get(i).conPort=null;
      }
      switchlist.remove(dragindex);
    }
  }
  if (draglight) {
    draglight=false;
    if (width-50<lightlist.get(dragindex).xcoor && height-50<lightlist.get(dragindex).ycoor) {  //same as above except with lights
      Light templ=lightlist.get(dragindex);
      if (templ.connected) {
        if (templ.con!=null) {
          templ.con.con=null;
          templ.con.connected=false;
          templ.con=null;
          templ.connected=false;
        } 
        else if (templ.congate!=null) {
          templ.congate.con=null;
          templ.congate.connected=false;
          templ.congate=null;
          templ.connected=false;
        } 
        else if (templ.conout!=null) {
          templ.conout.lightp=null;
          templ.conout.connected=false;
          templ.conout=null;
          templ.connected=false;
        }
      }
      lightlist.remove(dragindex);
    }
  }
  
  //the ones below are for when things are being dragged into the trash bin
  if (draggate) {
    draggate=false;
    if (width-50<gatelist.get(dragindex).xcoor && height-50<gatelist.get(dragindex).ycoor) {     //if gate is being dragged to trash bin
      Gate g=gatelist.get(dragindex);
      if (g.connected) {               //makes sure that when it is thrown into the trash, it disconnects everything
        g.connected=false;
        if (g.con!=null) {
          g.con.connected=false;
          g.con.congate=null;
        } 
        else {
          g.conPort.connected=false;
          g.conPort.connectorg=null;
        }
        g.con=null;
        g.conPort=null;
      }
      for (int j=0; j<g.inputs.size(); j++) {
        Port tem=g.inputs.get(j);
        if (tem.connected) {

          if (tem.connector!=null) {
            tem.connector.conPort=null;
            tem.connector.connectgate=false;
            tem.connector.connected=false;
            tem.connector=null;
            tem.connected=false;
          } 
          else if (tem.connectorg!=null) {
            tem.connectorg.conPort=null;
            tem.connectorg.connected=false;
            tem.connectorg=null;
            tem.connected=false;
          } 
          else if (tem.connectorp!=null) {
            tem.connectorp.conPort=null;
            tem.connectorp.connected=false;
            tem.connectorp=null;
            tem.connected=false;
          }
        }
      }
      gatelist.remove(dragindex);
    }
  }
  if (dragsplit) {
    if (width-50<splitlist.get(dragindex).xcoor && height-50<splitlist.get(dragindex).ycoor) {     //same as above except with splits
      int i=dragindex;
      Port tempy=splitlist.get(i).input;
      if (tempy.connected) {

        if (tempy.connector!=null) {
          tempy.connector.conPort=null;
          tempy.connector.connectgate=false;
          tempy.connector.connected=false;
          tempy.connector=null;
          tempy.connected=false;
        } 
        else if (tempy.connectorg!=null) {
          tempy.connectorg.conPort=null;
          tempy.connectorg.connected=false;
          tempy.connectorg=null;
          tempy.connected=false;
        } 
        else if (tempy.connectorp!=null) {
          tempy.connectorp.conPort=null;
          tempy.connectorp.connected=false;
          tempy.connectorp=null;
          tempy.connected=false;
        }
      }
      for (int j=0; j<splitlist.get(i).outputs.size(); j++) {
        Outport temport=splitlist.get(i).outputs.get(j);

        if (temport.connected) {
          if (temport.conPort!=null) {
            temport.conPort.connectorp=null;
            temport.conPort.connected=false;
            temport.conPort=null;
          } 
          else if (temport.lightp!=null) {
            temport.lightp.conout=null;
            temport.lightp.connected=false;
            temport.lightp=null;
          }
        }
      }
      splitlist.remove(dragindex);
    }
    dragsplit=false;
  }
}

void cleare() {          //deletes all objects on screen
  int a=switchlist.size();
  for (int i=0; i<a; i++) {

    switchlist.remove(0);
  }
  a=gatelist.size();
  for (int i=0; i<a; i++) {

    gatelist.remove(0);
  }
  a=lightlist.size();
  for (int i=0; i<a; i++) {

    lightlist.remove(0);
  }

  a=splitlist.size();
  for (int i=0; i<a; i++) {

    splitlist.remove(0);
  }
}


void addsplitsrec(int x, int t, int o) {     //function used for creating a switch connecting to everything, x for x coordinate, o for total layers, t for current


  if (t==0) {                           //base case, which is the layer with lights
    for (int i=0; i<pow(4, o+1); i++) {
      Light a=new Light(x+100, int(height*(i+1)/(pow(4, o)+1)));
      lightlist.add(a);
      int temp=i/4;
      int rem=(i%4);
      splitlist.get(splitlist.size()-1-temp).outputs.get(rem).connectl(a);            //calculate which split it should connect too and connects it
    }
    
  } 
  else {
    int tempd=o-t+1;
    int k=0;
    int p=0;
    for (int i=0; i<pow(4, tempd-1); i++) {         //creates the split for the layer
      Split a=new Split(x+100, int(height-(i+1)/(pow(4, tempd-1)+1)*height));
      splitlist.add(a);
    }
    if (tempd!=1) {        //if it is not the first layer, it connects to the output ports in previous layer
      for (int i=0; i<pow(4, tempd-1); i++) {  
        k=i/4;
        p=i%4;
        splitlist.get(splitlist.size()-int(pow(4, tempd-1))-1-k).outputs.get(p).connectp(splitlist.get(splitlist.size()-i-1).input);
      }
    } 
    else {        //if it is the first layer, thus there's nothing to connect to in front
      Switch temps=new Switch(x, height/2);
      temps.clock=true;
      switchlist.add(temps);
      temps.connectg(splitlist.get(0).input);
    }

    addsplitsrec(x+100, t-1, o);           //RECURSIONNNNN
  }
}
