import g4p_controls.*;
ArrayList <Switch>switchlist;
ArrayList <Light>lightlist;
ArrayList <Gate>gatelist;
ArrayList <Split>splitlist;
Switch fish=new Switch(350, 350);
Switch Talbot=new Switch (100, 100);
Light Yagami=new Light(200, 100);
Gate Logic=new Gate(500, 300, 0);
//Clock work=new Clock(500, 500);
//Switch clerk=new Switch(600, 100);
boolean gateclicked=false;
int layer=1;
int xdist;
int ydist;
int x;
int y;
int x1;
int y1;
boolean troll=false;
boolean dragging=false;
boolean draglight=false;
boolean draggate=false;
boolean dragsplit=false;
int dragindex;
boolean press=false;
boolean inorgate=false;
boolean outported=false;
int n=0;
int m=0;
Gate tempgate=new Gate(0, 0, 0);
void setup(){
  size(700, 700);
  background(0);
  switchlist=new ArrayList<Switch>();
  lightlist=new ArrayList<Light>();
  gatelist=new ArrayList<Gate>();
  splitlist=new ArrayList<Split>();
  switchlist.add(fish);
  switchlist.add(Talbot);
  //clerk.clock=true;
  //switchlist.add(clerk);
  
  lightlist.add(Yagami);
  gatelist.add(Logic);
  createGUI();
}
void draw(){
  if (troll==false)
  background(0);

  //work.appear();
  for (int i=0;i<switchlist.size();i++){
  Switch sw= switchlist.get(i);
    
    if (sw.clock){
      switchlist.get(i).timing++;
      //println(sw.timing);
      switchlist.get(i).update();
    }
    sw.appear();
  if (sw.connected==true){
        if(sw.connectgate==false)
        switchlist.get(i).con.tHis=switchlist.get(i).tHis;
        else
        switchlist.get(i).conPort.tHis=switchlist.get(i).tHis;
        
      }
  }
  
  for (int i=0;i<gatelist.size();i++){
    
    Gate ga=gatelist.get(i);
    //ga.outputs=false;
    ga.appear();
    int num=0;
    for (int j=0;j<ga.inputs.size();j++){
      if (ga.inputs.get(j).connected==false)
      ga.inputs.get(j).tHis=false;
      if (ga.inputs.get(j).tHis && ga.inputs.get(j).connected)
      num=num+1;
    }
    if (ga.type==1){
      
      if (num==0)
      gatelist.get(i).outputs=true;
      else
      gatelist.get(i).outputs=false;
    }
    else if (ga.type==0){
      if (num==ga.inputs.size())
      gatelist.get(i).outputs=true;
      else
      ga.outputs=false;
    }
    
    else if (ga.type==2){
      if (num>0)
      gatelist.get(i).outputs=true;
      else
      ga.outputs=false;
    }
    else if (ga.type==10){
      if (num>0)
      ga.timing++;
      if (num==0)
      ga.timing=0;
      
      float a=180/ga.inputs.size();
      
      if (ga.timing%180<float(num)*a)
      ga.outputs=true;
      else
      ga.outputs=false;
    }
    if (ga.connected){
      if (ga.outputs){
        try{
      ga.con.tHis=true;
        }
        catch (Exception e){
           
        }///add stuff here later
        try{
            ga.conPort.tHis=true;
           }
        catch (Exception e){
        }
      }
      else{
      if (ga.con!=null)
      
      ga.con.tHis=false;
      else {
        ga.conPort.tHis=false;
      }
      
      }
    }
  }
  for (int i=0;i<lightlist.size();i++){
  lightlist.get(i).appear();
  if (lightlist.get(i).connected==false)
  lightlist.get(i).tHis=false;
  
  }
  for (int i=0;i<splitlist.size();i++){
    Split p=splitlist.get(i);
    p.appear();
    if (p.input.connected){
      if (p.input.connector!=null){
        if (p.input.connector.tHis==true)
        p.input.tHis=true;
        else
        p.input.tHis=false;
      }
      else if (p.input.connectorg!=null){
        if (p.input.connectorg.outputs==true)
        p.input.tHis=true;
        else
        p.input.tHis=false;
      }
      else if (p.input.connectorp!=null){
        if (p.input.connectorp.tHis==true)
        p.input.tHis=true;
        else
        p.input.tHis=false;
      }
    }
    else{
      p.input.tHis=false;
    }
      for (int j=0;j<p.outputs.size();j++){
         if (p.input.tHis)
        p.outputs.get(j).tHis= true;
        else
        p.outputs.get(j).tHis=false;
        
        if(p.outputs.get(j).conPort!=null){
          p.outputs.get(j).conPort.tHis=p.outputs.get(j).tHis;
        }
        else if (p.outputs.get(j).lightp!=null){
          p.outputs.get(j).lightp.tHis=p.outputs.get(j).tHis;
        }
      }
    
    
  }
  
  
}


