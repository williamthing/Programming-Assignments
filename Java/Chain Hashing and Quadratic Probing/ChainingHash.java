// William Thing
// CSE 373 Homework 5
//
// This program constructs a hashtable that handles
// collision by linking words in the same bucket

public class ChainingHash {
		private HashNode[] hashTable;
		private HashNode lastPointer;
		private int lastIndex;
		
		public static final int PRIME_SIZE = 31649;

		private class HashNode {
			private String word;
			private int wordCount;
			private HashNode next; 
			
			//	post:	constructs HashNode with given word and sets occurrence of word
			//			to one.
			public HashNode(String word) {
				this.word = word;
				wordCount = 1; // sets the first count of the given word
			}	
		}
		
		//	post:	constructs a ChainingHash with a default size that is a prime.
		public ChainingHash() {
			this(PRIME_SIZE);			
		}
		
		//	post:	constructs a ChainingHash with a given size.
		public ChainingHash(int startSize){
			hashTable = new HashNode[startSize];
			lastIndex = -1;	// sets starting index to first index of hashTable
			lastPointer = null;
		}
		
		//	post:	returns the next key in the hashtable. If all keys have been
		//			returned then will return null.
		public String getNextKey(){
			if (lastIndex >= hashTable.length) {
				return null;
			}
			if (lastPointer != null) {
				if (lastPointer.next != null) {
					lastPointer = lastPointer.next;
					return lastPointer.word;
				} else {
					lastIndex++;
					if (lastIndex >= hashTable.length) {	// catch for out of array bound
						return null;
					}
					lastPointer = hashTable[lastIndex];
					return getNextKey();
				}
			} else {
				lastIndex++;
				if (lastIndex >= hashTable.length) {		// catch for out of array bound
					return null;
				}
				lastPointer = hashTable[lastIndex];
				if (lastPointer == null) {
					return getNextKey();
				} else {
					return lastPointer.word;
				}
			}
		}
		
		//	pre:	takes in a given key to add to the hashTable
		//	post:	inserts the given key to hashtable, if the given key
		//			already exist then the count of that key will be incremented.
		//			if a previous inserted key already exist at the insert position 
		//			then the given key is linked next to the previous word.
		public void insert(String keyToAdd){
			int index = index(keyToAdd);
			if (hashTable[index] != null) {
				if (hashTable[index].word.equals(keyToAdd)) {
					hashTable[index].wordCount++;
				} else {
					boolean wordFound = false;
					HashNode current = hashTable[index];
					while (current.next != null) {
						current = current.next;
						if (current.word.equals(keyToAdd)) {
							current.wordCount++;
							wordFound = true;
						}
						if (!wordFound) {
							current.next = new HashNode(keyToAdd);
						}
					}
				}
			} else {
				hashTable[index] = new HashNode(keyToAdd);
			}
		}
		
		//	pre:	takes in given key to find.
		//	post:	returns the number of occurrence of the given word. If not found
		//			returns 0.
		public int findCount(String keyToFind){
			HashNode current = hashTable[index(keyToFind)];
			if (current != null) {
				while (current != null) {
					if (current.word.equals(keyToFind)) {
						return current.wordCount;
					}
					current = current.next;
				}
			}
			return 0; // Key is not found	
		}
		
		//	post:	returns the hashTable index of the given word
		private int index(String word) {
			return Math.abs(hash(word)) % hashTable.length;
		}
		
		private int hash(String keyToHash) {
			int value = 0;
			for (int i = 0; i < keyToHash.length(); i++) {
				value += (int) keyToHash.charAt(i) + 10;
			}
			return (value * (int) keyToHash.charAt(0)) % hashTable.length;
		}
}
