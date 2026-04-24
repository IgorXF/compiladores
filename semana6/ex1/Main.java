import java.io.*;
import java.io.FileInputStream;

class Main {
	  static public void main(String argv[]) {        
				try {
						Scanner sc = new Scanner(System.in);
						parser p = new parser(sc);
			      Object result = p.parse().value;     
				} catch (Exception e) {
						e.printStackTrace();
				}
		}
}