void mouseClicked(){
  gateclicked=false;
  for (int i=0;i<switchlist.size();i++){
    
    Switch s = switchlist.get(i);   //if(s.userClickedMe() ) 
    
    if (s.xcoor-30<=mouseX && mouseX<= s.xcoor+27 && s.ycoor-30<=mouseY && mouseY<= s.ycoor+30){
      if (switchlist.get(i).clock==false)
      switchlist.get(i).tHis=!switchlist.get(i).tHis;
      //if (switchlist.get(i).connected==true){
        
      //  switchlist.get(i).con.tHis=switchlist.get(i).tHis;
      //}
      
    }
    if (switchlist.get(i).xcoor+28<=mouseX && mouseX<=switchlist.get(i).xcoor+42 && switchlist.get(i).ycoor-4<=mouseY && mouseY<=switchlist.get(i).ycoor+12){
      if (switchlist.get(i).connected){
        switchlist.get(i).connected=false;
        if (switchlist.get(i).con!=null){
        switchlist.get(i).con.connected=false;
        switchlist.get(i).con.con=null;
        }
        else if (switchlist.get(i).conPort!=null){
          switchlist.get(i).conPort.connected=false;
        switchlist.get(i).conPort.connector=null;
        }
        switchlist.get(i).con=null;
        switchlist.get(i).conPort=null;
      }
    }
  }
  for (int i=0;i<gatelist.size();i++){
    Gate g=gatelist.get(i);
    if(g.xcoor-30<=mouseX && mouseX<= g.xcoor+27 && g.ycoor-30<=mouseY && mouseY<= g.ycoor+30){
      gateclicked=true;
      tempgate=g;
    }
    else if (g.xcoor+28<=mouseX && mouseX<=g.xcoor+42 && g.ycoor-4<=mouseY && mouseY<g.ycoor+12){
      if (g.connected){
        g.connected=false;
        if (g.con!=null){
          g.con.connected=false;
          g.con.congate=null;
        }
        else{
          g.conPort.connected=false;
          g.conPort.connectorg=null;
        }
        g.con=null;
        g.conPort=null;
      }
    }
  }
  
  for (int i=0;i<splitlist.size();i++){
    for (int j=0;j<splitlist.get(i).outputs.size();j++){
      Outport temport=splitlist.get(i).outputs.get(j);
      if (temport.xcoor-6<=mouseX && mouseX<=temport.xcoor+6 && temport.ycoor-6<=mouseY && mouseY<temport.ycoor+6){
        if (temport.connected){
          if (temport.conPort!=null){
            temport.conPort.connectorp=null;
            temport.conPort.connected=false;
            temport.conPort=null;
            
          }
         else if (temport.lightp!=null){
           temport.lightp.conout=null;
           temport.lightp.connected=false;
           temport.lightp=null;
         }
        }
      }
      }
    
    
    
  }
}

