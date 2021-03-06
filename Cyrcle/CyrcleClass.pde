// This is the cookie cutter for the node it contains all the information about it
class Node {
    int x;
    int y;
    int radius = 30;
    int id;
    Node[] otherNodes;

    Node(int tempId, Node[] tempOthers) {
        id = tempId;
        otherNodes = tempOthers;
    }

    void setPrePosition(int _tempx, int _tempy) {
        x = _tempx;
        y = _tempy;
    }

    void setPosition() {
        x = mouseX;
        y = mouseY;
    }

    // Displays the nodes on the screen
    void display() {
        noStroke();
        fill(255);
        ellipse(x, y, 3, 3);
        fill(255, 6);
        ellipse(x, y, radius, radius);
    }

    // Draws the lines if two node overlap
    void displayNetwork(int nodeCount) {
        stroke(255);
        for (int i = id+1; i < nodeCount; i++) {
            if (overlap(otherNodes[i])) {
                line(x, y, otherNodes[i].x, otherNodes[i].y);
            }
        }
    }

    // This function gets called
    boolean overlap(Node n) {
        float distanceFromCenters = dist(x, y, n.x, n.y);
        float diameter = radius + n.radius;
        if (distanceFromCenters < diameter) {
            return true;
        } else {
            return false;
        }
    }
}
