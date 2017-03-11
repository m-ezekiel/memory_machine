// Filename: functions.pde (ATT: memory_machine.pde)
// Author: Mario Ezekiel H. (m-ezekiel.com)
// Date: February 10, 2017


void update(int x, int y) {
  if (overPlay(playBtnX, playBtnY, playWidth, playHeight)) {
    playOver = true;
    recordOver = false;
  } else if ( overRecord(recordBtnX, recordBtnY, recordWidth, recordHeight) ) {
    playOver = false;
    recordOver = true;
  } else if ( overDone(doneBtnX, doneBtnY, doneWidth, doneHeight) ) {
    doneOver = true;
  } else {
    playOver = recordOver = doneOver = false;
  }
}


boolean overPlay(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}


boolean overRecord(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}


boolean overDone(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}


void mousePressed() {
  if (playOver) {
    background(0);
    state = VIEW_MEMORY;
  }
  if (recordOver) {
    background(0);
    // close null.txt and create timestamped output file
    output.close();
    int [] datetime = dateTime();
    output = createWriter("data/" + join(nf(datetime, 0), "-") + "_" + task + ".txt");
    state = DISCLAIMER;
  }
  if (doneOver) {
    output.flush();
    output.close();
    output = createWriter("data/null.txt");
    state = MAIN_MENU;
  }
}


public int [] dateTime() {
  int [] datetime = new int[6];
  datetime[0] = year();
  datetime[1] = month();
  datetime[2] = day();
  datetime[3] = hour();
  datetime[4] = minute();
  datetime[5] = second();

  return(datetime);
}