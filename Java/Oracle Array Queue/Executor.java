// William Thing, CSE 373, Winter 2015, 
// Programming Assignment #1, 1/11/2015
//
// This class has ten oracles that answer random questions in a
// round robin fashion. Each oracle has one answer for each
// question. Oracles will answer questions until there are no
// more left.

public class Executor {

	public static void main(String[] args) {
		Utility.init(); // initializes file readers
		String[] questions = Utility.readQuestions(); // reads question.txt file into questions array
		String[] answers = Utility.readAnswers(); // reads answers.txt file into answers array

		int numOracles = answers.length; // finds the number of oracles
      
		// TO DO Assign questions to oracles using Utility.random and print the question
      // paired with the oracle response
      // 1. Initialize one ArrayQueue per oracle (arrays will work best).
      ArrayQueue[] oracles = new ArrayQueue[numOracles];
      for (int i = 0; i < numOracles; i++) {
         oracles[i] = new ArrayQueue();
      }
		// 2. Put the questions into the queues, assigning each one to the queue of the
      // oracle whose number is returned by the random number generator.
      for (int i = 0; i < questions.length; i++) {
         oracles[Utility.random(numOracles)].enqueue(questions[i]);
      } 
		// 3. Loop through the oracles, having each one remove a question from its 
      // queue (if empty do nothing) and answer it with its unique answer
      // (oracle[k] uses answers[k]). Do this repeatedly till all queues become empty.
	   int counter = 0;
      int index = 0;
      while (counter < questions.length) {
         if (!oracles[index].isEmpty()) {
            System.out.print(oracles[index].dequeue().trim());
            System.out.println(": " + answers[index]);
            counter++;
         }
         if (index == numOracles - 1) {   // Reset index
            index = 0;
         } else {
            index++;
         }
      }  
   }
}

