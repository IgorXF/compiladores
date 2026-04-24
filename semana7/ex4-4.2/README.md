# Exercício 04 - ex4-4.2

## Arquivos

- `scanner.flex` - scanner JFlex para tokens `GANHA`, `PERDE`, `+`, `;` e inteiros.
- `parser.cup` - gramática CUP que avalia expressões e imprime mensagens de cada produção.
- `Main.java` - programa Java que lê da entrada padrão e executa o parser.
- `entrada.txt` - exemplo de entrada para testar.

## Respostas do exercício

### 1. Ordem das mensagens exibidas para `GANHA 10 + PERDE 3 + GANHA 2;`

A saída será:

```
Ganhou 10
Perdeu 3
Ganhou 2
Atualizando saldo
Atualizando saldo
Saldo final = 9
```

### 2. Saldo final

O saldo final é `9`.

### 3. Por que as mensagens de `Ganhou` e `Perdeu` aparecem antes de `Atualizando saldo`?

Porque a gramática é avaliada de baixo para cima. As produções `GANHA INTEIRO` e `PERDE INTEIRO` são folhas da árvore sintática e são reduzidas primeiro. O nó `expr MAIS expr` só executa seu código após ambos os filhos terem sido avaliados.

### 4. Se a entrada fosse `GANHA 5 + (PERDE 2 + GANHA 1);`

O resultado final não mudaria: ainda seria `4`.

Isso acontece porque a adição de inteiros é associativa e o valor de cada termo é o mesmo. A diferença seria apenas no agrupamento da árvore, mas não no saldo final.

## Como rodar

1. Gere o scanner e o parser:

```bash
cd /home/igor/compiladores/semana7/ex4-4.2
jflex scanner.flex
java -jar ../ex2/java-cup-11b.jar parser.cup
```

2. Compile os arquivos Java:

```bash
javac Main.java parser.java sym.java Scanner.java
```

3. Execute com a entrada de teste:

```bash
java Main < entrada.txt
```

> Observação: o `java-cup-11b.jar` está disponível em `../ex2/java-cup-11b.jar`.
