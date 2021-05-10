import ply.yacc as yacc

import codecs

from KiliASMLexer import *

sintaxResult = []

def p_Start(p):
    '''
    Start : code
    '''


def p_Code(p):
    '''
    code : INICIO DOSPUNTOS cuerpo FIN
    '''

def p_cuerpo(p):
    '''
    cuerpo : instruccion
            | label
            | comment
    '''
    p[0] = (p[1])
    #sintaxResult.append(p[0])
def p_Comment(p):
    '''
    comment : COMMENT  cuerpo
            | COMMENT empty

    '''

    #sintaxResult.append(p[0])

def p_label(p):
    '''
    label : LABEL DOSPUNTOS cuerpo
            | empty
    '''

    if (p[1] != '$'):
        p[0] = (p[1])
        sintaxResult.append(p[0])
    else:
        p[0] = p[1]
def p_instruccion(p):
    '''
    instruccion : instructionDI
                  | instructionI
                  | instructionDT
                  | instructionN
                  | instructionSTL
    '''
    p[0] = p[1]
    #sintaxResult.append(p[0])

def p_instructionSTL(p):
    '''
    instructionSTL : STL PUNTOCOMA cuerpo
                    | empty
    '''
    p[0] = (p[1], 0)
    #print(p[0])
    sintaxResult.append(p[0])

def p_instructionDI(p):
    '''
    instructionDI : instructionDIName REG COMA REG PUNTOCOMA cuerpo

                        | empty
    '''
    p[0] = (p[1],p[2],p[4])
    sintaxResult.append(p[0])
    #print(p[0])
def p_instructionI(p):
    '''
    instructionI : instructionIName REG COMA IMM PUNTOCOMA cuerpo
    | empty
    '''
    p[0] = (p[1], p[2], p[4])
    sintaxResult.append(p[0])
    #print(p[0])

def p_REG(p):
    '''
    REG : REGESCALAR
        | REGVECTORIAL
    '''
    p[0] = p[1]

    #print(p[0])

def p_instructionDT(p):
    '''
    instructionDT : instructionDTName REG COMA REG COMA REG PUNTOCOMA cuerpo
                        | empty
    '''
    p[0] = (p[1], p[2], p[4], p[6])
    sintaxResult.append(p[0])
    #print(p[0])




def p_instructionN(p):
    '''
    instructionN :  instructionNName LABEL PUNTOCOMA cuerpo
                        | empty
    '''
    p[0] = (p[1], p[2])
    sintaxResult.append(p[0])

def p_instructionDIName(p):
    '''
    instructionDIName :  STR
            | LDR
            | MOVR
            | CMPR
            | STRV
            | LDRV

    '''

    p[0] = p[1]


def p_instructionIName(p):
    '''
    instructionIName : MOVI
            | CMPI
    '''

    p[0] = p[1]


def p_instructionDTName(p):
    '''
    instructionDTName :  ADD
            | SUB
            | MUL
            | DIV
            | ADDVV
            | SUBVV
            | MULVE
            | DIVVE
    '''

    p[0] = p[1]

def p_instructionNName(p):
    '''
    instructionNName :  JMP
            | JEQ
            | STL
    '''

    p[0] = p[1]

def p_empty(p):
    '''
    empty :
    '''
    p[0] = '$'

def p_error(p):
    print("error de sintaxis " + str(p))
    print("error en la linea " + str(p.lineno))

def KiliASMSintacticAnalizer(cadena):
    parser = yacc.yacc()
    parser.parse(cadena)
    return sintaxResult[::-1]
# documentar esta funcion si va a probar codigo en el GUI


def test():
    # directorio = os.path.dirname(os.getcwd()) + "/Tests/"
    # archivo = buscarFichero(directorio)
    # test = directorio + archivo

    test = 'code'

    fp = codecs.open(test, "r", "utf-8")
    cadena = fp.read()
    fp.close()



    KILIASMLexicalAnalizer(cadena)
    print(KiliASMSintacticAnalizer(cadena))


