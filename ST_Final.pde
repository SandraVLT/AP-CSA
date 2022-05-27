Table list; // variable that stores csv
int rows; // variable holds the total amount of rows
int cols; // variable holds the total amount of cols
int row; // current row that is being displayed
int col; // current col being displayed


void setup(){
  size(1400, 800);
 background(0,0,0);
 list =  loadTable("https://raw.githubusercontent.com/SandraVLT/AP-CSA/main/songs_normalize.csv", "header"); // loading my csv to the list variable
 rows = list.getRowCount();
 cols = list.getColumnCount();
 row = 0;
}

void getInfo (){ // the get info function is what actually displays all the data the is being shown about the song including the bar measuring popularity levels
  background(0,0,0);
  fill(255, 255, 255);
  textSize(40);
  text("Title: " + list.getString(row, 1), 300, 100);
  text("Artist: " + list.getString(row, 0), 300, 200);
  text("Explicit: " + list.getString(row, 3), 300, 300);
  text("Year: " + list.getString(row, 4), 300, 400);
  text("Popularity: " + list.getString(row, 5) + "/89", 300, 500);
  
  int y = height/9 + 4*height/5 - 50;
  
  int pw = floor(map(list.getInt(row, 5), 0, 89, 0, 89*height/95)); // map the green bar to the level of popularity
  fill(255, 0, 0);
  rect(width/9, 25, 50, 89*height/95);
  fill(0, 255, 0);
  rect(width/9, 25, 50,pw);
  textSize(20);
  fill(0,0,255);
  text("Press the P key to move to previous song in the list. Press N key to move to next song. Press the R key to move to a random song. Bar shifts to match the popularity rating of each song." ,3*width/5, height/3, 300, 500);
  }
  

void keyPressed(){
 if ((key == 'n') && (row < rows)){ // when you press the n key, the next song in the list is shown
   row += 1; // row is increased
   getInfo(); // calling get info to load the data for the new row
 }
 if (key == 'r'){ // when you press r, a random song in the list is shown
   row = floor(random(1, rows)); // randomizing the row based on numbers between 1 and the total number of rows
   getInfo(); // calling get info to load the data for the new row
 }
 if ((key == 'p') && (row > 1)){
   row -= 1; // row is decreased
   getInfo(); // calling get info to load the data for the new row
 }
}

void draw(){
 getInfo(); // calling getInfo() in draw so the inforamtion is properly displayed and will update
}
