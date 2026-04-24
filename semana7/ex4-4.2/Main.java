import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        Scanner scanner = new Scanner(reader);
        parser parser = new parser(scanner);

        try {
            parser.parse();
            System.out.println("Arquivo sem erros de sintaxe!");
        } catch (Exception e) {
            System.out.println("Erro de sintaxe: " + e.getMessage());
        }
    }
}