void mouseDragged(){
  //for (int i=0;i<switchlist.size();i++){
  //  if (dragging==true){
  //  if (switchlist.get(i).xcoor-30<=mouseX && mouseX<=switchlist.get(i).xcoor+27 && switchlist.get(i).ycoor-30<=mouseY && mouseY<=switchlist.get(i).ycoor+30 && press==false){
    if (dragging==true)  {
      switchlist.get(dragindex).xcoor=mouseX+xdist;
      switchlist.get(dragindex).ycoor=mouseY+ydist;
    }
    if (draglight==true)  {
      lightlist.get(dragindex).xcoor=mouseX+xdist;
      lightlist.get(dragindex).ycoor=mouseY+ydist;
    }
    if (draggate==true)  {
      gatelist.get(dragindex).xcoor=mouseX+xdist;
      gatelist.get(dragindex).ycoor=mouseY+ydist;
      Gate gatez=gatelist.get(dragindex);
      for (int j=0;j<gatez.inputs.size();j++){
        
        if (gatez.inputs.size()>1 && gatez.inputs.size()<=4){
     gatelist.get(dragindex).inputs.get(j).ycoor=gatez.ycoor-30+j*(60/(gatez.inputs.size()-1));
     gatelist.get(dragindex).inputs.get(j).xcoor=gatez.xcoor-30;
        }
     else if (gatez.inputs.size()>4 && gatez.inputs.size()<8)
     if (j<=3){
     gatelist.get(dragindex).inputs.get(j).xcoor=gatez.xcoor-30;
     gatelist.get(dragindex).inputs.get(j).ycoor=gatez.ycoor-30+j*(60/(3));
     }
     else{
       int a=j-3;
       gatelist.get(dragindex).inputs.get(j).xcoor=gatelist.get(dragindex).xcoor-30+a*(60/(gatelist.get(dragindex).inputs.size()-4));
       gatelist.get(dragindex).inputs.get(j).ycoor=gatelist.get(dragindex).ycoor-30;
     }
     if (gatez.inputs.size()==1){
     gatelist.get(dragindex).inputs.get(j).ycoor=gatez.ycoor;
     gatelist.get(dragindex).inputs.get(j).xcoor=gatez.xcoor-30;
     
     }
     
   }
    }
    if (dragsplit==true)  {
      splitlist.get(dragindex).xcoor=mouseX+xdist;
      splitlist.get(dragindex).ycoor=mouseY+ydist;
      Split splitz=splitlist.get(dragindex);
      splitz.input.xcoor=splitz.xcoor-30;
      splitz.input.ycoor=splitz.ycoor;
      for (int j=0;j<splitz.outputs.size();j++){
        
        
     splitlist.get(dragindex).outputs.get(j).ycoor=splitz.ycoor-30+j*20;
     splitlist.get(dragindex).outputs.get(j).xcoor=splitz.xcoor+30;
   }
    }
  //}
  //  }
    
    
  //if (switchlist.get(i).xcoor+27<=mouseX && mouseX<=switchlist.get(i).xcoor+39 && switchlist.get(i).ycoor-3<=mouseY && mouseY<=switchlist.get(i).ycoor+9){
  //  stroke(255);
  //  strokeWeight(2);
  //  line(switchlist.get(i).xcoor+33,switchlist.get(i).ycoor+3,mouseX, mouseY);
  //  stroke(0);
  //  println("fish");
  //}
  if (press==true){
  stroke(255);
  if (outported)
  line(x1, y1, mouseX, mouseY);
  else if (inorgate==false)
  line(x, y,mouseX, mouseY);
  else
  line(x1, y1, mouseX, mouseY);
  stroke(0);
  }    
  }


