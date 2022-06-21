String dlines[];
boolean errorFlag = false;
int []x = new int[12];     // Column for checker
int []y = new int[12];     // Row for checker
int []k = new int[12];     // Color of checker
int n = 0;

void setup ()
{
  size (400, 400);
  readFile ("save.txt");   // Read data
}

void draw ()
{
  background (200);
  board ();               // Draw the board
}

void board ()
{ // Draw the squares
  for (int i=0; i<8; i++)   // Columns
    for (int j=0; j<8; j++) // Rows
    { // Alternate the color for the squares
      if ((i+j)%2 == 0) fill (255, 0, 0);
        else fill (255, 255, 0);
      rect (i*40, j*40, 40, 40);
    }
    for (int i=0; i<n; i++)  // Draw the checkers
    {
      if (k[i]==0) fill (200, 0, 0); else fill (100, 200, 0);  // Color?
      ellipse (x[i]*40+20, y[i]*40+20, 20, 20);                // Location.
    }
}

void readFile (String fileName)
{
  dlines = loadStrings(fileName);     // Read the names as strings
  for (int i=0; i<dlines.length; i++) // dlines.length is how many items in the array
    {
      y[i] = dlines[i].charAt(1) - '0';
      x[i] = dlines[i].charAt(3) - '0';
      k[i] = dlines[i].charAt(5) - '0';
    }
  n=dlines.length;
}
