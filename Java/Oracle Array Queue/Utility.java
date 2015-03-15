import java.util.Random;
import java.util.Scanner;
import java.io.FileNotFoundException;
import java.io.File;

//THIS FILE SHOULD NOT BE MODIFIED

public class Utility {
	
	private static Scanner qInput;
	private static Scanner aInput;
	private static Random rand;
	
	/**
	 * @function Initializes the file readers and the random number generator
	 */
	public static void init(){
		rand = new Random();
		File ans = new File("answers.txt");
		File que = new File("questions.txt");
		try {
			aInput = new Scanner(ans);
			qInput = new Scanner(que);
		} catch (FileNotFoundException e) {
			System.err.println("Make sure answers.txt and questions.txt are in their appropriate place");
		}

	}
	/**
	 * @function reads the questions from "questions.txt"
	 * @return returns the questions in an array of Strings where each line is an element
	 */
	
	public static String[] readQuestions(){
		String[] questions = new String[100];
		int i;
		for(i=0;qInput.hasNext();i++){
			questions[i] = qInput.nextLine();
		}
		String[] q = new String[i];
		i--;
		while(i>=0){
			q[i]=questions[i];
			i--;
		}
		return q;
	}
	/**
	 * @function reads the answers from "answers.txt"
	 * @return returns the answers in an array of Strings where each line is an element
	 */
	
	public static String[] readAnswers(){
		String[] answers = new String[100];
		int i;
		for(i=0;aInput.hasNext();i++){
			answers[i] = aInput.nextLine();
		}
		String[] a = new String[i];
		i--;
		while(i>=0){
			a[i]=answers[i];
			i--;
		}
		return a;
	}
	/**
	 * @function useful for assigning a question to an oracle
	 * @param numOracles: the number of possible oracles
	 * @return returns a random number between 0 and the number of oracles
	 */
	public static int random(int numOracles){
		return rand.nextInt(numOracles);
	}
}
