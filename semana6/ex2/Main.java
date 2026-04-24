import java.io.*;
import java.io.FileInputStream;

class Main {
	  static public void main(String argv[]) {        
				try {
						parser p = new parser(new Scanner(System.in));
			      Object result = p.parse().value;     
				} catch (Exception e) {
						e.printStackTrace();
				}
		}
}