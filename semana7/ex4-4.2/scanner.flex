import java_cup.runtime.Symbol;

%%

%class Scanner
%unicode
%cup
%line
%column
%public

DIGITO = [0-9]

%%

"GANHA"     { return new Symbol(sym.GANHA); }
"PERDE"     { return new Symbol(sym.PERDE); }

"+"         { return new Symbol(sym.MAIS); }
";"         { return new Symbol(sym.PTVIRG); }

{DIGITO}+    {
                Integer val = Integer.valueOf(yytext());
                return new Symbol(sym.INTEIRO, val);
             }

[ \t\r\n]+ { /* ignora espaços em branco */ }

.            { System.out.println("Caractere inválido: " + yytext()); }
