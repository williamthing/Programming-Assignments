// William Thing
// CSE 373 Homework 5
// 
// This program constructs a hashtable that handles
// collision by quadratic probing

public class QPHash {
		private hashData[] hashTable;
		private int lastIndex;
		
		public static final int PRIME_SIZE = 210671;
		
		private class hashData {
			private String word;
			private int wordCount;
			
			//	post:	Construct hashData with given word that keeps track of the occurrence
			//			of the word. When created counts as 1.
			public hashData(String word) {
				this.word = word;
				wordCount = 1;
			}
		}
		
		//	post:	default constructor using a default size.
		public QPHash() {
			this(PRIME_SIZE);
		}
		
		//	post:	constructs a QPHash with a given size.
		public QPHash(int startSize) {
			hashTable = new hashData[startSize];
			lastIndex = -1;
		}

		//	post:	returns the next key in the hashtable. If all keys have been
		//			returned then will return null.
		public String getNextKey() {
			if (lastIndex >= hashTable.length) {
				return null;
			}
			lastIndex++;
			while (lastIndex < hashTable.length && hashTable[lastIndex] == null) {
				lastIndex++;
			}
			if (lastIndex < hashTable.length) {
				return hashTable[lastIndex].word;
			} else {
				return null;
			}
		}

		//	pre:	takes in a given key to add to the hashTable
		//	post:	inserts the given key to hashtable, if the given key
		//			already exist then the count of that key will be incremented.
		//			if a previous inserted key already exist at the insert position 
		//			then the given key is inserted in an index corresponding to
		//			the amount of collisions.
		public void insert(String keyToAdd){
			insert(keyToAdd, index(keyToAdd), 1);
		}
		
		//	pre:	takes in a given key to add to the hashTable, current index
		//			and number of collisions.
		//	post:	inserts the given key to hashtable, if the given key
		//			already exist then the count of that key will be incremented.
		//			if a previous inserted key already exist at the insert position 
		//			then the given key is inserted in an index corresponding to
		//			the given amount of collisions.
		private void insert(String key, int currentIndex, int collisions) {
			if (hashTable[currentIndex] == null) {
				hashTable[currentIndex] = new hashData(key);
			} else if (hashTable[currentIndex].word.equals(key)) {
				hashTable[currentIndex].wordCount++;
			} else {
				insert(key, (currentIndex + (int)Math.pow(collisions, 2)) % hashTable.length, collisions + 1);
			}
		}
		
		//	pre:	takes in given key to find.
		//	post:	returns the number of occurrence of the given word. If not found
		//			returns 0.
		public int findCount(String keyToFind) {
			return findCount(keyToFind, index(keyToFind), 0);
		}
		
		//	post: 	takes the original/current index of a keyword and returns given occurrence
		//			of that word through the number of collisions.
		//			if the given word is not found then returns 0.
		private int findCount(String keyword, int currentIndex, int collisions) {
			if (hashTable[currentIndex + (int)Math.pow(collisions, 2)]  != null) {
				if (hashTable[currentIndex + (int)Math.pow(collisions, 2)].word.equals(keyword)) {
					return hashTable[currentIndex + (int)Math.pow(collisions,2)].wordCount;
				} else {
					return findCount(keyword, currentIndex + (int)Math.pow(collisions, 2), collisions + 1);
				}
			} else {
				return 0;	// end of search and given word is not found
			}
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
