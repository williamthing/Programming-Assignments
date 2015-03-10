// William Thing
// CSE 373 Homework 5
// 
// This program inserts words from two given text files
// a put each text in a different hash table to calculate
// the total square error and word with the highest distance.
// Printing the solution to the console at the end.

public class Test {

	public static void main(String[] args) {
		FileInput.init();
		
		// Initialize two hash tables 
		ChainingHash shakespeareTable = new ChainingHash();
		QPHash baconTable = new QPHash();
		
		// takes words from two given text files
		String[] hamlet = FileInput.readShakespeare();
		String[] bacon = FileInput.readBacon();
		

		// Input elements of two files into two hash tables,
		// one file into a ChainingHash object and the other into a QPHash object.
		for (String word : hamlet) {
			shakespeareTable.insert(word);
		}
		
		for (String word : bacon) {
			baconTable.insert(word);
		}
		
		String word = shakespeareTable.getNextKey();
		double sqError = 0;
		String diffWord = baconTable.getNextKey();
		double maxDiff = 0;
		String mostDiff = "";
		
		// Iterate through the first hash table and add sum the squared error
		// for these words.
		while (word != null) {
			double currentDiff = shakespeareTable.findCount(word) / (double) hamlet.length - 
								baconTable.findCount(word) / (double) bacon.length;
			double freq = currentDiff * currentDiff;

			if (freq > maxDiff) {
				maxDiff = freq;
				mostDiff = word;
			}
			sqError += freq;
			word = shakespeareTable.getNextKey();
		}
		
		// Find  words in the second hash table that are not in the first and add their squared error
		// to the total
		while (diffWord != null) {
			if (shakespeareTable.findCount(diffWord) == 0) {
				double baconFreq = baconTable.findCount(diffWord) / (double) bacon.length;
				double freq = baconFreq * baconFreq;

				if (freq > maxDiff) {
					maxDiff = freq;
					mostDiff = diffWord;
				}
				sqError += freq;
			}
			diffWord = baconTable.getNextKey();
		}
		
		// Print total calculated squared error for the two tables.
		System.out.println("Total Error: " + sqError);
		
		// Print the word with the highest distance.
		System.out.println("The most different word is: " + mostDiff);
	}
}
