%%

%standalone
%line
%column
%class Scanner

letra = [A-Za-z]
digito = [0-9]
digitos = {digito}{digito}*
ident = {letra}({letra}|{digito})*

fimdeLinha = \\r|\\n|\\r\\n
branco = " "
espaco = ({fimdeLinha}|[ \\t]|{branco})*

KW_STRING = "String"
KW_COUT = "cout"
KW_CONCAT = "<<"
IGUAL = "="
PONTO_VIRGULA = ";"

aspas = \" 
texto = {aspas}[^\"]*{aspas}

declString = {KW_STRING}{espaco}{ident}{espaco}{IGUAL}{espaco}{texto}{PONTO_VIRGULA}

msgTelaVar = {KW_COUT}{espaco}{KW_CONCAT}{espaco}{texto}{espaco}{KW_CONCAT}{espaco}{ident}{PONTO_VIRGULA}

%%

{declString} {System.out.println("<declString: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" );}

{msgTelaVar} {System.out.println("<msgTelaVar: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" );}