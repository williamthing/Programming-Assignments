// William Thing, CSE 373, Winter 2015, 
// Programming Assignment #1, 1/11/2015
//
// This class keeps track of Strings in a queue. It has the ability to
// add elements to the end of the queue and remove elements at the front
// of the queue depending if the queue is empty or full. 

public class ArrayQueue {
	private String[] queueArray;
	private int size;
	private int front;
	private int back;
	
   // post: Constructs an ArrayQueue with capacity of 100.
	public ArrayQueue(){
		queueArray = new String[100];
		size = 0;
		front = 0;
		back = -1;
	}
	
   // pre:  Takes in a starting size value.
   // post: Constructs an ArrayQueue with a given starting size.
	public ArrayQueue(int startSize){
		queueArray = new String[startSize];
		size = 0;
		front = 0;
		back = -1;
	}

	// post: Return the number of elements in the queue.
	public int getSize(){
		return size;
	}
    
   // pre:  Takes input String to be inserted to the queue.
   // post: Adds a string to the end of the queue.  
	public void enqueue(String toEnqueue){
      if (isFull()) {
         System.err.println("Cannot enqueue, queue is full.");
      }
      back = (back + 1) % queueArray.length;
      queueArray[back] = toEnqueue;
      size++;
	}

   // pre:  If queue is empty returns null.
   // post: Removes the string from the front of the queue
   //       and returns it.
	public String dequeue(){
      if (isEmpty()) {
         return null;
      }
		String toDequeue = queueArray[front];
      front = (front + 1) % queueArray.length;
      size--;
		return toDequeue;
	}
	
   // post: Returns true if the queue is empty, false otherwise.
	public boolean isEmpty(){
		return size == 0;
	}

   // post: Returns true if the queue is full, false otherwise.
	public boolean isFull(){
		return size == queueArray.length;
	}
}