void mousePressed(){
    boolean tempb=false;
  for (int i=0;i<switchlist.size();i++){
      if (switchlist.get(i).xcoor-30<=mouseX && mouseX<=switchlist.get(i).xcoor+27 && switchlist.get(i).ycoor-30<=mouseY && mouseY<=switchlist.get(i).ycoor+30 && press==false){  
           xdist=switchlist.get(i).xcoor-mouseX;
           ydist=switchlist.get(i).ycoor-mouseY;
           dragindex=i;
           dragging=true;
           tempb=true;
           break;
      }
  }
  if (tempb==false){
  for (int i=0;i<lightlist.size();i++){
      if (lightlist.get(i).xcoor-20<=mouseX && mouseX<=lightlist.get(i).xcoor+20 && lightlist.get(i).ycoor-40<=mouseY && mouseY<=lightlist.get(i).ycoor+20 && press==false){  
           xdist=lightlist.get(i).xcoor-mouseX;
           ydist=lightlist.get(i).ycoor-mouseY;
           dragindex=i;
           draglight=true;
           tempb=true;
           break;
      }
  }
  }
  if (tempb==false){
  for (int i=0;i<gatelist.size();i++){
    
      if (gatelist.get(i).xcoor-30<=mouseX && mouseX<=gatelist.get(i).xcoor+30 && gatelist.get(i).ycoor-30<=mouseY && mouseY<=gatelist.get(i).ycoor+30 && press==false){  
           
        xdist=gatelist.get(i).xcoor-mouseX;
           ydist=gatelist.get(i).ycoor-mouseY;
           dragindex=i;
           draggate=true;
           tempb=true;
           
           break;
      }
    
  }
  }
  if (tempb==false){
  for (int i=0;i<splitlist.size();i++){
      if (splitlist.get(i).xcoor-20<=mouseX && mouseX<=splitlist.get(i).xcoor+20 && splitlist.get(i).ycoor-40<=mouseY && mouseY<=splitlist.get(i).ycoor+20 && press==false){  
           xdist=splitlist.get(i).xcoor-mouseX;
           ydist=splitlist.get(i).ycoor-mouseY;
           dragindex=i;
           dragsplit=true;
           tempb=true;
           break;
      }
  }
  }
    if (press==false){
      boolean tempboo=false;
      for (int i=0;i<switchlist.size();i++){
        if (switchlist.get(i).xcoor+28<=mouseX && mouseX<=switchlist.get(i).xcoor+42 && switchlist.get(i).ycoor-4<=mouseY && mouseY<=switchlist.get(i).ycoor+12 && switchlist.get(i).connected==false){
         x=mouseX;
         y=mouseY;
         press=true;
         n=i;
         tempboo=true;
         inorgate=false;
         outported=false;
        }
    }
    if (tempboo==false){
      for (int i=0;i<gatelist.size();i++){
      if (gatelist.get(i).xcoor+15<=mouseX && mouseX<=gatelist.get(i).xcoor+45 && gatelist.get(i).ycoor-15<=mouseY && mouseY<=gatelist.get(i).ycoor+15 && press==false){
        x1=mouseX;
         y1=mouseY;
         press=true;
         n=i;
         inorgate=true;
         outported=false;
      }
      }
    }
    if (tempboo==false){
      for (int i=0;i<splitlist.size();i++){
        for (int j=0;j<splitlist.get(i).outputs.size();j++){
        Outport op=splitlist.get(i).outputs.get(j);
      if (op.xcoor-15<=mouseX && mouseX<=op.xcoor+15 && op.ycoor-15<=mouseY && mouseY<=op.ycoor+15 && press==false){
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
void mouseReleased(){
  if(press==true){
    boolean tempb=false;
    for (int i=0;i<lightlist.size();i++){
      if (lightlist.get(i).xcoor-16<=mouseX && mouseX<=lightlist.get(i).xcoor+6 && lightlist.get(i).ycoor-3<=mouseY && mouseY<=lightlist.get(i).ycoor+21 && lightlist.get(i).connected==false){
    //stroke(255);

    //line(x, y,mouseX, mouseY);
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
    if (tempb==false){
      for (int i=0;i<gatelist.size();i++){
        for (int j=0;j<gatelist.get(i).inputs.size();j++){
          
          Port s=gatelist.get(i).inputs.get(j);
          if (s.xcoor-12<=mouseX && mouseX<=s.xcoor+12 && s.ycoor-12<=mouseY && mouseY<=s.ycoor+12){
          stroke(255);
          
    tempb=true;
    
    //line(x, y,mouseX, mouseY);
    
    //stroke(0);
    if (s.connected==false){
    if (outported)
    splitlist.get(n).outputs.get(m).connectp((gatelist.get(i).inputs.get(j)));
    else if (inorgate==false)
    switchlist.get(n).connectg(gatelist.get(i).inputs.get(j));
    else{
    gatelist.get(n).connectg(gatelist.get(i).inputs.get(j));
 
    }
    }
          
          }
        }
    }
  }
  if (tempb==false){
    for (int i=0;i<splitlist.size();i++){
      Port a=splitlist.get(i).input;
      if (a.xcoor-12<=mouseX && mouseX<=a.xcoor+12 && a.ycoor-12<=mouseY && mouseY<=a.ycoor+12  && a.connected==false){
        if (outported)
        splitlist.get(n).outputs.get(m).connectp(a);
        else if (inorgate==false)
        switchlist.get(n).connectg(a);
        else
        gatelist.get(n).connectg(a);
      }
        //
        
    }
  }
  }
  press=false;
  if (dragging)
  dragging=false;
  if (draglight)
  draglight=false;
  if (draggate)
  draggate=false;
  if (dragsplit)
  dragsplit=false;
}

void cleare(){
  int a=switchlist.size();
 for (int i=0;i<a;i++){
   
   switchlist.remove(0);
 }
 a=gatelist.size();
 for (int i=0;i<a;i++){
   
   gatelist.remove(0);
 }
 a=lightlist.size();
 for (int i=0;i<a;i++){
   
   lightlist.remove(0);
 }
 
 a=splitlist.size();
 for (int i=0;i<a;i++){
   
   splitlist.remove(0);
 }

  
}


void addsplitsrec(int x, int t, int o){
  
  
  if (t==0){
    for (int i=0;i<pow(4, o+1);i++){
      Light a=new Light(x+100, int(height*(i+1)/(pow(4, o)+1)));
      lightlist.add(a);
      int temp=i/4;
      int rem=(i%4);
      //println(i);
     splitlist.get(splitlist.size()-1-temp).outputs.get(rem).connectl(a);
      
      
    }
    //int k=1;
    //for (int i=0;i<pow(4, o);i++){
    //  Split a=new Split(x, int(height-(i+1)/(pow(4, o)+1)*height));
    //  splitlist.add(a);
    //  for (int j=0;j<a.outputs.size();j++){
    //    a.outputs.get(j).connectl(lightlist.get(lightlist.size()-k));
    //    k=k+1;
    //  }
    //}
    
    
    
    
  }
  else{
    int tempd=o-t+1;
    int k=0;
    int p=0;
    for (int i=0;i<pow(4, tempd-1);i++){
      Split a=new Split(x+100, int(height-(i+1)/(pow(4, tempd-1)+1)*height));
      splitlist.add(a);
      
      
      
    }
    if (tempd!=1){
    for (int i=0;i<pow(4,tempd-1);i++){
    //  
    k=i/4;
    p=i%4;
    splitlist.get(splitlist.size()-int(pow(4,tempd-1))-1-k).outputs.get(p).connectp(splitlist.get(splitlist.size()-i-1).input);
    
    }
    }
    else{
      Switch temps=new Switch(x, height/2);
  temps.clock=true;
  switchlist.add(temps);
  temps.connectg(splitlist.get(0).input);
    }
      
      
    //}
    //int k=2;
    //for (int i=0;i<pow(4, temp-1);i++){
    //  Split a=new Split(x, int(height-(i+1)/(pow(4, temp-1)+1)*height));
    //  //Split a=new Split(x, height/2);
    //  splitlist.add(a);
    //  for (int j=0;j<a.outputs.size();j++){
    //    a.outputs.get(j).connectp(splitlist.get(splitlist.size()-k).input);
    //    k=k+1;
    //  }
    //  k=k+1;
    //}
    
    
    addsplitsrec(x+100, t-1, o);
    
  }
  
}
