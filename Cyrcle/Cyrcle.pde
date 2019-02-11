// This makes 2 list, one containing the nodes that will connect
Node[] nodes = new Node[1000];

// Number of nodes that the app starts with
int nodeCount = 100;

// Setup function runs before the first frame is loaded which we can using to 'setup' the app
void setup() {
    fullScreen();
    background(10);
    noStroke();

    for (int i = 0; i < nodes.length; i++) {
        nodes[i] = new Node(i, nodes);
    }

    placeStars();
}

// This function takes 100 nodes and puts them randomly on the screen
void placeStars() {
    for (int i = 0; i < nodeCount; i++) {
        int x = int(random(50, 1870));
        int y = int(random(50, 1030));
        nodes[i].setPrePosition(x, y);
        nodes[i].display();
    }
}

// The draw function displays every line between the nodes
void draw() {
    background(0);
    for (int i = 0; i < nodeCount; i++) {
        nodes[i].display();
        nodes[i].displayNetwork(nodeCount);
    }
}

// The mousePressed function places a node when the the mouse is pressed
void mousePressed() {
  ellipse(mouseX, mouseY, 3, 3);
  if (nodeCount < nodes.length) {
     nodes[nodeCount].setPosition();
     nodeCount++;
  }
}
