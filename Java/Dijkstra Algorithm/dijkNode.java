// William Thing
// CSE373 HW6
public class dijkNode {
      public dijkNode path;
      public int cost;
      public boolean known;
      public char c;
      
      public dijkNode() {
         this('X');  // random char value for placement holder
      }
      
      // post: constructs a node for dijkstra with path null
      public dijkNode(char c) {
         this.c = c;
      }
   
}