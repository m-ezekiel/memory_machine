// Filename: record_fxn.pde (ATT: memory_machine.pde)
// Author: Mario Ezekiel H. (m-ezekiel.com)
// Date: February 10, 2017


void keyTyped() {
  loop();
  noCursor();
  state = RECORDING;
  k = key;

  println("key: "+ k);
  println("millis: " + millis());

  // Substitute _ and ^ for special characters [space] and [apostrophe] in the output file
  if (k == ' ') k = '_';
  if (k == '\'' | k == '\"') k = '`';
  if (k == BACKSPACE) k = '^';
  if (k == TAB) k = '~';
  if (k == ENTER | k == RETURN) k = '|';

  // Write the coordinate to a file with a "\t" (TAB character) between each entry
  output.println(k + "\t" + millis());

  // Reassign the key value so the special chars appear in the interactive text window
  k = key;

  if (k == CODED) return;

  if (k == ESC) {
    output.flush(); // Write the remaining data
    output.close(); // Finish the file
    exit();
  }
}

void mouseMoved() {
  cursor();
}