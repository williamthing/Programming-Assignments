// William Thing
// 3/7/15
// CSE373 HW6

import java.util.*;

public class CSE373HW6 {

   public static final char[] absolute = {'A', 'B', 'C', 'D', 'E', 'F', 'G'};

   public static void main(String[] args) {
      Set<dijkNode> graphSet = new HashSet<dijkNode>();
      dijkNode A = new dijkNode('A');
      dijkNode B = new dijkNode('B');
      dijkNode C = new dijkNode('C');
      dijkNode D = new dijkNode('D');
      dijkNode E = new dijkNode('E');
      dijkNode F = new dijkNode('F');
      dijkNode G = new dijkNode('G');
      Graph graphy = new Graph();
      graphy.nodes[0] = A;
      graphy.nodes[1] = B;
      graphy.nodes[2] = C;
      graphy.nodes[3] = D;
      graphy.nodes[4] = E;
      graphy.nodes[5] = F;
      graphy.nodes[6] = G;
      dijkstra(graphy, A);
      for (int i = 1; i < graphy.nodes.length; i++) {
         System.out.println('A' + " -> " + graphy.nodes[i].c);
         System.out.println("shortest Path: " + graphy.nodes[i].cost);   
      }
   }
   
   // post: finds and prints the shortest path from A to every other character
   public static void dijkstra(Graph a, dijkNode start) {
      for (dijkNode node : a.nodes) {
         node.cost = Integer.MAX_VALUE; // infinity
         node.known = false; // set to false
      }
      start.cost = 0;   // starts A = 0
      while (isUnknown(a)) {
         dijkNode lowest = getLowCost(a);
         lowest.known = true;
         int firstIndex = getIndex(lowest.c);
            for (int i = 0; i < absolute.length; i++) {
               if (a.g[firstIndex][i] > 0) { // if not zero then exist, else doesn't exist
                  dijkNode temp = a.nodes[i];
                  if (!temp.known) {
                     if ((lowest.cost + weight(lowest, temp, a)) < temp.cost) {
                        temp.cost = lowest.cost + weight(lowest, temp, a);
                        temp.path = lowest;
                     }
                  }
               }
            }   
      }
   }
   
   // post: returns if false if all are unknown, true otherwise.
   private static boolean isUnknown(Graph a) {
      for (dijkNode node : a.nodes) {
         if (node.known == false) {
            return true;
         }
      }
      return false;
   }
   
   // post: finds unknown lowest cost only and returns it
   private static dijkNode getLowCost(Graph a) {
      if (a == null) {     // if a is empty
         throw new IllegalArgumentException();
      }
      dijkNode lowTemp = new dijkNode();
      lowTemp.cost = Integer.MAX_VALUE; // sets to infinity for place holder
      for (dijkNode node : a.nodes) {
          if (!node.known && lowTemp.cost > node.cost) {
            lowTemp = node; // sets to lowest cost node
          }
      }
      return lowTemp;
   }
   
   // post: returns the weight between two nodes
   public static int weight(dijkNode current, dijkNode next, Graph a) {
      int one = getIndex(current.c);
      int two = getIndex(next.c);
      return a.g[one][two];   // returns weight
   }
   
   // post: returns the index of given Node
   private static int getIndex(char c) {
      for (int i = 0; i < absolute.length; i++) {
         if (absolute[i] == c) {
            return i;
         }  
      }
      return -1; // should throw illegal bound exception but should never
   }
}