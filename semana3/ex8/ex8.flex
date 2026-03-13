%%

%standalone
%line
%column
%class Scanner

letra = [A-Za-z]
digito = [0-9]
digitos = {digito}{digito}*
ident = {letra}({letra}|{digito})*

espaco = [ \t\r\n]*
espacoSimples = [ \t\r\n]+

KW_STRING = "String"
KW_FLOAT = "float"
KW_WHILE = "while"
KW_COUT = "cout"

KW_CONCAT = "<<"
IGUAL = "="
MENOR_IGUAL = "<="

PONTO_VIRGULA = ";"
ABRE_PAR = "("
FECHA_PAR = ")"
ABRE_CHAVE = "{"
FECHA_CHAVE = "}"

aspas = \"
texto = {aspas}[^\"]*{aspas}

fracao = ("."{digitos})?
exponencial = ("E"("+"|"-")?{digitos})?
numReal = ("-"?){digitos}{fracao}{exponencial}

declString = {KW_STRING}{espaco}{ident}{espaco}{IGUAL}{espaco}{texto}{espaco}{PONTO_VIRGULA}
declFloat = {KW_FLOAT}{espaco}{ident}{espaco}{PONTO_VIRGULA}

msgTela = {KW_COUT}{espaco}{KW_CONCAT}{espaco}{texto}{espaco}{PONTO_VIRGULA}
msgTelaVar = {KW_COUT}{espaco}{KW_CONCAT}{espaco}{texto}{espaco}{KW_CONCAT}{espaco}{ident}{espaco}{PONTO_VIRGULA}

whileLoop = {KW_WHILE}{espaco}{ABRE_PAR}{espaco}{ident}{espaco}{MENOR_IGUAL}{espaco}{digitos}{espaco}{FECHA_PAR}

atribuicaoNum = {ident}{espaco}{IGUAL}{espaco}{numReal}{espaco}{PONTO_VIRGULA}

%%

{declString} {
System.out.println("<declString: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" );
}

{declFloat} {
System.out.println("<declFloat: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" );
}

{msgTela} {
System.out.println("<msgTela: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" );
}

{msgTelaVar} {
System.out.println("<msgTelaVar: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" );
}

{whileLoop} {
System.out.println("<while: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" );
}

{atribuicaoNum} {
System.out.println("<atribuicaoNum: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" );
}

{ABRE_CHAVE} {
System.out.println("<abreChave: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" );
}

{FECHA_CHAVE} {
System.out.println("<fechaChave: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" );
}

{espacoSimples} { /* ignora espaços */ }

. { /* ignora qualquer outro caractere */ }