

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class FileInput {
	private static Scanner sInput;
	private static Scanner bInput;

	public static void init(){
		File shakespeare = new File("hamlet.txt");
		File bacon = new File("bacon-essays.txt");
		try {
			sInput = new Scanner(shakespeare);
			bInput = new Scanner(bacon);
		} catch (FileNotFoundException e) {
			System.err.println("Make sure hamlet.txt and the-new-atlantis.txt are in their appropriate place");
		}

	}
	public static String[] readShakespeare(){
		String[] shakes = new String[10000000];
		int i;
		for(i=0;sInput.hasNext();i++){		
			String toInput = sInput.next().replaceAll("[^a-zA-Z ]", "").toLowerCase();
			if (toInput.compareTo("")==0){
				i--;
				continue;
			} else shakes[i] = toInput;
		}
		String[] s = new String[i];
		i--;
		while(i>=0){
			s[i]=shakes[i];
			i--;
		}
		return s;
	}
	public static String[] readBacon(){
		String[] bac = new String[10000000];
		int i;
		for(i=0;bInput.hasNext();i++){
			String toInput = bInput.next().replaceAll("[^a-zA-Z ]", "").toLowerCase();
			if (toInput.compareTo("")==0){
				i--;
				continue;
			} else bac[i] = toInput;
		}
		String[] b = new String[i];
		i--;
		while(i>=0){
			b[i]=bac[i];
			i--;
		}
		return b;
	}	
	
}
