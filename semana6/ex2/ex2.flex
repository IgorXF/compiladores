import java_cup.runtime.Symbol;

%%

%class Scanner
%unicode
%cup
%line
%column
%public

%{
		public Scanner(java.io.InputStream in) {
				this(new java.io.InputStreamReader(in, java.nio.charset.Charset.forName("UTF-8")));
		}
%}

digito = [0-9]
letra = [a-zA-Z]
inteiro = {digito}+

fimdeLinha = \r|\n|\r\n
espaco = {fimdeLinha} | [ \t\f]
opMais = "+"

%%

{inteiro} { 
	int aux = Integer.parseInt (yytext());
	return new Symbol (sym.INTEIRO, new Integer(aux)); 
}

/**
 * O do atributo sym.<nome> que usaremos aqui
 * é o nome que demos la no arquivo .cup 
 */	
{opMais} { return new Symbol(sym.MAIS);	}

"-" { return new Symbol(sym.MENOS);}
"/" { return new Symbol(sym.DIV);}
"*" { return new Symbol(sym.MULT);}
"%" { return new Symbol(sym.MOD);}
";" { return new Symbol(sym.PTVIRG);}

{espaco} { /* despreza */ }

.|\n { /* Caractere inválido */ 		
	return new Symbol(sym.EOF, yyline, yycolumn, yytext());		
	}