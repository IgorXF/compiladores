import java.io.*;
import java.io.FileInputStream;

class Main {
    public static void main(String[] args) throws Exception {
        // Para ler a entrada do teclado:
        // Scanner scanner = new Scanner(System.in);

        // Para ler do arquivo:
        FileInputStream in = new FileInputStream("teste.txt");
        Scanner scanner = new Scanner(new InputStreamReader(in));

        parser parser = new parser(scanner);
        try {
            parser.parse();
            System.out.println("Arquivo sem erros de sintaxe!");
        } catch (Exception e) {
            System.out.println("Erro de sintaxe: " + e);
        }
    }
}
