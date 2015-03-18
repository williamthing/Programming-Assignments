   // William Thing
   // CSE373 HW6
   import java.util.*;
   
   public class Graph {
      public int[][] g =
               {
               {0, 5, 3, 0, 0, 0, 0},
               {0, 0, 2, 0, 3, 0, 1},
               {0, 0, 0, 7, 7, 0, 0},
               {2, 0, 0, 0, 0, 6, 0},
               {0, 0, 0, 2, 0, 1, 0},
               {0, 0, 0, 0, 0, 0, 0},
               {0, 0, 0, 0, 1, 0, 0}
               };
      
      public dijkNode[] nodes = new dijkNode[7]; // all 7 nodes
      
      // post: constructs given graph in problem # 3
      public Graph() {
      
      }
   }