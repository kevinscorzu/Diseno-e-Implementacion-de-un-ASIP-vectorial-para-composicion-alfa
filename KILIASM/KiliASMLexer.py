import ply.lex as lex


tokens = [
    'COMA', 'PUNTOCOMA','DOSPUNTOS',
    'REGESCALAR', 'REGVECTORIAL', 'IMM', 'LABEL'
]


reservadas = {
    #Escalares
    'STR': 'STR',
    'LDR': 'LDR',
    'MOVR': 'MOVR',
    'MOVI': 'MOVI',
    'ADD': 'ADD',
    'SUB': 'SUB',
    'MUL': 'MUL',
    'MOD': 'MOD',
    'CMPR': 'CMPR',
    'CMPI': 'CMPI',
    'JMP': 'JMP',
    'JEQ': 'JEQ',
    'STL': 'SIG',
    #Vectoriales
    'STRV': 'STRV',
    'LDRV': 'LDRV',
    'ADDVV': 'ADDVV',
    'MULVE': 'MULVE',
    'DIVVE': 'DIVVE'
}

tokens = tokens + list(reservadas.values())

t_ignore = ' \t'

t_COMA = r','
t_PUNTOCOMA = r';'
t_DOSPUNTOS = r':'

def t_REGESCALAR(t):
    r'[R][0-9]+'
    if t.value.upper() in reservadas:
        t.value = t.value.upper()
        t.type = t.value
    return t

def t_REGVECTORIAL(t):
    r'[V][0-9]+'
    if t.value.upper() in reservadas:
        t.value = t.value.upper()
        t.type = t.value
    return t


def t_LABEL(t):
    r'[a-zA-Z_][a-zA-Z0-9_#@]*'
    if t.value.upper() in reservadas:
        t.value = t.value.upper()
        t.type = t.value
    return t



def t_newLine(t):
    r'\n+'
    t.lexer.lineno += len(t.value)


def t_IMM(t):
    r'\d+'
    t.value = int(t.value)

    return t

def t_error(t):
    print("Caracter ilegal '%s'" % t.value[0])
    t.lexer.skip(1)




def KILIASMLexicalAnalizer(cadena):
    print(cadena)
    lexerResult = []
    analizador = lex.lex()
    analizador.input(cadena)
    while True:
        tok = analizador.token()
        if not tok: break
        lexerResult.append(tok)
    print(lexerResult)
    return lexerResult


file = open("code")
line = file.read()

KILIASMLexicalAnalizer(line)
